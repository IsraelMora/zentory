import 'package:flutter/material.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class ZentoryCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final Color? color;

  const ZentoryCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: padding ?? EdgeInsets.all(AppDesign.paddingM),
      child: child,
    );

    if (onTap != null) {
      content = InkWell(
        onTap: onTap,
        borderRadius: AppDesign.borderMedium,
        child: content,
      );
    }

    return Card(
      elevation: 0,
      margin: margin,
      color: color ?? Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: AppDesign.borderMedium,
        side: BorderSide(color: Theme.of(context).dividerColor),
      ),
      child: content,
    );
  }
}
