import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/domain/entities/movement.dart';
import 'package:zentory_app/domain/repositories/movement_repository.dart';

class GetMovementsParams {
  final String workspaceId;
  final int limit;
  final int offset;

  GetMovementsParams({
    required this.workspaceId,
    this.limit = 50,
    this.offset = 0,
  });
}

@lazySingleton
class GetMovementsUseCase {
  final MovementRepository _repository;

  GetMovementsUseCase(this._repository);

  Future<Either<Failure, List<MovementEntity>>> call(
      GetMovementsParams params) {
    return _repository.getMovements(
      params.workspaceId,
      limit: params.limit,
      offset: params.offset,
    );
  }
}

@lazySingleton
class RecordMovementUseCase {
  final MovementRepository _repository;

  RecordMovementUseCase(this._repository);

  Future<Either<Failure, MovementEntity>> call(MovementEntity movement) {
    return _repository.recordMovement(movement);
  }
}
