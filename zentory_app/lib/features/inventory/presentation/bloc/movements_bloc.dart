import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/features/inventory/domain/entities/movement.dart';
import 'package:zentory_app/features/inventory/domain/usecases/movement_usecases.dart';

part 'movements_event.dart';
part 'movements_state.dart';
part 'movements_bloc.freezed.dart';

@injectable
class MovementsBloc extends Bloc<MovementsEvent, MovementsState> {
  final GetMovementsUseCase _getMovementsUseCase;
  static const int _pageSize = 20;

  MovementsBloc(this._getMovementsUseCase)
    : super(const MovementsState.initial()) {
    on<_MovementsFetched>((event, emit) async {
      emit(const MovementsState.loading());
      final result = await _getMovementsUseCase(
        GetMovementsParams(
          workspaceId: event.workspaceId,
          limit: _pageSize,
          offset: 0,
        ),
      );
      result.fold(
        (failure) => emit(MovementsState.error(failure.toString())),
        (movements) => emit(
          MovementsState.loaded(
            movements: movements,
            hasReachedMax: movements.length < _pageSize,
            isLoadingMore: false,
          ),
        ),
      );
    });

    on<_LoadMoreMovements>((event, emit) async {
      final currentState = state;
      if (currentState is! _Loaded ||
          currentState.isLoadingMore ||
          currentState.hasReachedMax) {
        return;
      }

      emit(currentState.copyWith(isLoadingMore: true));

      final result = await _getMovementsUseCase(
        GetMovementsParams(
          workspaceId: event.workspaceId,
          limit: _pageSize,
          offset: currentState.movements.length,
        ),
      );

      result.fold(
        (failure) => emit(currentState.copyWith(isLoadingMore: false)),
        (newMovements) {
          if (newMovements.isEmpty) {
            emit(
              currentState.copyWith(isLoadingMore: false, hasReachedMax: true),
            );
          } else {
            emit(
              currentState.copyWith(
                movements: [...currentState.movements, ...newMovements],
                isLoadingMore: false,
                hasReachedMax: newMovements.length < _pageSize,
              ),
            );
          }
        },
      );
    });
  }
}
