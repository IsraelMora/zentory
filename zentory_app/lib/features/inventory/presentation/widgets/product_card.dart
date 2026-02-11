import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/features/inventory/domain/entities/product.dart';

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
    return Card(
      margin: EdgeInsets.only(bottom: AppDesign.spaceS),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppDesign.borderMedium,
        side: BorderSide(color: Theme.of(context).dividerColor),
      ),
      child: InkWell(
        borderRadius: AppDesign.borderMedium,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(AppDesign.paddingM),
          child: Row(
            children: [
              Container(
                width: 18.w,
                height: 18.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: AppDesign.borderSmall,
                  image: product.imageUrl != null &&
                          product.imageUrl!.isNotEmpty
                      ? DecorationImage(
                          image: CachedNetworkImageProvider(product.imageUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: product.imageUrl == null || product.imageUrl!.isEmpty
                    ? Icon(
                        LucideIcons.image,
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    : null,
              ),
              SizedBox(width: AppDesign.spaceM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: AppDesign.fontM,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: AppDesign.spaceXS),
                    Text(
                      product.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: AppDesign.fontS,
                          ),
                    ),
                    SizedBox(height: AppDesign.spaceS),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppDesign.fontM,
                                  ),
                            ),
                            SizedBox(height: AppDesign.spaceXS),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppDesign.paddingXS,
                                vertical: AppDesign.spaceXS / 2,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerHighest,
                                borderRadius: AppDesign.borderSmall,
                              ),
                              child: Text(
                                product.category,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDesign.paddingS,
                            vertical: AppDesign.spaceXS,
                          ),
                          decoration: BoxDecoration(
                            color: product.stock < 5
                                ? Theme.of(
                                    context,
                                  ).colorScheme.error.withOpacity(0.1)
                                : AppDesign.success.withOpacity(0.1),
                            borderRadius: AppDesign.borderSmall,
                          ),
                          child: Text(
                            'Stock: ${product.stock}',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: product.stock < 5
                                      ? Theme.of(context).colorScheme.error
                                      : AppDesign.success,
                                  fontSize: AppDesign.fontS,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
