import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/data/datasources/workspaces_remote_data_source.dart';
import 'package:zentory_app/domain/entities/workspace.dart';
import 'package:zentory_app/domain/repositories/workspaces_repository.dart';

@LazySingleton(as: WorkspacesRepository)
class WorkspacesRepositoryImpl implements WorkspacesRepository {
  final WorkspacesRemoteDataSource _remoteDataSource;

  WorkspacesRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<WorkspaceEntity>>> getWorkspaces() async {
    try {
      final workspaces = await _remoteDataSource.getWorkspaces();
      return Right(workspaces);
    } catch (e) {
      return Left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, WorkspaceEntity>> createWorkspace(String name) async {
    try {
      final workspace = await _remoteDataSource.createWorkspace(name);
      return Right(workspace);
    } catch (e) {
      return Left(Failure.serverError(e.toString()));
    }
  }
}
