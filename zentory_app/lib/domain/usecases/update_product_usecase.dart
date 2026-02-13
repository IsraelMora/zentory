import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/core/usecases/usecase.dart';
import 'package:zentory_app/domain/entities/product.dart';
import 'package:zentory_app/domain/repositories/inventory_repository.dart';

@lazySingleton
class UpdateProductUseCase extends UseCase<ProductEntity, ProductEntity> {
  final InventoryRepository _repository;

  UpdateProductUseCase(this._repository);

  @override
  Future<Either<Failure, ProductEntity>> call(ProductEntity params) {
    return _repository.updateProduct(params);
  }
}
