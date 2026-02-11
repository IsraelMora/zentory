import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:zentory_app/core/widgets/zentory_ui_components.dart';

@RoutePage()
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          const ZentoryHeader(
            title: 'Notificaciones',
            subtitle: 'Tus alertas',
            showNotificationButton: false,
          ),
          const Expanded(
            child: ZentoryEmptyState(
              title: 'Todo al día',
              description:
                  'No tienes notificaciones pendientes en este momento.',
              icon: LucideIcons.bell,
            ),
          ),
        ],
      ),
    );
  }
}
