import 'package:flutter/material.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const SectionHeader({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: AppDesign.fontL),
        SizedBox(width: AppDesign.paddingS),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: AppDesign.fontL,
              ),
        ),
      ],
    );
  }
}
