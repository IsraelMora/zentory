import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/common/network/connectivity_bloc.dart';
import 'package:zentory_app/common/utils/logger.dart';
import 'package:zentory_app/data/datasources/inventory_local_data_source.dart';
import 'package:zentory_app/data/datasources/inventory_remote_data_source.dart';
import 'package:zentory_app/data/datasources/movement_local_data_source.dart';
import 'package:zentory_app/data/datasources/movement_remote_data_source.dart';
import 'package:zentory_app/domain/entities/product.dart';
import 'package:zentory_app/domain/entities/movement.dart';

@lazySingleton
class SyncManager {
  final ConnectivityBloc _connectivityBloc;
  final InventoryLocalDataSource _inventoryLocal;
  final InventoryRemoteDataSource _inventoryRemote;
  final MovementLocalDataSource _movementLocal;
  final MovementRemoteDataSource _movementRemote;

  StreamSubscription? _subscription;
  bool _isSyncing = false;

  SyncManager(
    this._connectivityBloc,
    this._inventoryLocal,
    this._inventoryRemote,
    this._movementLocal,
    this._movementRemote,
  );

  void init() {
    _subscription = _connectivityBloc.stream.listen((state) {
      if (state == ConnectivityStatus.online) {
        ZentoryLogger.i('Red recuperada. Iniciando sincronización...');
        syncPendingItems();
      }
    });
  }

  Future<void> syncPendingItems() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      await _syncProducts();
      await _syncMovements();
    } catch (e) {
      ZentoryLogger.e('Error durante la sincronización automática', e);
    } finally {
      _isSyncing = false;
    }
  }

  Future<void> _syncProducts() async {
    final pending = _inventoryLocal.getPendingProducts();
    if (pending.isEmpty) return;

    ZentoryLogger.i('Sincronizando ${pending.length} productos pendientes...');

    for (final item in pending) {
      try {
        final product = ProductEntity(
          id: item.remoteId,
          workspaceId: item.workspaceId,
          name: item.name,
          description: item.description,
          price: item.price,
          stock: item.stock,
          imageUrl: item.imageUrl,
          category: item.category ?? 'General',
        );

        // Si el ID remoto es un UUID generado localmente (o similar), appwrite lo manejará
        // En este caso, asumimos que updateProduct o addProduct funcionarán
        // Si no tiene un ID real, intentamos addProduct
        late ProductEntity result;
        if (item.remoteId.length < 10) {
          // Ejemplo de check simple
          result = await _inventoryRemote.addProduct(product);
        } else {
          result = await _inventoryRemote.updateProduct(product);
        }

        await _inventoryLocal.markAsSync(item.id, result.id);
        ZentoryLogger.i('Producto ${item.name} sincronizado correctamente.');
      } catch (e) {
        ZentoryLogger.w('No se pudo sincronizar producto ${item.name}: $e');
      }
    }
  }

  Future<void> _syncMovements() async {
    final pending = _movementLocal.getPendingMovements();
    if (pending.isEmpty) return;

    ZentoryLogger.i(
      'Sincronizando ${pending.length} movimientos pendientes...',
    );

    for (final item in pending) {
      try {
        final movement = MovementEntity(
          id: item.remoteId,
          productId: item.productId,
          productName: item.productName,
          workspaceId: item.workspaceId,
          type: MovementType.values.firstWhere((e) => e.name == item.type),
          quantity: item.quantity.toInt(),
          reason: item.reason ?? '',
          createdAt: item.createdAt,
          userId: item.createdBy,
        );

        final result = await _movementRemote.recordMovement(movement);
        await _movementLocal.markAsSync(item.id, result.id);
        ZentoryLogger.i('Movimiento sincronizado correctamente.');
      } catch (e) {
        ZentoryLogger.w('No se pudo sincronizar movimiento: $e');
      }
    }
  }

  void dispose() {
    _subscription?.cancel();
  }
}
