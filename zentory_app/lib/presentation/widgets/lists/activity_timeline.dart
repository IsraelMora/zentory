import 'package:flutter/material.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class ActivityItem {
  final String title;
  final String subtitle;
  final Color indicatorColor;

  const ActivityItem({
    required this.title,
    required this.subtitle,
    required this.indicatorColor,
  });
}

class ActivityTimeline extends StatelessWidget {
  final List<ActivityItem> items;
  final Widget? emptyWidget;
  final String emptyText;

  const ActivityTimeline({
    super.key,
    required this.items,
    this.emptyWidget,
    required this.emptyText,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return emptyWidget ??
          Container(
            padding: EdgeInsets.all(AppDesign.paddingL),
            alignment: Alignment.center,
            child: Text(
              emptyText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: AppDesign.fontM,
              ),
            ),
          );
    }

    return Column(
      children: items.map((item) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: AppDesign.spaceXS),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: AppDesign.paddingXS,
                  decoration: BoxDecoration(
                    color: item.indicatorColor,
                    borderRadius: AppDesign.borderSmall,
                  ),
                ),
                SizedBox(width: AppDesign.paddingM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: AppDesign.fontM,
                            ),
                      ),
                      Text(
                        item.subtitle,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              fontSize: AppDesign.fontXS,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
