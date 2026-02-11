import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/core/utils/image_utils.dart';
import 'package:zentory_app/features/inventory/data/datasources/inventory_local_data_source.dart';
import 'package:zentory_app/features/inventory/data/datasources/inventory_remote_data_source.dart';
import 'package:zentory_app/features/inventory/domain/entities/product.dart';
import 'package:zentory_app/features/inventory/domain/repositories/inventory_repository.dart';

@LazySingleton(as: InventoryRepository)
class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryRemoteDataSource _remoteDataSource;
  final InventoryLocalDataSource _localDataSource;

  InventoryRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(
    String workspaceId, {
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      // Intentar obtener de remoto
      final products = await _remoteDataSource.getProducts(
        workspaceId,
        limit: limit,
        offset: offset,
      );

      // Guardar en local si es la primera página (para caché persistente básica)
      if (offset == 0) {
        await _localDataSource.saveProducts(products);
      }

      return Right(products);
    } catch (e) {
      // Si falla, intentar traer de local
      final localProducts = _localDataSource.getProducts(workspaceId);
      if (localProducts.isNotEmpty) {
        return Right(localProducts);
      }
      return Left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> addProduct(
    ProductEntity product,
  ) async {
    try {
      final newProduct = await _remoteDataSource.addProduct(product);
      await _localDataSource.saveProducts([newProduct]);
      return Right(newProduct);
    } catch (e) {
      // Si falla por red u otro motivo, guardar como pendiente
      await _localDataSource.savePendingProduct(product);
      return Right(
        product,
      ); // Retornamos el mismo objeto para permitir flujo UI
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String productId) async {
    try {
      await _remoteDataSource.deleteProduct(productId);
      return const Right(null);
    } catch (e) {
      // Para eliminar es más complejo, por ahora informamos el error
      return Left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> updateProduct(
    ProductEntity product,
  ) async {
    try {
      final updatedProduct = await _remoteDataSource.updateProduct(product);
      await _localDataSource.saveProducts([updatedProduct]);
      return Right(updatedProduct);
    } catch (e) {
      await _localDataSource.savePendingProduct(product);
      return Right(product);
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage(
    String filePath,
    String fileName,
  ) async {
    try {
      // Compresión premium antes de subir
      final compressedFile = await ImageUtils.compressImage(filePath);
      final finalPath = compressedFile?.path ?? filePath;

      final imageUrl = await _remoteDataSource.uploadProductImage(
        finalPath,
        fileName,
      );
      return Right(imageUrl);
    } catch (e) {
      return Left(Failure.serverError(e.toString()));
    }
  }

  @override
  Stream<dynamic> watchProducts(String workspaceId) {
    return _remoteDataSource.subscribeToProducts(workspaceId);
  }
}
