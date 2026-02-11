import 'package:injectable/injectable.dart' hide Order;
import 'package:zentory_app/core/database/entities.dart';
import 'package:zentory_app/core/database/objectbox_database.dart';
import 'package:zentory_app/features/inventory/domain/entities/movement.dart';
import 'package:zentory_app/objectbox.g.dart';

abstract class MovementLocalDataSource {
  Future<void> saveMovements(List<MovementEntity> movements);
  List<MovementEntity> getMovements(String workspaceId);
  List<MovementLocal> getPendingMovements();
  Future<void> markAsSync(int localId, String remoteId);
  Future<void> savePendingMovement(MovementEntity movement);
}

@LazySingleton(as: MovementLocalDataSource)
class MovementLocalDataSourceImpl implements MovementLocalDataSource {
  final ObjectBoxDatabase _db;

  MovementLocalDataSourceImpl(this._db);

  @override
  List<MovementEntity> getMovements(String workspaceId) {
    final box = _db.store.box<MovementLocal>();
    final query = box
        .query(MovementLocal_.workspaceId.equals(workspaceId))
        .order(MovementLocal_.createdAt, flags: Order.descending)
        .build();
    final results = query.find();
    query.close();

    return results
        .map(
          (m) => MovementEntity(
            id: m.remoteId,
            productId: m.productId,
            productName: m.productName,
            workspaceId: m.workspaceId,
            type: MovementType.values.firstWhere((e) => e.name == m.type),
            quantity: m.quantity.toInt(),
            reason: m.reason ?? '',
            createdAt: m.createdAt,
            userId: m.createdBy,
          ),
        )
        .toList();
  }

  @override
  Future<void> saveMovements(List<MovementEntity> movements) async {
    final box = _db.store.box<MovementLocal>();

    final localMovements = movements.map((m) {
      final query = box.query(MovementLocal_.remoteId.equals(m.id)).build();
      final existing = query.findFirst();
      query.close();

      return MovementLocal(
        remoteId: m.id,
        workspaceId: m.workspaceId,
        productId: m.productId,
        productName: m.productName,
        quantity: m.quantity.toDouble(),
        type: m.type.name,
        reason: m.reason,
        createdBy: m.userId,
        createdAt: m.createdAt,
        isPendingSync: false,
      )..id = existing?.id ?? 0;
    }).toList();

    box.putMany(localMovements);
  }

  @override
  List<MovementLocal> getPendingMovements() {
    final box = _db.store.box<MovementLocal>();
    final query = box.query(MovementLocal_.isPendingSync.equals(true)).build();
    final results = query.find();
    query.close();
    return results;
  }

  @override
  Future<void> markAsSync(int localId, String remoteId) async {
    final box = _db.store.box<MovementLocal>();
    final movement = box.get(localId);
    if (movement != null) {
      movement.isPendingSync = false;
      movement.remoteId = remoteId;
      box.put(movement);
    }
  }

  @override
  Future<void> savePendingMovement(MovementEntity m) async {
    final box = _db.store.box<MovementLocal>();
    final query = box.query(MovementLocal_.remoteId.equals(m.id)).build();
    final existing = query.findFirst();
    query.close();

    final local = MovementLocal(
      remoteId: m.id,
      workspaceId: m.workspaceId,
      productId: m.productId,
      productName: m.productName,
      quantity: m.quantity.toDouble(),
      type: m.type.name,
      reason: m.reason,
      createdBy: m.userId,
      createdAt: m.createdAt,
      isPendingSync: true,
    )..id = existing?.id ?? 0;

    box.put(local);
  }
}
