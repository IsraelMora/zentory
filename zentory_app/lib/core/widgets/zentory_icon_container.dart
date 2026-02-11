import 'package:flutter/material.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class ZentoryIconContainer extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;
  final Color? backgroundColor;
  final double? padding;
  final bool isCircle;

  const ZentoryIconContainer({
    super.key,
    required this.icon,
    this.size,
    this.color,
    this.backgroundColor,
    this.padding,
    this.isCircle = true,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = color ?? Theme.of(context).colorScheme.primary;
    return Container(
      padding: EdgeInsets.all(padding ?? AppDesign.paddingL),
      decoration: BoxDecoration(
        color: backgroundColor ?? themeColor.withValues(alpha: 0.1),
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : AppDesign.borderMedium,
      ),
      child: Icon(
        icon,
        size: size ?? AppDesign.fontDisplay,
        color: themeColor,
      ),
    );
  }
}
