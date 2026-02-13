import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/features/inventory/domain/entities/product.dart';
import 'package:zentory_app/features/inventory/presentation/bloc/inventory_bloc.dart';

import 'package:zentory_app/l10n/app_localizations.dart';

class CategoryFilters extends StatelessWidget {
  final List<ProductEntity> products;
  final String? selectedCategory;

  const CategoryFilters({
    super.key,
    required this.products,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    final categories = products.map((p) => p.category).toSet().toList()..sort();
    categories.insert(0, '');

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(
        horizontal: AppDesign.paddingM,
        vertical: AppDesign.spaceXS,
      ),
      child: Row(
        children: categories.asMap().entries.map((entry) {
          final index = entry.key;
          final category = entry.value;
          final isSelected = (category == '' &&
                  (selectedCategory == null || selectedCategory!.isEmpty)) ||
              category == selectedCategory;

          return Padding(
            padding: EdgeInsets.only(
              right: index == categories.length - 1 ? 0 : AppDesign.paddingS,
            ),
            child: FilterChip(
              label: Text(category == '' ? l10n.all : category),
              selected: isSelected,
              onSelected: (selected) {
                HapticFeedback.selectionClick();
                context.read<InventoryBloc>().add(
                      InventoryEvent.categoryFilterChanged(
                        category == '' ? null : category,
                      ),
                    );
              },
              backgroundColor: Theme.of(context).cardColor,
              selectedColor: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.1),
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
