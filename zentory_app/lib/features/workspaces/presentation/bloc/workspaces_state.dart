part of 'workspaces_bloc.dart';

@freezed
class WorkspacesState with _$WorkspacesState {
  const factory WorkspacesState.initial() = _Initial;
  const factory WorkspacesState.loading() = _Loading;
  const factory WorkspacesState.loaded(List<WorkspaceEntity> workspaces) =
      _Loaded;
  const factory WorkspacesState.error(String message) = _Error;
}
