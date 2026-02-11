import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/usecases/usecase.dart';
import 'package:zentory_app/features/workspaces/domain/entities/workspace.dart';
import 'package:zentory_app/features/workspaces/domain/repositories/workspaces_repository.dart';
import 'package:zentory_app/features/workspaces/domain/usecases/get_workspaces_usecase.dart';

part 'workspaces_event.dart';
part 'workspaces_state.dart';
part 'workspaces_bloc.freezed.dart';

@injectable
class WorkspacesBloc extends Bloc<WorkspacesEvent, WorkspacesState> {
  final GetWorkspacesUseCase _getWorkspacesUseCase;
  final WorkspacesRepository _repository;

  WorkspacesBloc(this._getWorkspacesUseCase, this._repository)
      : super(const WorkspacesState.initial()) {
    on<_WorkspacesFetched>((event, emit) async {
      emit(const WorkspacesState.loading());
      final result = await _getWorkspacesUseCase(NoParams());
      result.fold(
        (failure) => emit(WorkspacesState.error(failure.toString())),
        (workspaces) => emit(WorkspacesState.loaded(workspaces)),
      );
    });

    on<_WorkspaceCreated>((event, emit) async {
      final currentState = state;
      // No emitimos loading sobre todo el estado para no borrar la lista actual,
      // pero si el repositorio falla, emitiremos el error.
      final result = await _repository.createWorkspace(event.name);
      result.fold(
        (failure) {
          emit(WorkspacesState.error(
              'No se pudo crear el espacio: ${failure.toString()}'));
          // Después de un breve retraso, si teníamos datos, volvemos a mostrarlos
          // para que el error no bloquee la app permanentemente.
          if (currentState is _Loaded) {
            emit(currentState);
          }
        },
        (_) => add(const WorkspacesEvent.workspacesFetched()),
      );
    });
  }
}
