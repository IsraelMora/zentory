import 'package:injectable/injectable.dart';
import 'package:zentory_app/features/inventory/domain/repositories/inventory_repository.dart';

@injectable
class WatchProductsUseCase {
  final InventoryRepository _repository;

  WatchProductsUseCase(this._repository);

  Stream<dynamic> call(String workspaceId) {
    return _repository.watchProducts(workspaceId);
  }
}
