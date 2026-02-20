import 'package:flutter/material.dart';
import '../../core/theme/app_ui_constants.dart';

class ZentoryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isPrimary;
  final IconData? icon;

  const ZentoryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isPrimary = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Define colores base basándonos en si es primario o secundario y el tema actual
    final Color backgroundColor = isPrimary
        ? theme.colorScheme.primary
        : theme.colorScheme.surface;

    final Color foregroundColor = isPrimary
        ? theme.colorScheme.onPrimary
        : theme.colorScheme.onSurface;

    final borderSide = isPrimary
        ? BorderSide.none
        : BorderSide(color: theme.colorScheme.primary.withValues(alpha: 0.5));

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          disabledBackgroundColor: theme.colorScheme.surface.withValues(
            alpha: 0.5,
          ),
          disabledForegroundColor: theme.colorScheme.onSurface.withValues(
            alpha: 0.5,
          ),
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.md,
            side: borderSide,
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                height: AppFontSize.xl,
                width: AppFontSize.xl,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: foregroundColor,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: AppFontSize.lg),
                    SizedBox(width: AppSpacing.sm),
                  ],
                  Text(
                    text,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.md,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
