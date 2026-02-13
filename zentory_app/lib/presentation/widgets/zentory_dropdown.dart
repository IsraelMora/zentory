import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class ZentoryDropdown<T> extends StatelessWidget {
  final FormControl<T> formControl;
  final String labelText;
  final List<T> items;
  final String Function(T) itemLabelBuilder;
  final IconData? prefixIcon;
  final Map<String, String Function(Object)>? validationMessages;

  const ZentoryDropdown({
    super.key,
    required this.formControl,
    required this.labelText,
    required this.items,
    required this.itemLabelBuilder,
    this.prefixIcon,
    this.validationMessages,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveDropdownField<T>(
      formControl: formControl,
      validationMessages: validationMessages,
      onChanged: (_) => HapticFeedback.selectionClick(),
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                size: AppDesign.fontL,
              )
            : null,
      ),
      items: items
          .map(
            (item) => DropdownMenuItem<T>(
              value: item,
              child: Text(itemLabelBuilder(item)),
            ),
          )
          .toList(),
    );
  }
}
