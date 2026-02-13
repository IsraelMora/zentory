import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';

import 'package:zentory_app/common/widgets/zentory_ui_components.dart';
import 'package:zentory_app/l10n/app_localizations.dart';

class LowStockList extends StatelessWidget {
  final List<dynamic> items;

  const LowStockList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    return Column(
      children: items.map((item) {
        return Padding(
          padding: EdgeInsets.only(bottom: AppDesign.spaceS),
          child: ZentoryCard(
            padding: EdgeInsets.all(AppDesign.paddingM),
            child: Row(
              children: [
                ZentoryIconContainer(
                  icon: LucideIcons.triangleAlert,
                  color: Theme.of(context).colorScheme.error,
                  size: AppDesign.fontL,
                  padding: AppDesign.paddingS,
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
                        l10n.lowStockWarning(item.stock),
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
          ),
        );
      }).toList(),
    );
  }
}
