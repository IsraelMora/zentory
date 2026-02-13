import 'package:auto_route/auto_route.dart';
import 'package:zentory_app/core/router/router.gr.dart';
import 'package:zentory_app/features/auth/presentation/bloc/auth_bloc.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthBloc authBloc;

  AuthGuard(this.authBloc);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    authBloc.state.maybeMap(
      authenticated: (_) {
        resolver.next(true);
      },
      unauthenticated: (_) {
        router.push(const LoginRoute());
        resolver.next(false);
      },
      initial: (_) {
        resolver.next(true);
      },
      loading: (_) {
        resolver.next(true);
      },
      error: (_) {
        router.push(const LoginRoute());
        resolver.next(false);
      },
      orElse: () {
        resolver.next(true);
      },
    );
  }
}
