import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class ZentoryFeedback {
  static void showSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              LucideIcons.circleCheck,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              size: AppDesign.fontL,
            ),
            SizedBox(width: AppDesign.paddingM),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.normal,
                      fontSize: AppDesign.fontM,
                    ),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: AppDesign.borderMedium),
        margin: EdgeInsets.all(AppDesign.paddingM),
      ),
    );
  }

  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              LucideIcons.circleAlert,
              color: Theme.of(context).colorScheme.onErrorContainer,
              size: AppDesign.fontL,
            ),
            SizedBox(width: AppDesign.paddingM),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                      fontWeight: FontWeight.normal,
                      fontSize: AppDesign.fontM,
                    ),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: AppDesign.borderMedium),
        margin: EdgeInsets.all(AppDesign.paddingM),
      ),
    );
  }
}
