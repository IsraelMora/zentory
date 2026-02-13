import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zentory_app/core/di/injection.dart';
import 'package:zentory_app/core/product_category.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/presentation/widgets/zentory_feedback.dart';
import 'package:zentory_app/presentation/widgets/zentory_dialogs.dart';
import 'package:zentory_app/presentation/widgets/zentory_shimmer.dart';
import 'package:zentory_app/presentation/widgets/zentory_error_state.dart';
import 'package:zentory_app/presentation/widgets/zentory_empty_state.dart';
import 'package:zentory_app/presentation/widgets/zentory_header.dart';
import 'package:zentory_app/presentation/widgets/zentory_card.dart';
import 'package:zentory_app/presentation/widgets/zentory_badge.dart';
import 'package:zentory_app/common/utils/extensions.dart';
import 'package:zentory_app/data/models/product_form_model.dart';
import 'package:zentory_app/domain/entities/product.dart';
import 'package:zentory_app/presentation/blocs/inventory_bloc.dart';
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
    final formModel = ProductFormModel();
    String? imageUrl;
    bool isUploading = false;

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) {
          return BlocListener<InventoryBloc, InventoryState>(
            bloc: _bloc,
            listenWhen: (previous, current) {
              return previous.maybeMap(
                    loaded: (p) => p.isUploadingImage,
                    orElse: () => false,
                  ) !=
                  current.maybeMap(
                    loaded: (c) => c.isUploadingImage,
                    orElse: () => false,
                  );
            },
            listener: (context, state) {
              state.maybeWhen(
                loaded: (all, filtered, query, category, lastUrl, uploading,
                    max, loading) {
                  if (!uploading && lastUrl != null) {
                    setDialogState(() {
                      imageUrl = lastUrl;
                      isUploading = false;
                    });
                  }
                },
                orElse: () {},
              );
            },
            child: Dialog(
              shape:
                  RoundedRectangleBorder(borderRadius: AppDesign.borderLarge),
              child: Container(
                padding: EdgeInsets.all(AppDesign.paddingL),
                constraints:
                    const BoxConstraints(maxWidth: AppDesign.dialogMaxWidth),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.addProduct,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: AppDesign.fontL),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(dialogContext),
                          icon:
                              Icon(LucideIcons.circleX, size: AppDesign.fontL),
                        ),
                      ],
                    ),
                    SizedBox(height: AppDesign.spaceXL),
                    _buildProductForm(
                      context: context,
                      form: formModel.form,
                      imageUrl: imageUrl,
                      isUploadingImage: isUploading,
                      isEditing: false,
                      categoryItems: ProductCategory.displayNames
                          .map(
                              (c) => DropdownMenuItem(value: c, child: Text(c)))
                          .toList(),
                      onImageTap: () async {
                        final picker = ImagePicker();
                        final image =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          setDialogState(() => isUploading = true);
                          _bloc.add(InventoryEvent.productImageUploadRequested(
                              image.path, image.name));
                        }
                      },
                      onSubmit: () {
                        final product = ProductEntity(
                          id: '',
                          workspaceId: widget.workspaceId,
                          name: formModel.nameControl.value!,
                          description: formModel.descriptionControl.value ?? '',
                          price: formModel.priceControl.value!,
                          stock: formModel.stockControl.value!,
                          imageUrl: imageUrl,
                          sku: '',
                          category: formModel.categoryControl.value!,
                        );
                        _bloc.add(InventoryEvent.productAdded(product));
                        Navigator.pop(dialogContext);
                        ZentoryFeedback.showSuccess(context, l10n.productAdded);
                      },
                      l10n: l10n,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showEditProductDialog(BuildContext context, ProductEntity product) {
    HapticFeedback.selectionClick();
    final l10n = L10n.of(context)!;
    final formModel = ProductFormModel(
      name: product.name,
      description: product.description,
      price: product.price,
      stock: product.stock,
      category: product.category,
    );
    String? imageUrl = product.imageUrl;
    bool isUploading = false;

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) {
          return BlocListener<InventoryBloc, InventoryState>(
            bloc: _bloc,
            listenWhen: (previous, current) {
              return previous.maybeMap(
                    loaded: (p) => p.isUploadingImage,
                    orElse: () => false,
                  ) !=
                  current.maybeMap(
                    loaded: (c) => c.isUploadingImage,
                    orElse: () => false,
                  );
            },
            listener: (context, state) {
              state.maybeWhen(
                loaded: (all, filtered, query, category, lastUrl, uploading,
                    max, loading) {
                  if (!uploading && lastUrl != null) {
                    setDialogState(() {
                      imageUrl = lastUrl;
                      isUploading = false;
                    });
                  }
                },
                orElse: () {},
              );
            },
            child: Dialog(
              shape:
                  RoundedRectangleBorder(borderRadius: AppDesign.borderLarge),
              child: Container(
                padding: EdgeInsets.all(AppDesign.paddingL),
                constraints:
                    const BoxConstraints(maxWidth: AppDesign.dialogMaxWidth),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.editProduct,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: AppDesign.fontL),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(dialogContext),
                          icon:
                              Icon(LucideIcons.circleX, size: AppDesign.fontL),
                        ),
                      ],
                    ),
                    SizedBox(height: AppDesign.spaceXL),
                    _buildProductForm(
                      context: context,
                      form: formModel.form,
                      imageUrl: imageUrl,
                      isUploadingImage: isUploading,
                      isEditing: true,
                      categoryItems: ProductCategory.displayNames
                          .map(
                              (c) => DropdownMenuItem(value: c, child: Text(c)))
                          .toList(),
                      onImageTap: () async {
                        final picker = ImagePicker();
                        final image =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          setDialogState(() => isUploading = true);
                          _bloc.add(InventoryEvent.productImageUploadRequested(
                              image.path, image.name));
                        }
                      },
                      onSubmit: () {
                        final updatedProduct = ProductEntity(
                          id: product.id,
                          workspaceId: widget.workspaceId,
                          name: formModel.nameControl.value!,
                          description: formModel.descriptionControl.value ?? '',
                          price: formModel.priceControl.value!,
                          stock: formModel.stockControl.value!,
                          imageUrl: imageUrl,
                          sku: product.sku,
                          category: formModel.categoryControl.value!,
                        );
                        _bloc
                            .add(InventoryEvent.productUpdated(updatedProduct));
                        Navigator.pop(dialogContext);
                        ZentoryFeedback.showSuccess(
                            context, l10n.productUpdated);
                      },
                      onDelete: () {
                        Navigator.pop(dialogContext);
                        ZentoryDialogs.showActionDialog(
                          context: context,
                          title: l10n.deleteProductConfirm,
                          description: l10n.deleteProductDesc,
                          confirmLabel: l10n.confirm,
                          confirmColor: Theme.of(context).colorScheme.error,
                          icon: LucideIcons.trash2,
                          onConfirm: () {
                            _bloc.add(InventoryEvent.productDeleted(
                                product.id, widget.workspaceId));
                            ZentoryFeedback.showSuccess(
                                context, l10n.productDeleted);
                          },
                        );
                      },
                      l10n: l10n,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductForm({
    required BuildContext context,
    required FormGroup form,
    required String? imageUrl,
    required bool isUploadingImage,
    required bool isEditing,
    required List<DropdownMenuItem<String>> categoryItems,
    required VoidCallback onImageTap,
    required VoidCallback onSubmit,
    VoidCallback? onDelete,
    required L10n l10n,
  }) {
    return ReactiveForm(
      formGroup: form,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Picker
            _buildImagePicker(
                context, imageUrl, isUploadingImage, onImageTap, l10n),
            SizedBox(height: AppDesign.spaceL),

            // Name Field
            ReactiveTextField<String>(
              formControlName: 'name',
              decoration: InputDecoration(
                labelText: l10n.productName,
                prefixIcon: Icon(LucideIcons.package, size: AppDesign.fontL),
              ),
            ),
            SizedBox(height: AppDesign.spaceM),

            // Description Field
            ReactiveTextField<String>(
              formControlName: 'description',
              maxLines: 2,
              decoration: InputDecoration(
                labelText: l10n.descriptionOptional,
                prefixIcon: Icon(LucideIcons.type, size: AppDesign.fontL),
              ),
            ),
            SizedBox(height: AppDesign.spaceM),

            // Price and Stock Row
            Row(
              children: [
                Expanded(
                  child: ReactiveTextField<double>(
                    formControlName: 'price',
                    decoration: InputDecoration(
                      labelText: l10n.price,
                      prefixIcon: Icon(
                        LucideIcons.dollarSign,
                        size: AppDesign.fontL,
                      ),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                ),
                SizedBox(width: AppDesign.spaceM),
                Expanded(
                  child: ReactiveTextField<int>(
                    formControlName: 'stock',
                    decoration: InputDecoration(
                      labelText: l10n.stock,
                      prefixIcon: Icon(LucideIcons.hash, size: AppDesign.fontL),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDesign.spaceM),

            // Category Dropdown
            ReactiveDropdownField<String>(
              formControlName: 'category',
              decoration: InputDecoration(
                labelText: l10n.category,
                prefixIcon: Icon(LucideIcons.tag, size: AppDesign.fontL),
              ),
              items: categoryItems,
              onChanged: (val) {
                HapticFeedback.selectionClick();
              },
            ),
            SizedBox(height: AppDesign.spaceXL),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                if (form.valid) {
                  HapticFeedback.heavyImpact();
                  onSubmit();
                } else {
                  form.markAllAsTouched();
                  HapticFeedback.vibrate();
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, AppDesign.spaceXL),
              ),
              child: Text(
                isEditing ? l10n.saveChanges : l10n.createProduct,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: AppDesign.fontM,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),

            // Delete Button
            if (isEditing && onDelete != null) ...[
              SizedBox(height: AppDesign.spaceS),
              TextButton(
                onPressed: () {
                  HapticFeedback.heavyImpact();
                  onDelete();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                  minimumSize: Size(double.infinity, AppDesign.spaceXL),
                ),
                child: Text(
                  l10n.deleteProduct,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: AppDesign.fontS,
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildImagePicker(
    BuildContext context,
    String? imageUrl,
    bool isUploadingImage,
    VoidCallback onImageTap,
    L10n l10n,
  ) {
    final theme = Theme.of(context);
    return Center(
      child: SizedBox(
        width: AppDesign.paddingXL,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppDesign.borderMedium,
              border: Border.all(color: theme.dividerColor),
            ),
            child: Material(
              color: theme.cardColor,
              borderRadius: AppDesign.borderMedium,
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  HapticFeedback.lightImpact();
                  onImageTap();
                },
                child: _buildImageContent(
                    context, imageUrl, isUploadingImage, l10n),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageContent(
    BuildContext context,
    String? imageUrl,
    bool isUploadingImage,
    L10n l10n,
  ) {
    final theme = Theme.of(context);
    if (isUploadingImage) {
      return const Center(child: CircularProgressIndicator());
    }

    if (imageUrl != null && imageUrl.isNotEmpty) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          LucideIcons.camera,
          size: AppDesign.fontXXL,
          color: theme.colorScheme.secondary,
        ),
        SizedBox(height: AppDesign.spaceXS),
        Text(
          l10n.addPhoto,
          style: theme.textTheme.labelLarge?.copyWith(
            fontSize: AppDesign.fontXS,
            color: theme.colorScheme.secondary,
          ),
        ),
      ],
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
                        setState(() => _isSearching = true);
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
                    loading: () => ListView.builder(
                      padding: EdgeInsets.all(AppDesign.paddingM),
                      itemCount: 6,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: AppDesign.spaceM),
                        child: ZentoryShimmer.card(),
                      ),
                    ),
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

                      final categories = allProducts
                          .map((p) => p.category)
                          .toSet()
                          .toList()
                        ..sort();

                      return RefreshIndicator(
                        onRefresh: () async {
                          HapticFeedback.lightImpact();
                          _bloc.add(InventoryEvent.productsFetched(
                            widget.workspaceId,
                          ));
                        },
                        child: Column(
                          children: [
                            _buildFilterChips(
                              context: context,
                              items: categories,
                              selectedItem: selectedCategory,
                              allLabel: l10n.all,
                              onSelected: (category) => _bloc.add(
                                InventoryEvent.categoryFilterChanged(category),
                              ),
                            ),
                            if (filteredProducts.isEmpty &&
                                searchQuery.isNotEmpty)
                              Expanded(
                                child: ZentoryEmptyState(
                                  title: l10n.error,
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
                                        child: const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    }
                                    final product = filteredProducts[index];
                                    return _buildProductCard(
                                      context: context,
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

  Widget _buildProductCard({
    required BuildContext context,
    required ProductEntity product,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);

    return ZentoryCard(
      onTap: onTap,
      margin: EdgeInsets.only(bottom: AppDesign.spaceS),
      child: Row(
        children: [
          _buildProductImage(context, product.imageUrl),
          SizedBox(width: AppDesign.spaceM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: theme.textTheme.titleLarge,
                ),
                if (product.description.isNotEmpty) ...[
                  SizedBox(height: AppDesign.spaceXS),
                  Text(
                    product.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
                SizedBox(height: AppDesign.spaceS),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildPriceAndCategory(
                      context,
                      product.price,
                      product.category,
                    ),
                    _buildStockBadge(context: context, stock: product.stock),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage(BuildContext context, String? imageUrl) {
    final hasImage = imageUrl != null && imageUrl.isNotEmpty;
    // Use AspectRatio and spacing-based width
    return SizedBox(
      width: AppDesign.paddingXL, // Driven by tokens
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: AppDesign.borderSmall,
            image: hasImage
                ? DecorationImage(
                    image: CachedNetworkImageProvider(imageUrl),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: !hasImage
              ? Icon(
                  LucideIcons.image,
                  color: Theme.of(context).colorScheme.secondary,
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildPriceAndCategory(
    BuildContext context,
    double price,
    String category,
  ) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          price.toCurrency(),
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        SizedBox(height: AppDesign.spaceXS),
        ZentoryBadge(
          label: category,
          color: theme.colorScheme.secondary,
        ),
      ],
    );
  }

  Widget _buildStockBadge({
    required BuildContext context,
    required int stock,
  }) {
    final isLowStock = stock < 5;
    final color = isLowStock
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.primary;

    return ZentoryBadge(
      label: 'Stock: $stock',
      color: color,
      icon: isLowStock ? LucideIcons.circleAlert : LucideIcons.check,
    );
  }

  Widget _buildFilterChips({
    required BuildContext context,
    required List<String> items,
    required String? selectedItem,
    required String allLabel,
    required ValueChanged<String?> onSelected,
  }) {
    final allItems = [allLabel, ...items.where((i) => i != allLabel)];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(
        horizontal: AppDesign.paddingM,
        vertical: AppDesign.spaceXS,
      ),
      child: Row(
        children: allItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = item == selectedItem ||
              (selectedItem == null && item == allLabel);

          return Padding(
            padding: EdgeInsets.only(
              right: index == allItems.length - 1 ? 0 : AppDesign.paddingS,
            ),
            child: FilterChip(
              label: Text(item),
              selected: isSelected,
              onSelected: (selected) {
                HapticFeedback.selectionClick();
                onSelected(item == allLabel ? null : item);
              },
              backgroundColor: Theme.of(context).cardColor,
              selectedColor:
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              checkmarkColor: Theme.of(context).colorScheme.primary,
              labelStyle: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).textTheme.bodyMedium?.color,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: AppDesign.borderLarge,
                side: BorderSide(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).dividerColor,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
