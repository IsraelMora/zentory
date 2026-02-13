part of 'workspaces_bloc.dart';

@freezed
abstract class WorkspacesEvent with _$WorkspacesEvent {
  const factory WorkspacesEvent.workspacesFetched() = _WorkspacesFetched;
  const factory WorkspacesEvent.workspaceCreated(String name) =
      _WorkspaceCreated;
}
