import 'package:dartz/dartz.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/domain/entities/movement.dart';

abstract class MovementRepository {
  Future<Either<Failure, List<MovementEntity>>> getMovements(
    String workspaceId, {
    int limit = 50,
    int offset = 0,
  });
  Future<Either<Failure, MovementEntity>> recordMovement(
    MovementEntity movement,
  );
}
