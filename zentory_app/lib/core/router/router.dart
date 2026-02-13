import 'package:auto_route/auto_route.dart';
import 'package:zentory_app/core/router/router.gr.dart';
import 'package:zentory_app/core/router/auth_guard.dart';

import 'package:zentory_app/l10n/app_localizations.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard;

  AppRouter(this.authGuard);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(
          page: WorkspacesRoute.page,
          guards: [authGuard],
          title: (context, data) => L10n.of(context)!.yourWorkspaces,
        ),
        AutoRoute(
          page: WorkspaceShellRoute.page,
          guards: [authGuard],
          children: [
            AutoRoute(
              page: DashboardRoute.page,
              title: (context, data) => L10n.of(context)!.dashboard,
            ),
            AutoRoute(
              page: InventoryRoute.page,
              title: (context, data) => L10n.of(context)!.products,
            ),
            AutoRoute(
              page: MovementsRoute.page,
              title: (context, data) => L10n.of(context)!.history,
            ),
            AutoRoute(
              page: MembersRoute.page,
              title: (context, data) => L10n.of(context)!.team,
            ),
            AutoRoute(
              page: ProfileRoute.page,
              title: (context, data) => L10n.of(context)!.profile,
            ),
            AutoRoute(
              page: NotificationsRoute.page,
              title: (context, data) => L10n.of(context)!.notifications,
            ),
          ],
        ),
      ];
}
