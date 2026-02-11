import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class ZentoryErrorState extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onRetry;
  final String? retryLabel;
  final IconData? icon;

  const ZentoryErrorState({
    super.key,
    required this.title,
    required this.message,
    this.onRetry,
    this.retryLabel,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppDesign.paddingXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(AppDesign.paddingL),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .errorContainer
                    .withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon ?? LucideIcons.circleAlert,
                size: AppDesign.fontDisplay * 1.5,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            SizedBox(height: AppDesign.spaceXL),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: AppDesign.fontXL,
                  ),
            ),
            SizedBox(height: AppDesign.spaceS),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: AppDesign.fontM,
                  ),
            ),
            if (onRetry != null) ...[
              SizedBox(height: AppDesign.spaceXL),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: Icon(LucideIcons.refreshCw, size: AppDesign.fontL),
                label: Text(retryLabel ?? 'Reintentar'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDesign.paddingXL,
                    vertical: AppDesign.paddingM,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
