import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/di/injection.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/common/widgets/zentory_ui_components.dart';
import 'package:zentory_app/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:zentory_app/features/inventory/presentation/widgets/category_filters.dart';

import 'package:zentory_app/features/inventory/presentation/widgets/inventory_shimmer_loading.dart';
import 'package:zentory_app/features/inventory/presentation/widgets/product_card.dart';
import 'package:zentory_app/features/inventory/presentation/widgets/product_form_dialog.dart';

import 'package:zentory_app/l10n/app_localizations.dart';

@RoutePage()
class InventoryPage extends StatefulWidget {
  final String workspaceId;
  final String workspaceName;

  const InventoryPage({
    super.key,
    required this.workspaceId,
    required this.workspaceName,
  });

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  bool _isSearching = false;
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  late InventoryBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<InventoryBloc>()
      ..add(InventoryEvent.productsFetched(widget.workspaceId));
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      _bloc.add(InventoryEvent.loadMoreProducts(widget.workspaceId));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _showAddProductDialog(BuildContext context) {
    HapticFeedback.mediumImpact();
    final l10n = L10n.of(context)!;
    showDialog(
      context: context,
      builder: (context) => BlocProvider.value(
        value: _bloc,
        child: ProductFormDialog(
          workspaceId: widget.workspaceId,
          onSave: (product) {
            _bloc.add(InventoryEvent.productAdded(product));
            ZentoryFeedback.showSuccess(context, l10n.productAdded);
          },
        ),
      ),
    );
  }

  void _showEditProductDialog(BuildContext context, dynamic product) {
    HapticFeedback.selectionClick();
    final l10n = L10n.of(context)!;
    showDialog(
      context: context,
      builder: (context) => BlocProvider.value(
        value: _bloc,
        child: ProductFormDialog(
          workspaceId: widget.workspaceId,
          product: product,
          onSave: (updatedProduct) {
            _bloc.add(InventoryEvent.productUpdated(updatedProduct));
            ZentoryFeedback.showSuccess(context, l10n.productUpdated);
          },
          onDelete: (productId) {
            _bloc.add(
              InventoryEvent.productDeleted(productId, widget.workspaceId),
            );
            ZentoryFeedback.showSuccess(context, l10n.productDeleted);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const ZentoryHeader(title: '').preferredSize,
          child: !_isSearching
              ? ZentoryHeader(
                  title: widget.workspaceName,
                  actions: [
                    IconButton(
                      icon: const Icon(LucideIcons.search),
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        setState(() {
                          _isSearching = true;
                        });
                      },
                      tooltip: l10n.search,
                    ),
                    IconButton(
                      icon: const Icon(LucideIcons.history),
                      onPressed: () {
                        AutoTabsRouter.of(context).setActiveIndex(2);
                      },
                      tooltip: l10n.history,
                    ),
                  ],
                )
              : _buildSearchHeader(context, l10n),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocConsumer<InventoryBloc, InventoryState>(
                listener: (context, state) {
                  state.maybeWhen(
                    error: (message) {
                      ZentoryFeedback.showError(context, message);
                    },
                    orElse: () {},
                  );
                },
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const InventoryShimmerLoading(),
                    error: (message) => Center(
                      child: ZentoryErrorState(
                        title: l10n.error,
                        message: message,
                        onRetry: () => _bloc.add(
                          InventoryEvent.productsFetched(widget.workspaceId),
                        ),
                      ),
                    ),
                    loaded: (
                      allProducts,
                      filteredProducts,
                      searchQuery,
                      selectedCategory,
                      lastUploadedImageUrl,
                      isUploadingImage,
                      hasReachedMax,
                      isLoadingMore,
                    ) {
                      if (allProducts.isEmpty) {
                        return ZentoryEmptyState(
                          title: l10n.noProducts,
                          description: l10n.noProductsDesc,
                          onAction: () => _showAddProductDialog(context),
                          actionLabel: l10n.addFirstProduct,
                        );
                      }

                      return RefreshIndicator(
                        onRefresh: () async {
                          HapticFeedback.lightImpact();
                          _bloc.add(
                            InventoryEvent.productsFetched(
                              widget.workspaceId,
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            CategoryFilters(
                              products: allProducts,
                              selectedCategory: selectedCategory,
                            ),
                            if (filteredProducts.isEmpty &&
                                searchQuery.isNotEmpty)
                              Expanded(
                                child: ZentoryEmptyState(
                                  title: l10n
                                      .error, // or something like "No results"
                                  description: searchQuery,
                                  icon: LucideIcons.searchX,
                                ),
                              )
                            else
                              Expanded(
                                child: ListView.builder(
                                  controller: _scrollController,
                                  padding: EdgeInsets.all(AppDesign.paddingM),
                                  itemCount: filteredProducts.length +
                                      (isLoadingMore ? 1 : 0),
                                  itemBuilder: (context, index) {
                                    if (index >= filteredProducts.length) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: AppDesign.spaceXL,
                                        ),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    }
                                    final product = filteredProducts[index];
                                    return ProductCard(
                                      product: product,
                                      onTap: () => _showEditProductDialog(
                                        context,
                                        product,
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddProductDialog(context),
          child: const Icon(LucideIcons.plus),
        ),
      ),
    );
  }

  Widget _buildSearchHeader(BuildContext context, L10n l10n) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppDesign.radiusExtraLarge),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppDesign.paddingL,
            AppDesign.spaceM,
            AppDesign.paddingL,
            AppDesign.spaceL,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: l10n.searchProducts,
                    border: InputBorder.none,
                    prefixIcon: const Icon(LucideIcons.search),
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                  onChanged: (query) {
                    _bloc.add(InventoryEvent.searchQueryChanged(query));
                  },
                ),
              ),
              IconButton(
                icon: const Icon(LucideIcons.circleX),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  setState(() {
                    _isSearching = false;
                    _searchController.clear();
                    _bloc.add(const InventoryEvent.searchQueryChanged(''));
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
