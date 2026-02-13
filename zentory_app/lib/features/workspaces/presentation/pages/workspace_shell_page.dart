import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/router/router.gr.dart';
import 'package:zentory_app/common/widgets/zentory_ui_components.dart';
import 'package:zentory_app/l10n/app_localizations.dart';

@RoutePage()
class WorkspaceShellPage extends StatelessWidget {
  final String workspaceId;
  final String workspaceName;

  const WorkspaceShellPage({
    super.key,
    required this.workspaceId,
    required this.workspaceName,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;

    return AutoTabsScaffold(
      routes: [
        DashboardRoute(workspaceId: workspaceId),
        InventoryRoute(workspaceId: workspaceId, workspaceName: workspaceName),
        MovementsRoute(workspaceId: workspaceId),
        MembersRoute(workspaceId: workspaceId),
        const ProfileRoute(),
      ],
      appBarBuilder: (context, tabsRouter) {
        if (tabsRouter.activeIndex == 1) {
          return null;
        }

        return ZentoryHeader(
          title: tabsRouter.current.title(context),
          actions: tabsRouter.current.name == MovementsRoute.name
              ? [
                  IconButton(
                    icon: const Icon(LucideIcons.slidersHorizontal),
                    onPressed: () {
                      HapticFeedback.lightImpact();
                    },
                  ),
                ]
              : null,
        );
      },
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            HapticFeedback.lightImpact();
            tabsRouter.setActiveIndex(index);
          },
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).cardColor,
          elevation: 0,
          selectedLabelStyle: TextStyle(
            fontSize: AppDesign.fontXS,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(fontSize: AppDesign.fontXS),
          iconSize: AppDesign.fontL,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(LucideIcons.layoutDashboard),
              label: l10n.dashboard,
            ),
            BottomNavigationBarItem(
              icon: const Icon(LucideIcons.package),
              label: l10n.inventory,
            ),
            BottomNavigationBarItem(
              icon: const Icon(LucideIcons.history),
              label: l10n.history,
            ),
            BottomNavigationBarItem(
              icon: const Icon(LucideIcons.users),
              label: l10n.team,
            ),
            BottomNavigationBarItem(
              icon: const Icon(LucideIcons.user),
              label: l10n.profile,
            ),
          ],
        );
      },
    );
  }
}
