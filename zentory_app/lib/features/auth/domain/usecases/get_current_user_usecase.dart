import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/core/usecases/usecase.dart';
import 'package:zentory_app/features/auth/domain/entities/user.dart';
import 'package:zentory_app/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class GetCurrentUserUseCase extends UseCase<UserEntity, NoParams> {
  final AuthRepository _repository;

  GetCurrentUserUseCase(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) {
    return _repository.getCurrentUser();
  }
}
