import 'package:flutter/material.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/widgets/zentory_ui_components.dart';

class InventoryShimmerLoading extends StatelessWidget {
  const InventoryShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(AppDesign.paddingM),
      itemCount: 6,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: AppDesign.spaceS),
        child: ZentoryShimmer(
          width: double.infinity,
          height: AppDesign.spaceL * 4,
        ),
      ),
    );
  }
}
