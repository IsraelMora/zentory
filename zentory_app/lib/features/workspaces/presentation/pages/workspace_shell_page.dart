import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/router/router.gr.dart';

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
    return AutoTabsScaffold(
      routes: [
        DashboardRoute(workspaceId: workspaceId),
        InventoryRoute(workspaceId: workspaceId, workspaceName: workspaceName),
        MovementsRoute(workspaceId: workspaceId),
        MembersRoute(workspaceId: workspaceId),
        const ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.layoutDashboard),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.package),
              label: 'Inventario',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.history),
              label: 'Historial',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.users),
              label: 'Equipo',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.user),
              label: 'Perfil',
            ),
          ],
        );
      },
    );
  }
}
