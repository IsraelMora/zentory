import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zentory_app/common/widgets/zentory_ui_components.dart';

class InventoryHeader extends StatelessWidget {
  const InventoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ZentoryHeader(
      title: context.router.current.title(context),
    );
  }
}
