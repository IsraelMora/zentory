import 'package:dartz/dartz.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, UserEntity>> getCurrentUser();
  Future<Either<Failure, UserEntity>> updateName(String name);
  Future<Either<Failure, void>> updatePassword({
    required String oldPassword,
    required String newPassword,
  });
}
