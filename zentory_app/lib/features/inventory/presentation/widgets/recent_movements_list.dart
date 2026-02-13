import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zentory_app/core/theme/app_design.dart';

import 'package:zentory_app/l10n/app_localizations.dart';

class RecentMovementsList extends StatelessWidget {
  final List<dynamic> movements;

  const RecentMovementsList({
    super.key,
    required this.movements,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    if (movements.isEmpty) {
      return Container(
        padding: EdgeInsets.all(AppDesign.paddingL),
        alignment: Alignment.center,
        child: Text(
          l10n.noRecentActivity,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: AppDesign.fontM,
          ),
        ),
      );
    }

    return Column(
      children: movements.map((m) {
        final isPositive = m.type.name == 'inflow';
        return Padding(
          padding: EdgeInsets.symmetric(vertical: AppDesign.spaceXS),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: AppDesign.paddingXS,
                  decoration: BoxDecoration(
                    color: isPositive
                        ? AppDesign.success
                        : Theme.of(context).colorScheme.error,
                    borderRadius: AppDesign.borderSmall,
                  ),
                ),
                SizedBox(width: AppDesign.paddingM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        m.productName,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: AppDesign.fontM,
                            ),
                      ),
                      Text(
                        '${isPositive ? l10n.movementInflow : l10n.movementOutflow} de ${m.quantity} • ${DateFormat('HH:mm').format(m.createdAt)}',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              fontSize: AppDesign.fontXS,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
