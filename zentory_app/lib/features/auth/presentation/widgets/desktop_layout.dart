import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/features/auth/presentation/widgets/login_form.dart';
import 'package:zentory_app/features/auth/presentation/models/auth_form_model.dart';

import 'toggle_mode_button.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({
    super.key,
    required this.formModel,
    required this.isLogin,
    required this.obscurePassword,
    required this.onToggleMode,
    required this.onToggleVisibility,
    required this.onSubmit,
    required this.isLoading,
  });

  final AuthFormModel formModel;
  final bool isLogin;
  final bool obscurePassword;
  final VoidCallback onToggleMode;
  final VoidCallback onToggleVisibility;
  final VoidCallback onSubmit;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left Side - Branding / Art
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primaryContainer,
                ],
              ),
            ),
            child: Stack(
              children: [
                // Decorative elements
                Positioned(
                  top: -100,
                  right: -100,
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.05),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: -50,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.05),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LucideIcons.package,
                        size: AppDesign.fontDisplay,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )
                          .animate()
                          .fade()
                          .scale(duration: 600.ms, curve: Curves.easeOutBack),
                      SizedBox(height: AppDesign.spaceL),
                      Text(
                        'Zentory',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: AppDesign.fontDisplay,
                            ),
                      )
                          .animate()
                          .fade(delay: 200.ms)
                          .slideY(begin: 0.2, end: 0, curve: Curves.easeOut),
                      SizedBox(height: AppDesign.spaceM),
                      Text(
                        'Gestión inteligente de inventarios\npara negocios modernos.',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary
                                      .withValues(alpha: 0.9),
                                  height: 1.5,
                                ),
                      ).animate().fade(delay: 400.ms),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Right Side - Login Form
        Expanded(
          flex: 4,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppDesign.paddingXL),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      isLogin ? 'Bienvenido de nuevo' : 'Crear cuenta',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: AppDesign.fontXXL,
                              ),
                    ).animate().fade().slideX(begin: 0.1, end: 0),
                    SizedBox(height: AppDesign.spaceXS),
                    Text(
                      isLogin
                          ? 'Ingresa tus credenciales para acceder.'
                          : 'Regístrate para comenzar a gestionar tu inventario.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: AppDesign.fontM,
                          ),
                    ).animate().fade(delay: 100.ms),
                    SizedBox(height: AppDesign.spaceXL),
                    LoginForm(
                      formModel: formModel,
                      isLogin: isLogin,
                      obscurePassword: obscurePassword,
                      onToggleMode: onToggleMode,
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
            ),
          ),
        ),
      ],
    );
  }
}
