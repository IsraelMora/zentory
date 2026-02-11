import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/features/auth/domain/entities/user.dart';
import 'package:zentory_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class UpdateProfileUseCase {
  final AuthRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(String name) async {
    return repository.updateName(name);
  }
}
