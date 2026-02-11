import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/core/usecases/usecase.dart';
import 'package:zentory_app/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class LogoutUseCase extends UseCase<void, NoParams> {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return _repository.logout();
  }
}
