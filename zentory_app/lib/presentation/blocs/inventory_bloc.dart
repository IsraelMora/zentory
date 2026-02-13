import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/usecases/usecase.dart';
import 'package:zentory_app/domain/usecases/get_current_user_usecase.dart';
import 'package:zentory_app/domain/entities/movement.dart';
import 'package:zentory_app/domain/entities/product.dart';
import 'package:zentory_app/domain/usecases/add_product_usecase.dart';
import 'package:zentory_app/domain/usecases/delete_product_usecase.dart';
import 'package:zentory_app/domain/usecases/get_products_usecase.dart';
import 'package:zentory_app/domain/usecases/movement_usecases.dart';
import 'package:zentory_app/domain/usecases/update_product_usecase.dart';
import 'package:zentory_app/domain/usecases/upload_image_usecase.dart';
import 'package:zentory_app/domain/usecases/watch_products_usecase.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';
part 'inventory_bloc.freezed.dart';

@injectable
class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final GetProductsUseCase _getProductsUseCase;
  final AddProductUseCase _addProductUseCase;
  final UpdateProductUseCase _updateProductUseCase;
  final DeleteProductUseCase _deleteProductUseCase;
  final RecordMovementUseCase _recordMovementUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final UploadImageUseCase _uploadImageUseCase;
  final WatchProductsUseCase _watchProductsUseCase;

  StreamSubscription? _productsSubscription;
  static const int _pageSize = 20;

  InventoryBloc(
    this._getProductsUseCase,
    this._addProductUseCase,
    this._updateProductUseCase,
    this._deleteProductUseCase,
    this._recordMovementUseCase,
    this._getCurrentUserUseCase,
    this._uploadImageUseCase,
    this._watchProductsUseCase,
  ) : super(const InventoryState.initial()) {
    on<_ProductsFetched>((event, emit) async {
      emit(const InventoryState.loading());
      final result = await _getProductsUseCase(
        GetProductsParams(
          workspaceId: event.workspaceId,
          limit: _pageSize,
          offset: 0,
        ),
      );
      result.fold(
        (failure) => emit(InventoryState.error(failure.toString())),
        (products) => emit(
          InventoryState.loaded(
            allProducts: products,
            filteredProducts: products,
            hasReachedMax: products.length < _pageSize,
            isLoadingMore: false,
          ),
        ),
      );
      add(InventoryEvent.subscriptionRequested(event.workspaceId));
    });

    on<_LoadMoreProducts>((event, emit) async {
      final currentState = state;
      if (currentState is! _Loaded ||
          currentState.isLoadingMore ||
          currentState.hasReachedMax) {
        return;
      }

      emit(currentState.copyWith(isLoadingMore: true));

      final result = await _getProductsUseCase(
        GetProductsParams(
          workspaceId: event.workspaceId,
          limit: _pageSize,
          offset: currentState.allProducts.length,
        ),
      );

      result.fold(
        (failure) => emit(currentState.copyWith(isLoadingMore: false)),
        (newProducts) {
          if (newProducts.isEmpty) {
            emit(
              currentState.copyWith(isLoadingMore: false, hasReachedMax: true),
            );
          } else {
            final allProducts = [...currentState.allProducts, ...newProducts];
            final filtered = _filterProducts(
              allProducts,
              currentState.searchQuery,
              currentState.selectedCategory,
            );
            emit(
              currentState.copyWith(
                allProducts: allProducts,
                filteredProducts: filtered,
                isLoadingMore: false,
                hasReachedMax: newProducts.length < _pageSize,
              ),
            );
          }
        },
      );
    });

    on<_ProductAdded>((event, emit) async {
      final result = await _addProductUseCase(event.product);
      result.fold((failure) => emit(InventoryState.error(failure.toString())), (
        product,
      ) async {
        final userResult = await _getCurrentUserUseCase(NoParams());
        userResult.fold((_) => null, (user) {
          _recordMovementUseCase(
            MovementEntity(
              id: '',
              productId: product.id,
              productName: product.name,
              workspaceId: product.workspaceId,
              type: MovementType.inflow,
              quantity: product.stock,
              reason: 'Stock inicial',
              createdAt: DateTime.now(),
              userId: user.id,
              userName: user.name,
            ),
          );
        });
        add(InventoryEvent.productsFetched(product.workspaceId));
      });
    });

    on<_ProductUpdated>((event, emit) async {
      final oldProduct = state.maybeMap(
        loaded: (s) =>
            s.allProducts.firstWhere((p) => p.id == event.product.id),
        orElse: () => null,
      );

      final result = await _updateProductUseCase(event.product);
      result.fold((failure) => emit(InventoryState.error(failure.toString())), (
        product,
      ) async {
        if (oldProduct != null && oldProduct.stock != product.stock) {
          final diff = product.stock - oldProduct.stock;
          final userResult = await _getCurrentUserUseCase(NoParams());
          userResult.fold((_) => null, (user) {
            _recordMovementUseCase(
              MovementEntity(
                id: '',
                productId: product.id,
                productName: product.name,
                workspaceId: product.workspaceId,
                type: diff > 0 ? MovementType.inflow : MovementType.outflow,
                quantity: diff.abs(),
                reason: 'Ajuste manual',
                createdAt: DateTime.now(),
                userId: user.id,
                userName: user.name,
              ),
            );
          });
        }
        add(InventoryEvent.productsFetched(product.workspaceId));
      });
    });

    on<_ProductDeleted>((event, emit) async {
      final result = await _deleteProductUseCase(event.productId);
      result.fold((failure) => emit(InventoryState.error(failure.toString())), (
        _,
      ) {
        add(InventoryEvent.productsFetched(event.workspaceId));
      });
    });

    on<_SearchQueryChanged>((event, emit) {
      state.maybeMap(
        loaded: (loadedState) {
          final filtered = _filterProducts(
            loadedState.allProducts,
            event.query,
            loadedState.selectedCategory,
          );
          emit(
            loadedState.copyWith(
              filteredProducts: filtered,
              searchQuery: event.query,
            ),
          );
        },
        orElse: () {},
      );
    });

    on<_CategoryFilterChanged>((event, emit) {
      state.maybeMap(
        loaded: (loadedState) {
          final filtered = _filterProducts(
            loadedState.allProducts,
            loadedState.searchQuery,
            event.category,
          );
          emit(
            loadedState.copyWith(
              filteredProducts: filtered,
              selectedCategory: event.category,
            ),
          );
        },
        orElse: () {},
      );
    });

    on<_ProductImageUploadRequested>((event, emit) async {
      await state.maybeMap(
        loaded: (loadedState) async {
          emit(loadedState.copyWith(isUploadingImage: true));
          final result = await _uploadImageUseCase(
            UploadImageParams(
              filePath: event.filePath,
              fileName: event.fileName,
            ),
          );
          result.fold(
            (failure) => emit(loadedState.copyWith(isUploadingImage: false)),
            (imageUrl) => emit(
              loadedState.copyWith(
                isUploadingImage: false,
                lastUploadedImageUrl: imageUrl,
              ),
            ),
          );
        },
        orElse: () {},
      );
    });

    on<_SubscriptionRequested>((event, emit) async {
      await _productsSubscription?.cancel();
      _productsSubscription = _watchProductsUseCase(event.workspaceId).listen((
        _,
      ) {
        add(const InventoryEvent.realtimeUpdateReceived());
      });
    });

    on<_RealtimeUpdateReceived>((event, emit) async {
      state.maybeMap(
        loaded: (loadedState) async {
          final result = await _getProductsUseCase(
            GetProductsParams(
              workspaceId: loadedState.allProducts.first.workspaceId,
              limit: loadedState.allProducts.length,
              offset: 0,
            ),
          );
          result.fold((_) => null, (products) {
            final filtered = _filterProducts(
              products,
              loadedState.searchQuery,
              loadedState.selectedCategory,
            );
            emit(
              loadedState.copyWith(
                allProducts: products,
                filteredProducts: filtered,
                hasReachedMax: products.length < loadedState.allProducts.length,
              ),
            );
          });
        },
        orElse: () {},
      );
    });
  }

  @override
  Future<void> close() {
    _productsSubscription?.cancel();
    return super.close();
  }

  List<ProductEntity> _filterProducts(
    List<ProductEntity> products,
    String query,
    String? category,
  ) {
    return products.where((product) {
      final nameMatch = product.name.toLowerCase().contains(
            query.toLowerCase(),
          );
      final descMatch = product.description.toLowerCase().contains(
            query.toLowerCase(),
          );
      final categoryMatch =
          category == null || category.isEmpty || product.category == category;
      return (nameMatch || descMatch) && categoryMatch;
    }).toList();
  }
}
