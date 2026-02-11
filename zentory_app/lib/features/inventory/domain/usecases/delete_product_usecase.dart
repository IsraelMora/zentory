import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/core/usecases/usecase.dart';
import 'package:zentory_app/features/inventory/domain/repositories/inventory_repository.dart';

@lazySingleton
class DeleteProductUseCase extends UseCase<void, String> {
  final InventoryRepository _repository;

  DeleteProductUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(String params) {
    return _repository.deleteProduct(params);
  }
}
