import 'package:flutter/material.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class ZentoryBadge extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;

  const ZentoryBadge({
    super.key,
    required this.label,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDesign.paddingS,
        vertical: 2,
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
              size: AppDesign.fontS,
              color: color,
            ),
            SizedBox(width: AppDesign.spaceXS),
          ],
          Text(
            label,
            style:
                Theme.of(context).textTheme.labelSmall?.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
