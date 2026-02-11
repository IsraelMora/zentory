import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class LowStockList extends StatelessWidget {
  final List<dynamic> items;

  const LowStockList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        return Container(
          margin: EdgeInsets.only(bottom: AppDesign.spaceS),
          padding: EdgeInsets.all(AppDesign.paddingM),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: AppDesign.borderMedium,
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.error.withValues(alpha: 0.1),
                child: Icon(
                  LucideIcons.triangleAlert,
                  color: Theme.of(context).colorScheme.error,
                  size: AppDesign.fontL,
                ),
              ),
              SizedBox(width: AppDesign.paddingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: AppDesign.fontM,
                          ),
                    ),
                    Text(
                      'Quedan solo ${item.stock} unidades',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: AppDesign.fontS,
                          ),
                    ),
                  ],
                ),
              ),
              Icon(
                LucideIcons.chevronRight,
                color: Theme.of(context).colorScheme.secondary,
                size: AppDesign.fontS,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
