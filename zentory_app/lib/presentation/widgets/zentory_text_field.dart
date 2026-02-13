import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class ZentoryTextField<T> extends StatelessWidget {
  final FormControl<T> formControl;
  final String labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final Map<String, String Function(Object)>? validationMessages;
  final Widget? suffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;

  const ZentoryTextField({
    super.key,
    required this.formControl,
    required this.labelText,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.keyboardType,
    this.validationMessages,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<T>(
      formControl: formControl,
      obscureText: obscureText,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validationMessages: validationMessages,
      readOnly: readOnly,
      onTap: (_) => onTap?.call(),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                size: AppDesign.fontL,
              )
            : null,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
