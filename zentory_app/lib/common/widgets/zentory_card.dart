import 'package:flutter/material.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class ZentoryCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? color;
  final bool showBorder;

  const ZentoryCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.borderRadius,
    this.color,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? AppDesign.borderMedium;

    Widget content = Padding(
      padding: padding ?? EdgeInsets.all(AppDesign.paddingM),
      child: child,
    );

    if (onTap != null) {
      content = InkWell(
        onTap: onTap,
        borderRadius: effectiveBorderRadius,
        child: content,
      );
    }

    return Card(
      elevation: 0,
      margin: margin,
      color: color ?? Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: effectiveBorderRadius,
        side: showBorder
            ? BorderSide(color: Theme.of(context).dividerColor)
            : BorderSide.none,
      ),
      child: content,
    );
  }
}
