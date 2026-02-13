import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:zentory_app/presentation/widgets/zentory_header.dart';
import 'package:zentory_app/presentation/widgets/zentory_empty_state.dart';
import 'package:zentory_app/l10n/app_localizations.dart';

@RoutePage()
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          ZentoryHeader(
            title: context.watchRouter.current.title(context),
            showNotificationButton: false,
          ),
          Expanded(
            child: ZentoryEmptyState(
              title: L10n.of(context)!.allCaughtUp,
              description: L10n.of(context)!.allCaughtUpDesc,
              icon: LucideIcons.bell,
            ),
          ),
        ],
      ),
    );
  }
}
