import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/features/inventory/domain/entities/movement.dart';
import 'package:zentory_app/features/inventory/domain/entities/product.dart';
import 'package:zentory_app/features/inventory/domain/usecases/get_products_usecase.dart';
import 'package:zentory_app/features/inventory/domain/usecases/movement_usecases.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetProductsUseCase _getProductsUseCase;
  final GetMovementsUseCase _getMovementsUseCase;

  DashboardBloc(this._getProductsUseCase, this._getMovementsUseCase)
      : super(const DashboardState.initial()) {
    on<_DashboardFetched>((event, emit) async {
      emit(const DashboardState.loading());

      final productsResult = await _getProductsUseCase(
        GetProductsParams(workspaceId: event.workspaceId),
      );
      final movementsResult = await _getMovementsUseCase(
        GetMovementsParams(workspaceId: event.workspaceId, limit: 10),
      );

      productsResult.fold(
        (failure) => emit(DashboardState.error(failure.toString())),
        (products) {
          movementsResult.fold(
            (failure) => emit(DashboardState.error(failure.toString())),
            (movements) {
              final totalItems = products.length;
              final totalStockValue = products.fold<double>(
                0,
                (prev, p) => prev + (p.price * p.stock),
              );
              final lowStockItems = products.where((p) => p.stock < 5).toList();

              final totalCategories =
                  products.map((p) => p.category).toSet().length;

              emit(
                DashboardState.loaded(
                  totalItems: totalItems,
                  totalStockValue: totalStockValue,
                  totalCategories: totalCategories,
                  lowStockItems: lowStockItems,
                  recentMovements: movements.take(5).toList(),
                ),
              );
            },
          );
        },
      );
    });
  }
}
