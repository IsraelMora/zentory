import 'package:flutter/material.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/common/widgets/zentory_card.dart';
import 'package:zentory_app/common/widgets/zentory_icon_container.dart';

class AlertCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;

  const AlertCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ZentoryCard(
      margin: EdgeInsets.only(bottom: AppDesign.spaceS),
      padding: EdgeInsets.all(AppDesign.paddingM),
      onTap: onTap,
      child: Row(
        children: [
          ZentoryIconContainer(
            icon: icon,
            color: iconColor,
            size: AppDesign.fontL,
            padding: AppDesign.paddingS,
          ),
          SizedBox(width: AppDesign.paddingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: AppDesign.fontM,
                      ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: AppDesign.fontS,
                      ),
                ),
              ],
            ),
          ),
          if (onTap != null)
            Icon(
              Icons.chevron_right,
              color: Theme.of(context).colorScheme.secondary,
              size: AppDesign.fontS,
            ),
        ],
      ),
    );
  }
}
