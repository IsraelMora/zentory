import 'package:dartz/dartz.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/domain/entities/workspace.dart';

abstract class WorkspacesRepository {
  Future<Either<Failure, List<WorkspaceEntity>>> getWorkspaces();
  Future<Either<Failure, WorkspaceEntity>> createWorkspace(String name);
}
