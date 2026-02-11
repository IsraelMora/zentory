import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/features/inventory/domain/entities/product.dart';
import 'package:zentory_app/features/inventory/domain/repositories/inventory_repository.dart';

class GetProductsParams {
  final String workspaceId;
  final int limit;
  final int offset;

  GetProductsParams({
    required this.workspaceId,
    this.limit = 50,
    this.offset = 0,
  });
}

@lazySingleton
class GetProductsUseCase {
  final InventoryRepository _repository;

  GetProductsUseCase(this._repository);

  Future<Either<Failure, List<ProductEntity>>> call(GetProductsParams params) {
    return _repository.getProducts(
      params.workspaceId,
      limit: params.limit,
      offset: params.offset,
    );
  }
}
