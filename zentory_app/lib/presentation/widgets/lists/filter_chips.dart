import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class FilterChips extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final String allLabel;
  final ValueChanged<String?> onSelected;

  const FilterChips({
    super.key,
    required this.items,
    this.selectedItem,
    required this.allLabel,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final allItems = [allLabel, ...items.where((i) => i != allLabel)];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(
        horizontal: AppDesign.paddingM,
        vertical: AppDesign.spaceXS,
      ),
      child: Row(
        children: allItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = item == selectedItem ||
              (selectedItem == null && item == allLabel);

          return Padding(
            padding: EdgeInsets.only(
              right: index == allItems.length - 1 ? 0 : AppDesign.paddingS,
            ),
            child: FilterChip(
              label: Text(item),
              selected: isSelected,
              onSelected: (selected) {
                HapticFeedback.selectionClick();
                onSelected(item == allLabel ? null : item);
              },
              backgroundColor: Theme.of(context).cardColor,
              selectedColor:
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              checkmarkColor: Theme.of(context).colorScheme.primary,
              labelStyle: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).textTheme.bodyMedium?.color,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: AppDesign.borderLarge,
                side: BorderSide(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).dividerColor,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
