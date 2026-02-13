import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/common/widgets/zentory_card.dart';

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ZentoryCard(
      margin: EdgeInsets.only(bottom: AppDesign.spaceS),
      padding: EdgeInsets.zero,
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: ListTile(
        leading: Icon(
          icon,
          color: color ?? Theme.of(context).colorScheme.onSurface,
          size: AppDesign.fontL,
        ),
        title: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: color,
                fontWeight: FontWeight.normal,
                fontSize: AppDesign.fontM,
              ),
        ),
        trailing: Icon(
          LucideIcons.chevronRight,
          size: AppDesign.fontS,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
