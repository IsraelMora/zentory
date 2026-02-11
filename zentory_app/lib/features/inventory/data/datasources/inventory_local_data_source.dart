import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/database/entities.dart';
import 'package:zentory_app/core/database/objectbox_database.dart';
import 'package:zentory_app/features/inventory/domain/entities/product.dart';
import 'package:zentory_app/objectbox.g.dart';

abstract class InventoryLocalDataSource {
  Future<void> saveProducts(List<ProductEntity> products);
  List<ProductEntity> getProducts(String workspaceId);
  Future<void> clearProducts(String workspaceId);
  List<ProductLocal> getPendingProducts();
  Future<void> markAsSync(int localId, String remoteId);
  Future<void> savePendingProduct(ProductEntity product);
}

@LazySingleton(as: InventoryLocalDataSource)
class InventoryLocalDataSourceImpl implements InventoryLocalDataSource {
  final ObjectBoxDatabase _db;

  InventoryLocalDataSourceImpl(this._db);

  @override
  List<ProductEntity> getProducts(String workspaceId) {
    final box = _db.store.box<ProductLocal>();
    final query =
        box.query(ProductLocal_.workspaceId.equals(workspaceId)).build();
    final results = query.find();
    query.close();

    return results
        .map(
          (p) => ProductEntity(
            id: p.remoteId,
            workspaceId: p.workspaceId,
            name: p.name,
            description: p.description,
            price: p.price,
            stock: p.stock,
            imageUrl: p.imageUrl,
            category: p.category ?? 'General',
          ),
        )
        .toList();
  }

  @override
  Future<void> saveProducts(List<ProductEntity> products) async {
    final box = _db.store.box<ProductLocal>();

    // Convert to local entities
    final localProducts = products.map((p) {
      // Check if already exists to keep ID
      final query = box.query(ProductLocal_.remoteId.equals(p.id)).build();
      final existing = query.findFirst();
      query.close();

      return ProductLocal(
        remoteId: p.id,
        workspaceId: p.workspaceId,
        name: p.name,
        description: p.description,
        price: p.price,
        stock: p.stock,
        imageUrl: p.imageUrl,
        category: p.category,
        lastSync: DateTime.now(),
        isPendingSync: false, // Items from remote are synced
      )..id = existing?.id ?? 0;
    }).toList();

    box.putMany(localProducts);
  }

  @override
  List<ProductLocal> getPendingProducts() {
    final box = _db.store.box<ProductLocal>();
    final query = box.query(ProductLocal_.isPendingSync.equals(true)).build();
    final results = query.find();
    query.close();
    return results;
  }

  @override
  Future<void> markAsSync(int localId, String remoteId) async {
    final box = _db.store.box<ProductLocal>();
    final product = box.get(localId);
    if (product != null) {
      product.isPendingSync = false;
      product.remoteId = remoteId;
      product.lastSync = DateTime.now();
      box.put(product);
    }
  }

  @override
  Future<void> savePendingProduct(ProductEntity p) async {
    final box = _db.store.box<ProductLocal>();
    final query = box.query(ProductLocal_.remoteId.equals(p.id)).build();
    final existing = query.findFirst();
    query.close();

    final local = ProductLocal(
      remoteId: p.id,
      workspaceId: p.workspaceId,
      name: p.name,
      description: p.description,
      price: p.price,
      stock: p.stock,
      imageUrl: p.imageUrl,
      category: p.category,
      lastSync: DateTime.now(),
      isPendingSync: true,
    )..id = existing?.id ?? 0;

    box.put(local);
  }

  @override
  Future<void> clearProducts(String workspaceId) async {
    final box = _db.store.box<ProductLocal>();
    final query =
        box.query(ProductLocal_.workspaceId.equals(workspaceId)).build();
    query.remove();
    query.close();
  }
}
