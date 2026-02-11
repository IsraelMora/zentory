import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auto_route/auto_route.dart';

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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder for Logo
            Container(
              width: AppDesign.spaceL * 4,
              height: AppDesign.spaceL * 4,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                LucideIcons.package,
                size: AppDesign.fontDisplay,
                color: Colors.white,
              ),
            ),
            SizedBox(height: AppDesign.spaceL),
            Text(
              'ZENTORY',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    letterSpacing: 4,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: AppDesign.fontXL * 1.5,
                  ),
            ),
            SizedBox(height: AppDesign.spaceXL * 2),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
