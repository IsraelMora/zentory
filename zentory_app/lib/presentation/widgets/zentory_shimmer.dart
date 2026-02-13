import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class ZentoryShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double? borderRadius;
  final bool isCircle;

  const ZentoryShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.isCircle = false,
  });

  factory ZentoryShimmer.card({double? width, double? height}) =>
      ZentoryShimmer(
        width: width ?? double.infinity,
        height: height ?? 100,
        borderRadius: AppDesign.radiusMedium,
      );

  factory ZentoryShimmer.line({double? width, double height = 16}) =>
      ZentoryShimmer(
        width: width ?? double.infinity,
        height: height,
        borderRadius: AppDesign.radiusSmall,
      );

  factory ZentoryShimmer.circle({required double size}) => ZentoryShimmer(
        width: size,
        height: size,
        isCircle: true,
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;

    final baseColor = isLight ? theme.dividerColor : theme.cardColor;
    final highlightColor =
        isLight ? theme.cardColor : theme.dividerColor.withValues(alpha: 0.5);

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: baseColor,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: !isCircle
              ? BorderRadius.circular(borderRadius ?? AppDesign.radiusMedium)
              : null,
        ),
      ),
    );
  }
}
