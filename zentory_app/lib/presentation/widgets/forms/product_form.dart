import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class ProductForm extends StatelessWidget {
  final FormGroup form;
  final String? imageUrl;
  final bool isUploadingImage;
  final bool isEditing;
  final List<DropdownMenuItem<String>> categoryItems;
  final VoidCallback onImageTap;
  final VoidCallback onSubmit;
  final VoidCallback? onDelete;
  final String nameLabel;
  final String descriptionLabel;
  final String priceLabel;
  final String stockLabel;
  final String categoryLabel;
  final String addPhotoLabel;
  final String saveButtonLabel;
  final String createButtonLabel;
  final String deleteButtonLabel;

  const ProductForm({
    super.key,
    required this.form,
    this.imageUrl,
    this.isUploadingImage = false,
    required this.isEditing,
    required this.categoryItems,
    required this.onImageTap,
    required this.onSubmit,
    this.onDelete,
    required this.nameLabel,
    required this.descriptionLabel,
    required this.priceLabel,
    required this.stockLabel,
    required this.categoryLabel,
    required this.addPhotoLabel,
    required this.saveButtonLabel,
    required this.createButtonLabel,
    required this.deleteButtonLabel,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Picker
            _buildImagePicker(context),
            SizedBox(height: AppDesign.spaceL),

            // Name Field
            ReactiveTextField<String>(
              formControlName: 'name',
              decoration: InputDecoration(
                labelText: nameLabel,
                prefixIcon: Icon(LucideIcons.package, size: AppDesign.fontL),
              ),
            ),
            SizedBox(height: AppDesign.spaceM),

            // Description Field
            ReactiveTextField<String>(
              formControlName: 'description',
              maxLines: 2,
              decoration: InputDecoration(
                labelText: descriptionLabel,
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
                      labelText: priceLabel,
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
                      labelText: stockLabel,
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
                labelText: categoryLabel,
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
                isEditing ? saveButtonLabel : createButtonLabel,
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
                  onDelete!();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                  minimumSize: Size(double.infinity, AppDesign.spaceXL),
                ),
                child: Text(
                  deleteButtonLabel,
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

  Widget _buildImagePicker(BuildContext context) {
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
                child: _buildImageContent(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageContent(BuildContext context) {
    final theme = Theme.of(context);
    if (isUploadingImage) {
      return const Center(child: CircularProgressIndicator());
    }

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Image.network(
        imageUrl!,
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
          addPhotoLabel,
          style: theme.textTheme.labelLarge?.copyWith(
            fontSize: AppDesign.fontXS,
            color: theme.colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
