import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../core/theme/app_ui_constants.dart';

class ZentoryTextField extends StatelessWidget {
  final String formControlName;
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Map<String, String Function(Object)>? validationMessages;
  final void Function(FormControl<Object?>)? onSubmitted;

  const ZentoryTextField({
    super.key,
    required this.formControlName,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validationMessages,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ReactiveTextField(
      formControlName: formControlName,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validationMessages: validationMessages,
      onSubmitted: onSubmitted,
      style: theme.textTheme.bodyMedium,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: theme.colorScheme.primary,
                size: AppFontSize.xl,
              )
            : null,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
      ),
    );
  }
}
