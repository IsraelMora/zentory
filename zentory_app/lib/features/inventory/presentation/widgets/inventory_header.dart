import 'package:flutter/material.dart';

import 'package:zentory_app/core/widgets/zentory_ui_components.dart';

class InventoryHeader extends StatelessWidget {
  const InventoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const ZentoryHeader(
      title: 'Productos',
      subtitle: 'Gestión de Inventario',
      // No trailing widget needed here as per original design
    );
  }
}
