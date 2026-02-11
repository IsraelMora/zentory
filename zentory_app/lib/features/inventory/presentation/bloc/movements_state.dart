part of 'movements_bloc.dart';

@freezed
class MovementsState with _$MovementsState {
  const factory MovementsState.initial() = _Initial;
  const factory MovementsState.loading() = _Loading;
  const factory MovementsState.loaded({
    required List<MovementEntity> movements,
    @Default(false) bool hasReachedMax,
    @Default(false) bool isLoadingMore,
  }) = _Loaded;
  const factory MovementsState.error(String message) = _Error;
}
