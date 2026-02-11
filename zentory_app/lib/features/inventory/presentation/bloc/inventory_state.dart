part of 'inventory_bloc.dart';

@freezed
class InventoryState with _$InventoryState {
  const factory InventoryState.initial() = _Initial;
  const factory InventoryState.loading() = _Loading;
  const factory InventoryState.loaded({
    required List<ProductEntity> allProducts,
    required List<ProductEntity> filteredProducts,
    @Default('') String searchQuery,
    String? selectedCategory,
    String? lastUploadedImageUrl,
    @Default(false) bool isUploadingImage,
    @Default(false) bool hasReachedMax,
    @Default(false) bool isLoadingMore,
  }) = _Loaded;
  const factory InventoryState.error(String message) = _Error;
}
