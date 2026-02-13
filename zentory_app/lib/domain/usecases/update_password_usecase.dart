import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/domain/repositories/auth_repository.dart';

@injectable
class UpdatePasswordUseCase {
  final AuthRepository _repository;

  UpdatePasswordUseCase(this._repository);

  Future<Either<Failure, void>> call(UpdatePasswordParams params) async {
    return _repository.updatePassword(
      oldPassword: params.oldPassword,
      newPassword: params.newPassword,
    );
  }
}

class UpdatePasswordParams {
  final String oldPassword;
  final String newPassword;

  UpdatePasswordParams({required this.oldPassword, required this.newPassword});
}
