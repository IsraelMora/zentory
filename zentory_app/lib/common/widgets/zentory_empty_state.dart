import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/common/widgets/zentory_icon_container.dart';

class ZentoryEmptyState extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback? onAction;
  final String? actionLabel;

  const ZentoryEmptyState({
    super.key,
    required this.title,
    required this.description,
    this.icon = LucideIcons.packageSearch,
    this.onAction,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppDesign.paddingXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZentoryIconContainer(
              icon: icon,
              size: 64,
            ),
            SizedBox(height: AppDesign.spaceL),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: AppDesign.fontXL,
                  ),
            ),
            SizedBox(height: AppDesign.spaceS),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: AppDesign.fontL,
                  ),
            ),
            if (onAction != null && actionLabel != null) ...[
              SizedBox(height: AppDesign.spaceXL),
              ElevatedButton(
                onPressed: onAction,
                child: Text(actionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
