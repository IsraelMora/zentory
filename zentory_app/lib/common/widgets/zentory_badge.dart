import 'package:flutter/material.dart';
import 'package:zentory_app/core/theme/app_design.dart';

enum ZentoryBadgeSize { small, medium }

class ZentoryBadge extends StatelessWidget {
  final String label;
  final Color color;
  final ZentoryBadgeSize size;
  final IconData? icon;

  const ZentoryBadge({
    super.key,
    required this.label,
    required this.color,
    this.size = ZentoryBadgeSize.small,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isSmall = size == ZentoryBadgeSize.small;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? AppDesign.paddingS : AppDesign.paddingM,
        vertical: isSmall ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: AppDesign.borderSmall,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: isSmall ? AppDesign.fontS : AppDesign.fontM,
              color: color,
            ),
            SizedBox(width: AppDesign.spaceXS),
          ],
          Text(
            label,
            style: (isSmall
                    ? Theme.of(context).textTheme.labelSmall
                    : Theme.of(context).textTheme.labelLarge)
                ?.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
