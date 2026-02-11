import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/features/inventory/domain/entities/product.dart';
import 'package:zentory_app/features/inventory/presentation/bloc/inventory_bloc.dart';

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
    final categories = products.map((p) => p.category).toSet().toList()..sort();
    categories.insert(0, '');

    return SizedBox(
      height: AppDesign.spaceL * 2.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: AppDesign.paddingM,
          vertical: AppDesign.spaceXS,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = (category == '' &&
                  (selectedCategory == null || selectedCategory!.isEmpty)) ||
              category == selectedCategory;

          return Padding(
            padding: EdgeInsets.only(right: AppDesign.paddingS),
            child: FilterChip(
              label: Text(category == '' ? 'Todos' : category),
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
        },
      ),
    );
  }
}
