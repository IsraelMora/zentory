import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/common/widgets/zentory_ui_components.dart';
import 'package:zentory_app/features/inventory/domain/entities/product.dart';
import 'package:zentory_app/features/inventory/domain/enums/product_category.dart';
import 'package:zentory_app/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:zentory_app/features/inventory/presentation/models/product_form_model.dart';

import 'package:zentory_app/l10n/app_localizations.dart';

class ProductFormDialog extends StatefulWidget {
  final ProductEntity? product;
  final String workspaceId;
  final Function(ProductEntity) onSave;
  final Function(String)? onDelete;

  const ProductFormDialog({
    super.key,
    this.product,
    required this.workspaceId,
    required this.onSave,
    this.onDelete,
  });

  @override
  State<ProductFormDialog> createState() => _ProductFormDialogState();
}

class _ProductFormDialogState extends State<ProductFormDialog> {
  late ProductFormModel _formModel;
  String? _imageUrl;
  bool _isUploading = false;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _imageUrl = widget.product?.imageUrl;

    _formModel = ProductFormModel(
      name: widget.product?.name ?? '',
      description: widget.product?.description ?? '',
      price: widget.product?.price ?? 0.0,
      stock: widget.product?.stock ?? 0,
      category: widget.product?.category ?? ProductCategory.general.displayName,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.product != null;
    final l10n = L10n.of(context)!;

    return BlocListener<InventoryBloc, InventoryState>(
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
          loaded: (
            all,
            filtered,
            query,
            category,
            lastUrl,
            uploading,
            max,
            loading,
          ) {
            if (!uploading && lastUrl != null) {
              setState(() {
                _imageUrl = lastUrl;
                _isUploading = false;
              });
            }
          },
          orElse: () {},
        );
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: AppDesign.borderLarge),
        backgroundColor: Theme.of(context).cardColor,
        child: Container(
          padding: EdgeInsets.all(AppDesign.paddingL),
          constraints: const BoxConstraints(maxWidth: 400),
          child: ReactiveForm(
            formGroup: _formModel.form,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isEditing ? l10n.editProduct : l10n.addProduct,
                        style: Theme.of(
                          context,
                        )
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: AppDesign.fontL),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(LucideIcons.circleX, size: AppDesign.fontL),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDesign.spaceXL),
                  _buildPhotoSection(context, l10n),
                  SizedBox(height: AppDesign.spaceL),
                  ReactiveTextField<String>(
                    formControl: _formModel.nameControl,
                    decoration: InputDecoration(
                      labelText: l10n.productName,
                      prefixIcon: Icon(
                        LucideIcons.package,
                        size: AppDesign.fontL,
                      ),
                    ),
                  ),
                  SizedBox(height: AppDesign.spaceM),
                  ReactiveTextField<String>(
                    formControl: _formModel.descriptionControl,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: l10n.descriptionOptional,
                      prefixIcon: Icon(LucideIcons.type, size: AppDesign.fontL),
                    ),
                  ),
                  SizedBox(height: AppDesign.spaceM),
                  Row(
                    children: [
                      Expanded(
                        child: ReactiveTextField<double>(
                          formControl: _formModel.priceControl,
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
                          formControl: _formModel.stockControl,
                          decoration: InputDecoration(
                            labelText: l10n.stock,
                            prefixIcon:
                                Icon(LucideIcons.hash, size: AppDesign.fontL),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDesign.spaceM),
                  ReactiveDropdownField<String>(
                    formControl: _formModel.categoryControl,
                    decoration: InputDecoration(
                      labelText: l10n.category,
                      prefixIcon: Icon(LucideIcons.tag, size: AppDesign.fontL),
                    ),
                    items: ProductCategory.displayNames
                        .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                    onChanged: (val) {
                      HapticFeedback.selectionClick();
                    },
                  ),
                  SizedBox(height: AppDesign.spaceXL),
                  ElevatedButton(
                    onPressed: () {
                      if (_formModel.form.valid) {
                        HapticFeedback.heavyImpact();
                        final product = ProductEntity(
                          id: widget.product?.id ?? '',
                          workspaceId: widget.workspaceId,
                          name: _formModel.nameControl.value!,
                          description:
                              _formModel.descriptionControl.value ?? '',
                          price: _formModel.priceControl.value!,
                          stock: _formModel.stockControl.value!,
                          imageUrl: _imageUrl,
                          sku: widget.product?.sku ?? '',
                          category: _formModel.categoryControl.value!,
                        );
                        widget.onSave(product);
                        Navigator.pop(context);
                      } else {
                        _formModel.form.markAllAsTouched();
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
                  if (isEditing && widget.onDelete != null) ...[
                    SizedBox(height: AppDesign.spaceS),
                    TextButton(
                      onPressed: () {
                        HapticFeedback.heavyImpact();
                        _showDeleteConfirmation(context, l10n);
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
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoSection(BuildContext context, L10n l10n) {
    return Center(
      child: SizedBox(
        width: AppDesign.paddingXL,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppDesign.borderMedium,
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: Material(
              color: Theme.of(context).cardColor,
              borderRadius: AppDesign.borderMedium,
              clipBehavior: Clip.hardEdge,
              child: _imageUrl != null
                  ? Ink.image(
                      image: CachedNetworkImageProvider(_imageUrl!),
                      fit: BoxFit.cover,
                      child: InkWell(
                        onTap: () {
                          HapticFeedback.lightImpact();
                          _pickImage();
                        },
                        child: _isUploading
                            ? const Center(child: CircularProgressIndicator())
                            : null,
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        HapticFeedback.lightImpact();
                        _pickImage();
                      },
                      child: _isUploading
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  LucideIcons.camera,
                                  size: AppDesign.fontXXL,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                SizedBox(height: AppDesign.spaceXS),
                                Text(
                                  l10n.addPhoto,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(fontSize: AppDesign.fontXS),
                                ),
                              ],
                            ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _isUploading = true;
      });
      if (mounted) {
        context.read<InventoryBloc>().add(
              InventoryEvent.productImageUploadRequested(
                  image.path, image.name),
            );
      }
    }
  }

  void _showDeleteConfirmation(BuildContext context, L10n l10n) {
    ZentoryDialogs.showActionDialog(
      context: context,
      title: l10n.deleteProductConfirm,
      description: l10n.deleteProductDesc,
      confirmLabel: l10n.confirm, // or l10n.delete
      confirmColor: Theme.of(context).colorScheme.error,
      icon: LucideIcons.trash2,
      onConfirm: () {
        Navigator.pop(context); // Close form
        widget.onDelete!(widget.product!.id);
      },
    );
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }
}
