import 'package:auto_route/auto_route.dart';
import 'package:zentory_app/core/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: WorkspacesRoute.page),
        AutoRoute(
          page: WorkspaceShellRoute.page,
          children: [
            AutoRoute(page: DashboardRoute.page),
            AutoRoute(page: InventoryRoute.page),
            AutoRoute(page: MovementsRoute.page),
            AutoRoute(page: MembersRoute.page),
            AutoRoute(page: ProfileRoute.page),
            AutoRoute(page: NotificationsRoute.page),
          ],
        ),
      ];
}
