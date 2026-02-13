import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class ImagePickerField extends StatelessWidget {
  final String? imageUrl;
  final bool isUploading;
  final VoidCallback onTap;
  final String placeholderText;
  final IconData placeholderIcon;

  const ImagePickerField({
    super.key,
    this.imageUrl,
    this.isUploading = false,
    required this.onTap,
    required this.placeholderText,
    this.placeholderIcon = LucideIcons.camera,
  });

  @override
  Widget build(BuildContext context) {
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
              child: InkWell(
                onTap: () {
                  HapticFeedback.lightImpact();
                  onTap();
                },
                child: _buildContent(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);
    if (isUploading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Ink.image(
        image: CachedNetworkImageProvider(imageUrl!),
        fit: BoxFit.cover,
        child: Container(),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          placeholderIcon,
          size: AppDesign.fontXXL,
          color: theme.colorScheme.secondary,
        ),
        SizedBox(height: AppDesign.spaceXS),
        Text(
          placeholderText,
          style: theme.textTheme.labelLarge?.copyWith(
            fontSize: AppDesign.fontXS,
            color: theme.colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
