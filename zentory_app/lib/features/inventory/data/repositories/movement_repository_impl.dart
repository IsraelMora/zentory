import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/features/inventory/data/datasources/movement_local_data_source.dart';
import 'package:zentory_app/features/inventory/data/datasources/movement_remote_data_source.dart';
import 'package:zentory_app/features/inventory/domain/entities/movement.dart';
import 'package:zentory_app/features/inventory/domain/repositories/movement_repository.dart';

@LazySingleton(as: MovementRepository)
class MovementRepositoryImpl implements MovementRepository {
  final MovementRemoteDataSource _remoteDataSource;
  final MovementLocalDataSource _localDataSource;

  MovementRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<MovementEntity>>> getMovements(
    String workspaceId, {
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      final movements = await _remoteDataSource.getMovements(
        workspaceId,
        limit: limit,
        offset: offset,
      );

      if (offset == 0) {
        await _localDataSource.saveMovements(movements);
      }

      return Right(movements);
    } catch (e) {
      final localMovements = _localDataSource.getMovements(workspaceId);
      if (localMovements.isNotEmpty) {
        return Right(localMovements);
      }
      return Left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovementEntity>> recordMovement(
    MovementEntity movement,
  ) async {
    try {
      final newMovement = await _remoteDataSource.recordMovement(movement);
      await _localDataSource.saveMovements([newMovement]);
      return Right(newMovement);
    } catch (e) {
      await _localDataSource.savePendingMovement(movement);
      return Right(movement);
    }
  }
}
