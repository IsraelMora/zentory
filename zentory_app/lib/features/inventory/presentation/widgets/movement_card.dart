import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/common/widgets/zentory_ui_components.dart';
import 'package:zentory_app/features/inventory/domain/entities/movement.dart';
import 'package:zentory_app/l10n/app_localizations.dart';

class MovementCard extends StatelessWidget {
  final MovementEntity movement;

  const MovementCard({
    super.key,
    required this.movement,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    final isPositive = movement.type == MovementType.inflow;
    final color =
        isPositive ? AppDesign.success : Theme.of(context).colorScheme.error;
    final icon = isPositive ? LucideIcons.trendingUp : LucideIcons.trendingDown;

    return Padding(
      padding: EdgeInsets.only(bottom: AppDesign.spaceS),
      child: ZentoryCard(
        padding: EdgeInsets.all(AppDesign.paddingM),
        child: Row(
          children: [
            ZentoryIconContainer(
              icon: icon,
              color: color,
              size: AppDesign.fontL,
              padding: AppDesign.paddingS,
            ),
            SizedBox(width: AppDesign.paddingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movement.productName,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: AppDesign.spaceXS),
                  Text(
                    movement.reason,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  SizedBox(height: AppDesign.spaceXS),
                  Row(
                    children: [
                      Icon(
                        LucideIcons.user,
                        size: AppDesign.fontM,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: AppDesign.spaceXS),
                      Text(
                        movement.userName ?? l10n.unknownUser,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      SizedBox(width: AppDesign.spaceS),
                      Icon(
                        LucideIcons.calendar,
                        size: AppDesign.fontM,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: AppDesign.spaceXS),
                      Text(
                        DateFormat('dd/MM HH:mm').format(movement.createdAt),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withValues(alpha: 0.7),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${isPositive ? '+' : '-'}${movement.quantity}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppDesign.fontL,
                    color: color,
                  ),
                ),
                Text(
                  movement.type == MovementType.adjustment
                      ? l10n.adjustment
                      : (isPositive
                          ? l10n.movementInflow
                          : l10n.movementOutflow),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
