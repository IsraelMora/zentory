import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zentory_app/core/theme/app_design.dart';

import 'login_form.dart';
import 'toggle_mode_button.dart';

class MobileLayout extends StatelessWidget {
  final FormGroup form;
  final bool isLogin;
  final bool obscurePassword;
  final VoidCallback onToggleMode;
  final VoidCallback onToggleVisibility;
  final VoidCallback onSubmit;
  final bool isLoading;

  const MobileLayout({
    super.key,
    required this.form,
    required this.isLogin,
    required this.obscurePassword,
    required this.onToggleMode,
    required this.onToggleVisibility,
    required this.onSubmit,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(AppDesign.paddingXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(AppDesign.paddingL),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  LucideIcons.package,
                  size: AppDesign.fontDisplay,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ).animate().scale(curve: Curves.easeOutBack, duration: 500.ms),
            SizedBox(height: AppDesign.spaceL),
            Text(
              isLogin ? 'Bienvenido' : 'Únete a Zentory',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: AppDesign.fontXL,
                  ),
            ).animate().fade().slideY(begin: 0.2, end: 0),
            SizedBox(height: AppDesign.spaceS),
            Text(
              isLogin
                  ? 'Gestiona todo desde un solo lugar.'
                  : 'Crea tu cuenta en segundos.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: AppDesign.fontM,
                  ),
            ),
            SizedBox(height: AppDesign.spaceXL),
            LoginForm(
              form: form,
              isLogin: isLogin,
              obscurePassword: obscurePassword,
              onToggleVisibility: onToggleVisibility,
              onSubmit: onSubmit,
              isLoading: isLoading,
            ).animate().fade(delay: 200.ms).slideY(begin: 0.1, end: 0),
            SizedBox(height: AppDesign.spaceL),
            ToggleModeButton(
              isLogin: isLogin,
              onToggle: onToggleMode,
            ).animate().fade(delay: 300.ms),
          ],
        ),
      ),
    );
  }
}
