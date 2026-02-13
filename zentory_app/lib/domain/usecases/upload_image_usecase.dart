import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/domain/repositories/inventory_repository.dart';

@injectable
class UploadImageUseCase {
  final InventoryRepository repository;

  UploadImageUseCase(this.repository);

  Future<Either<Failure, String>> call(UploadImageParams params) async {
    return repository.uploadImage(params.filePath, params.fileName);
  }
}

class UploadImageParams {
  final String filePath;
  final String fileName;

  UploadImageParams({required this.filePath, required this.fileName});
}
