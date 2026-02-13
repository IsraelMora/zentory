import 'package:flutter/material.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/common/widgets/zentory_card.dart';
import 'package:zentory_app/common/widgets/zentory_icon_container.dart';

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ZentoryCard(
      borderRadius: AppDesign.borderLarge,
      padding: EdgeInsets.all(AppDesign.paddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ZentoryIconContainer(
            icon: icon,
            color: color,
            padding: AppDesign.paddingXS,
            isCircle: false,
            size: AppDesign.fontL,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: AppDesign.fontXL,
                ),
              ),
              Text(
                label,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontSize: AppDesign.fontS,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
