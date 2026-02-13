import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/error/failures.dart';
import 'package:zentory_app/core/usecases/usecase.dart';
import 'package:zentory_app/domain/entities/workspace.dart';
import 'package:zentory_app/domain/repositories/workspaces_repository.dart';

@lazySingleton
class GetWorkspacesUseCase extends UseCase<List<WorkspaceEntity>, NoParams> {
  final WorkspacesRepository _repository;

  GetWorkspacesUseCase(this._repository);

  @override
  Future<Either<Failure, List<WorkspaceEntity>>> call(NoParams params) {
    return _repository.getWorkspaces();
  }
}
