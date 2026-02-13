import 'package:dartz/dartz.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/domain/entities/product.dart';

abstract class InventoryRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts(
    String workspaceId, {
    int limit = 50,
    int offset = 0,
  });
  Future<Either<Failure, ProductEntity>> addProduct(ProductEntity product);
  Future<Either<Failure, ProductEntity>> updateProduct(ProductEntity product);
  Future<Either<Failure, void>> deleteProduct(String productId);
  Future<Either<Failure, String>> uploadImage(String filePath, String fileName);
  Stream<dynamic> watchProducts(String workspaceId);
}
