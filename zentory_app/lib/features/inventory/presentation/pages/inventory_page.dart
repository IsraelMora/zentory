import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/di/injection.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/widgets/zentory_ui_components.dart';
import 'package:zentory_app/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:zentory_app/features/inventory/presentation/widgets/category_filters.dart';

import 'package:zentory_app/features/inventory/presentation/widgets/inventory_shimmer_loading.dart';
import 'package:zentory_app/features/inventory/presentation/widgets/product_card.dart';
import 'package:zentory_app/features/inventory/presentation/widgets/product_form_dialog.dart';

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
    showDialog(
      context: context,
      builder: (context) => BlocProvider.value(
        value: _bloc,
        child: ProductFormDialog(
          workspaceId: widget.workspaceId,
          onSave: (product) {
            _bloc.add(InventoryEvent.productAdded(product));
            ZentoryFeedback.showSuccess(context, 'Producto agregado con éxito');
          },
        ),
      ),
    );
  }

  void _showEditProductDialog(BuildContext context, dynamic product) {
    HapticFeedback.selectionClick();
    showDialog(
      context: context,
      builder: (context) => BlocProvider.value(
        value: _bloc,
        child: ProductFormDialog(
          workspaceId: widget.workspaceId,
          product: product,
          onSave: (updatedProduct) {
            _bloc.add(InventoryEvent.productUpdated(updatedProduct));
            ZentoryFeedback.showSuccess(context, 'Producto actualizado');
          },
          onDelete: (productId) {
            _bloc.add(
              InventoryEvent.productDeleted(productId, widget.workspaceId),
            );
            ZentoryFeedback.showSuccess(context, 'Producto eliminado');
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        body: Column(
          children: [
            if (!_isSearching)
              ZentoryHeader(
                title: widget.workspaceName,
                subtitle: 'Gestión de Inventario',
                actions: [
                  IconButton(
                    icon: const Icon(LucideIcons.search),
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      setState(() {
                        _isSearching = true;
                      });
                    },
                    tooltip: 'Buscar',
                  ),
                  IconButton(
                    icon: const Icon(LucideIcons.history),
                    onPressed: () {
                      AutoTabsRouter.of(context).setActiveIndex(2);
                    },
                    tooltip: 'Movimientos',
                  ),
                ],
              )
            else
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(AppDesign.radiusExtraLarge),
                  ),
                  boxShadow: AppDesign.shadowLight,
                ),
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppDesign.paddingL,
                      AppDesign.spaceM, // Match ZentoryHeader
                      AppDesign.paddingL,
                      AppDesign.spaceL,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            autofocus: true,
                            decoration: const InputDecoration(
                              hintText: 'Buscar productos...',
                              border: InputBorder.none,
                              prefixIcon: Icon(LucideIcons.search),
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color,
                              fontSize: AppDesign.fontL,
                            ),
                            onChanged: (query) {
                              _bloc.add(
                                  InventoryEvent.searchQueryChanged(query));
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
                              _bloc.add(
                                  const InventoryEvent.searchQueryChanged(''));
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
                    error: (message) => Center(child: Text(message)),
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
                          title: 'Sin productos',
                          description:
                              'Aún no has agregado nada a tu inventario.',
                          onAction: () => _showAddProductDialog(context),
                          actionLabel: 'Agregar primer producto',
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
                                  title: 'Sin resultados',
                                  description:
                                      'No pudimos encontrar "$searchQuery"',
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
                                      return const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 32,
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
}
