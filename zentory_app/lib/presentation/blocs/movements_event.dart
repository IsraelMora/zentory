part of 'movements_bloc.dart';

@freezed
abstract class MovementsEvent with _$MovementsEvent {
  const factory MovementsEvent.movementsFetched(String workspaceId) =
      _MovementsFetched;
  const factory MovementsEvent.loadMoreMovements(String workspaceId) =
      _LoadMoreMovements;
}
