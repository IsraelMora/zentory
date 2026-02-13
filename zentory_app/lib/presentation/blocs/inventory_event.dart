part of 'inventory_bloc.dart';

@freezed
class InventoryEvent with _$InventoryEvent {
  const factory InventoryEvent.productsFetched(String workspaceId) =
      _ProductsFetched;
  const factory InventoryEvent.productAdded(ProductEntity product) =
      _ProductAdded;
  const factory InventoryEvent.productUpdated(ProductEntity product) =
      _ProductUpdated;
  const factory InventoryEvent.productDeleted(
    String productId,
    String workspaceId,
  ) = _ProductDeleted;
  const factory InventoryEvent.searchQueryChanged(String query) =
      _SearchQueryChanged;
  const factory InventoryEvent.categoryFilterChanged(String? category) =
      _CategoryFilterChanged;
  const factory InventoryEvent.productImageUploadRequested(
    String filePath,
    String fileName,
  ) = _ProductImageUploadRequested;
  const factory InventoryEvent.subscriptionRequested(String workspaceId) =
      _SubscriptionRequested;
  const factory InventoryEvent.realtimeUpdateReceived() =
      _RealtimeUpdateReceived;
  const factory InventoryEvent.loadMoreProducts(String workspaceId) =
      _LoadMoreProducts;
}
