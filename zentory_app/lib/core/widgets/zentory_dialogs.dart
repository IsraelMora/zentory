import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class ZentoryDialogs {
  static Future<T?> showActionDialog<T>({
    required BuildContext context,
    required String title,
    required String description,
    String? confirmLabel,
    String? cancelLabel,
    required VoidCallback onConfirm,
    Color? confirmColor,
    IconData? icon,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: AppDesign.borderLarge),
        backgroundColor: Theme.of(context).cardColor,
        child: Container(
          padding: EdgeInsets.all(AppDesign.paddingL),
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Container(
                  padding: EdgeInsets.all(AppDesign.paddingM),
                  decoration: BoxDecoration(
                    color:
                        (confirmColor ?? Theme.of(context).colorScheme.primary)
                            .withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: AppDesign.fontDisplay,
                    color:
                        confirmColor ?? Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: AppDesign.spaceM),
              ],
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: AppDesign.fontL,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: AppDesign.spaceS),
              Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: AppDesign.fontM,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              SizedBox(height: AppDesign.spaceXL),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(cancelLabel ?? 'Cancelar'),
                    ),
                  ),
                  SizedBox(width: AppDesign.spaceS),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        onConfirm();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: confirmColor,
                        foregroundColor:
                            confirmColor != null ? Colors.white : null,
                      ),
                      child: Text(confirmLabel ?? 'Confirmar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<T?> showCustomDialog<T>({
    required BuildContext context,
    required String title,
    required Widget child,
    List<Widget>? actions,
    double maxWidth = 400,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: AppDesign.borderLarge),
        backgroundColor: Theme.of(context).cardColor,
        child: Container(
          padding: EdgeInsets.all(AppDesign.paddingL),
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: AppDesign.fontL,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(LucideIcons.circleX, size: AppDesign.fontL),
                  ),
                ],
              ),
              SizedBox(height: AppDesign.spaceL),
              child,
              if (actions != null) ...[
                SizedBox(height: AppDesign.spaceL),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
