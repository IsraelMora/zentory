import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/common/widgets/zentory_ui_components.dart';
import 'package:zentory_app/features/inventory/domain/entities/product.dart';
import 'package:zentory_app/common/utils/extensions.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ZentoryCard(
      onTap: onTap,
      margin: EdgeInsets.only(bottom: AppDesign.spaceS),
      child: Row(
        children: [
          _ProductImage(imageUrl: product.imageUrl),
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
                    _PriceAndCategory(
                      price: product.price,
                      category: product.category,
                    ),
                    _StockBadge(stock: product.stock),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String? imageUrl;
  const _ProductImage({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;
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
                    image: CachedNetworkImageProvider(imageUrl!),
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
}

class _PriceAndCategory extends StatelessWidget {
  final double price;
  final String category;

  const _PriceAndCategory({required this.price, required this.category});

  @override
  Widget build(BuildContext context) {
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
}

class _StockBadge extends StatelessWidget {
  final int stock;
  const _StockBadge({required this.stock});

  @override
  Widget build(BuildContext context) {
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
}
