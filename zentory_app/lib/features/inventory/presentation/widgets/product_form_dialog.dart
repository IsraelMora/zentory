import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/widgets/zentory_ui_components.dart';
import 'package:zentory_app/features/inventory/domain/entities/product.dart';
import 'package:zentory_app/features/inventory/presentation/bloc/inventory_bloc.dart';

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
  late FormGroup _form;
  String? _imageUrl;
  bool _isUploading = false;
  final ImagePicker _picker = ImagePicker();

  final List<String> _categories = [
    'General',
    'Alimentos',
    'Bebidas',
    'Limpieza',
    'Electrónica',
    'Hogar',
  ];

  @override
  void initState() {
    super.initState();
    _imageUrl = widget.product?.imageUrl;

    _form = FormGroup({
      'name': FormControl<String>(
        value: widget.product?.name,
        validators: [Validators.required, Validators.minLength(3)],
      ),
      'description': FormControl<String>(value: widget.product?.description),
      'price': FormControl<double>(
        value: widget.product?.price,
        validators: [Validators.required, Validators.min(0)],
      ),
      'stock': FormControl<int>(
        value: widget.product?.stock,
        validators: [Validators.required, Validators.min(0)],
      ),
      'category': FormControl<String>(
        value: widget.product?.category ?? 'General',
        validators: [Validators.required],
      ),
    });

    if (widget.product?.category != null &&
        !_categories.contains(widget.product!.category)) {
      _categories.add(widget.product!.category);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.product != null;

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
            formGroup: _form,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isEditing ? 'Editar Producto' : 'Nuevo Producto',
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
                  Center(
                    child: Container(
                      width: 30.w,
                      height: 30.w,
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
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : null,
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  HapticFeedback.lightImpact();
                                  _pickImage();
                                },
                                child: _isUploading
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            LucideIcons.camera,
                                            size: AppDesign.fontXXL,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                          ),
                                          SizedBox(height: AppDesign.spaceXS),
                                          Text(
                                            'Añadir foto',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(
                                                    fontSize: AppDesign.fontXS),
                                          ),
                                        ],
                                      ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppDesign.spaceL),
                  ReactiveTextField<String>(
                    formControlName: 'name',
                    decoration: InputDecoration(
                      labelText: 'Nombre del producto',
                      prefixIcon: Icon(
                        LucideIcons.package,
                        size: AppDesign.fontL,
                      ),
                    ),
                    validationMessages: {
                      ValidationMessage.required: (error) => 'Obligatorio',
                      ValidationMessage.minLength: (error) =>
                          'Mínimo 3 caracteres',
                    },
                  ),
                  SizedBox(height: AppDesign.spaceM),
                  ReactiveTextField<String>(
                    formControlName: 'description',
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: 'Descripción (opcional)',
                      prefixIcon: Icon(LucideIcons.type, size: AppDesign.fontL),
                    ),
                  ),
                  SizedBox(height: AppDesign.spaceM),
                  Row(
                    children: [
                      Expanded(
                        child: ReactiveTextField<double>(
                          formControlName: 'price',
                          decoration: InputDecoration(
                            labelText: 'Precio',
                            prefixIcon: Icon(
                              LucideIcons.dollarSign,
                              size: AppDesign.fontL,
                            ),
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          validationMessages: {
                            ValidationMessage.required: (error) =>
                                'Obligatorio',
                            ValidationMessage.min: (error) => 'No negativo',
                            ValidationMessage.number: (error) => 'Inválido',
                          },
                        ),
                      ),
                      SizedBox(width: AppDesign.spaceM),
                      Expanded(
                        child: ReactiveTextField<int>(
                          formControlName: 'stock',
                          decoration: InputDecoration(
                            labelText: 'Stock',
                            prefixIcon:
                                Icon(LucideIcons.hash, size: AppDesign.fontL),
                          ),
                          keyboardType: TextInputType.number,
                          validationMessages: {
                            ValidationMessage.required: (error) =>
                                'Obligatorio',
                            ValidationMessage.min: (error) => 'No negativo',
                            ValidationMessage.number: (error) => 'Inválido',
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDesign.spaceM),
                  ReactiveDropdownField<String>(
                    formControlName: 'category',
                    decoration: InputDecoration(
                      labelText: 'Categoría',
                      prefixIcon: Icon(LucideIcons.tag, size: AppDesign.fontL),
                    ),
                    items: _categories
                        .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                    onChanged: (val) {
                      HapticFeedback.selectionClick();
                    },
                  ),
                  SizedBox(height: AppDesign.spaceXL),
                  ElevatedButton(
                    onPressed: () {
                      if (_form.valid) {
                        HapticFeedback.heavyImpact();
                        final product = ProductEntity(
                          id: widget.product?.id ?? '',
                          workspaceId: widget.workspaceId,
                          name: _form.control('name').value as String,
                          description:
                              _form.control('description').value as String? ??
                                  '',
                          price: _form.control('price').value as double,
                          stock: _form.control('stock').value as int,
                          imageUrl: _imageUrl,
                          sku: widget.product?.sku ?? '',
                          category: _form.control('category').value as String,
                        );
                        widget.onSave(product);
                        Navigator.pop(context);
                      } else {
                        _form.markAllAsTouched();
                        HapticFeedback.vibrate();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, AppDesign.spaceL * 2),
                    ),
                    child: Text(
                      isEditing ? 'Guardar Cambios' : 'Crear Producto',
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
                        _showDeleteConfirmation(context);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.error,
                        minimumSize:
                            Size(double.infinity, AppDesign.spaceL * 2),
                      ),
                      child: Text(
                        'Eliminar Producto',
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

  void _showDeleteConfirmation(BuildContext context) {
    ZentoryDialogs.showActionDialog(
      context: context,
      title: '¿Eliminar producto?',
      description:
          'Esta acción no se puede deshacer y eliminará todo el historial de movimientos.',
      confirmLabel: 'Eliminar',
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
    _form.dispose();
    super.dispose();
  }
}
