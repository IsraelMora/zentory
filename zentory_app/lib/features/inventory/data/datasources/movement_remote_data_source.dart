import 'package:appwrite/appwrite.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/config/app_config.dart';
import 'package:zentory_app/common/utils/logger.dart';
import 'package:zentory_app/features/inventory/domain/entities/movement.dart';

abstract class MovementRemoteDataSource {
  Future<List<MovementEntity>> getMovements(
    String workspaceId, {
    int limit = 50,
    int offset = 0,
  });
  Future<MovementEntity> recordMovement(MovementEntity movement);
}

@LazySingleton(as: MovementRemoteDataSource)
class MovementRemoteDataSourceImpl implements MovementRemoteDataSource {
  final TablesDB _tablesDB;

  MovementRemoteDataSourceImpl(this._tablesDB);

  @override
  Future<List<MovementEntity>> getMovements(
    String workspaceId, {
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      ZentoryLogger.debug(
          'Obteniendo movimientos para workspace: $workspaceId');
      final response = await _tablesDB.listRows(
        databaseId: AppConfig.appwriteDatabaseId,
        tableId: AppConfig.movementsCollectionId,
        queries: [
          Query.equal('workspaceId', workspaceId),
          Query.orderDesc('\$createdAt'),
          Query.limit(limit),
          Query.offset(offset),
        ],
      );

      return response.rows.map((doc) {
        final data = doc.data;
        // Use Appwrite's built-in $createdAt
        final createdAt = doc.$createdAt;
        final reason = data['notes'] ?? '';
        return MovementEntity.fromJson({
          ...data,
          'id': doc.$id,
          'createdAt': createdAt,
          'reason': reason,
        });
      }).toList();
    } catch (e, stackTrace) {
      ZentoryLogger.error(
          'Error al obtener movimientos de Appwrite', e, stackTrace);
      throw Exception('Error al obtener movimientos: $e');
    }
  }

  @override
  Future<MovementEntity> recordMovement(MovementEntity movement) async {
    try {
      ZentoryLogger.info('Registrando movimiento de ${movement.productName}');
      final data = movement.toJson()..remove('id');

      // Map entity fields to Appwrite schema fields
      // movementDate is removed as Appwrite uses $createdAt by default
      data['notes'] = movement.reason;
      data.remove('createdAt');
      data.remove('reason');

      final response = await _tablesDB.createRow(
        databaseId: AppConfig.appwriteDatabaseId,
        tableId: AppConfig.movementsCollectionId,
        rowId: ID.unique(),
        data: data,
      );
      return movement.copyWith(id: response.$id);
    } catch (e, stackTrace) {
      ZentoryLogger.error(
          'Error al registrar movimiento en Appwrite', e, stackTrace);
      throw Exception('Error al registrar movimiento: $e');
    }
  }
}
