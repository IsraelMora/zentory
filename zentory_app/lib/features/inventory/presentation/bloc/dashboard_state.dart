part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;
  const factory DashboardState.loading() = _Loading;
  const factory DashboardState.loaded({
    required int totalItems,
    required double totalStockValue,
    required int totalCategories,
    required List<ProductEntity> lowStockItems,
    required List<MovementEntity> recentMovements,
  }) = _Loaded;
  const factory DashboardState.error(String message) = _Error;
}
