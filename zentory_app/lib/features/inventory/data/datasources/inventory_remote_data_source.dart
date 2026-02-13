import 'package:appwrite/appwrite.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/config/app_config.dart';
import 'package:zentory_app/common/utils/logger.dart';
import 'package:zentory_app/features/inventory/domain/entities/product.dart';

abstract class InventoryRemoteDataSource {
  Future<List<ProductEntity>> getProducts(
    String workspaceId, {
    int limit = 50,
    int offset = 0,
  });
  Future<ProductEntity> addProduct(ProductEntity product);
  Future<ProductEntity> updateProduct(ProductEntity product);
  Future<void> deleteProduct(String productId);
  Future<String> uploadProductImage(String filePath, String fileName);
  Stream<RealtimeMessage> subscribeToProducts(String workspaceId);
}

@LazySingleton(as: InventoryRemoteDataSource)
class InventoryRemoteDataSourceImpl implements InventoryRemoteDataSource {
  final TablesDB _tablesDB;
  final Storage _storage;
  final Realtime _realtime;

  InventoryRemoteDataSourceImpl(this._tablesDB, this._storage, this._realtime);

  @override
  Future<List<ProductEntity>> getProducts(
    String workspaceId, {
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      ZentoryLogger.debug('Obteniendo productos para workspace: $workspaceId');
      final response = await _tablesDB.listRows(
        databaseId: AppConfig.appwriteDatabaseId,
        tableId: AppConfig.productsCollectionId,
        queries: [
          Query.equal('workspaceId', workspaceId),
          Query.limit(limit),
          Query.offset(offset),
        ],
      );

      return response.rows.map((doc) {
        final data = doc.data;
        // Mapping quantityInStock to stock if necessary
        final stock = data['stock'] ?? data['quantityInStock'] ?? 0;
        return ProductEntity.fromJson({...data, 'id': doc.$id, 'stock': stock});
      }).toList();
    } catch (e, stackTrace) {
      ZentoryLogger.error(
          'Error al obtener productos de Appwrite', e, stackTrace);
      throw Exception('Error al obtener productos: $e');
    }
  }

  @override
  Future<ProductEntity> addProduct(ProductEntity product) async {
    try {
      ZentoryLogger.info('Agregando producto: ${product.name}');
      final data = product.toJson()..remove('id');

      // Ensure we match Appwrite schema names if they differ
      data['quantityInStock'] = product.stock;
      data['sku'] = product.sku.isEmpty
          ? 'SKU-${DateTime.now().millisecondsSinceEpoch}'
          : product.sku;

      final response = await _tablesDB.createRow(
        databaseId: AppConfig.appwriteDatabaseId,
        tableId: AppConfig.productsCollectionId,
        rowId: ID.unique(),
        data: data,
      );
      return product.copyWith(id: response.$id);
    } catch (e, stackTrace) {
      ZentoryLogger.error(
          'Error al agregar producto en Appwrite', e, stackTrace);
      throw Exception('Error al agregar producto: $e');
    }
  }

  @override
  Future<ProductEntity> updateProduct(ProductEntity product) async {
    try {
      ZentoryLogger.info('Actualizando producto: ${product.id}');
      final data = product.toJson()..remove('id');
      data['quantityInStock'] = product.stock;

      final response = await _tablesDB.updateRow(
        databaseId: AppConfig.appwriteDatabaseId,
        tableId: AppConfig.productsCollectionId,
        rowId: product.id,
        data: data,
      );
      return product.copyWith(id: response.$id);
    } catch (e, stackTrace) {
      ZentoryLogger.error(
          'Error al actualizar producto en Appwrite', e, stackTrace);
      throw Exception('Error al actualizar producto: $e');
    }
  }

  @override
  Future<void> deleteProduct(String productId) async {
    try {
      ZentoryLogger.info('Eliminando producto: $productId');
      await _tablesDB.deleteRow(
        databaseId: AppConfig.appwriteDatabaseId,
        tableId: AppConfig.productsCollectionId,
        rowId: productId,
      );
    } catch (e, stackTrace) {
      ZentoryLogger.error(
          'Error al eliminar producto en Appwrite', e, stackTrace);
      throw Exception('Error al eliminar producto: $e');
    }
  }

  @override
  Future<String> uploadProductImage(String filePath, String fileName) async {
    try {
      ZentoryLogger.info('Subiendo imagen: $fileName');
      final response = await _storage.createFile(
        bucketId: AppConfig.productImagesBucketId,
        fileId: ID.unique(),
        file: InputFile.fromPath(path: filePath, filename: fileName),
      );
      return '${AppConfig.appwriteEndpoint}/storage/buckets/${AppConfig.productImagesBucketId}/files/${response.$id}/view?project=${AppConfig.appwriteProjectId}';
    } catch (e, stackTrace) {
      ZentoryLogger.error('Error al subir imagen a Appwrite', e, stackTrace);
      throw Exception('Error al subir imagen: $e');
    }
  }

  @override
  Stream<RealtimeMessage> subscribeToProducts(String workspaceId) {
    return _realtime.subscribe([
      'databases.${AppConfig.appwriteDatabaseId}.collections.${AppConfig.productsCollectionId}.documents',
    ]).stream;
  }
}
