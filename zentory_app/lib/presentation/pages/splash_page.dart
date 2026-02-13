import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/presentation/blocs/auth_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:zentory_app/core/router/router.gr.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Dispatch auth check event
    context.read<AuthBloc>().add(const AuthEvent.authCheckRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (_) {
            context.router.replaceAll([const WorkspacesRoute()]);
          },
          unauthenticated: () {
            context.router.replaceAll([const LoginRoute()]);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: AppDesign.paddingXL,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      LucideIcons.package,
                      size: AppDesign.fontDisplay,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppDesign.spaceL),
              Text(
                'ZENTORY',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      letterSpacing: 4,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: AppDesign.fontXXL,
                    ),
              ),
              SizedBox(height: AppDesign.spaceXL),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
