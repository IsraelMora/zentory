import 'package:flutter/material.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/common/widgets/zentory_ui_components.dart';

class InventoryShimmerLoading extends StatelessWidget {
  const InventoryShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(AppDesign.paddingM),
      itemCount: 6,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: AppDesign.spaceM),
        child: ZentoryShimmer.card(),
      ),
    );
  }
}
