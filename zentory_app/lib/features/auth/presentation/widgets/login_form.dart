import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/features/auth/presentation/models/auth_form_model.dart';
import 'package:zentory_app/l10n/app_localizations.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
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
    final l10n = L10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!isLogin) ...[
          ReactiveTextField<String>(
            formControl: formModel.nameControl,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              labelText: l10n.fullName,
              hintText: l10n.fullNameHint,
              prefixIcon: Icon(LucideIcons.user, size: AppDesign.fontL),
            ),
          ).animate().fade().slideX(begin: -0.1, end: 0),
          SizedBox(height: AppDesign.spaceM),
        ],
        ReactiveTextField<String>(
          formControl: formModel.emailControl,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: l10n.email,
            hintText: l10n.emailPlaceholder,
            prefixIcon: Icon(LucideIcons.mail, size: AppDesign.fontL),
          ),
        ),
        SizedBox(height: AppDesign.spaceM),
        ReactiveTextField<String>(
          formControl: formModel.passwordControl,
          obscureText: obscurePassword,
          onSubmitted: (_) => onSubmit(),
          decoration: InputDecoration(
            labelText: l10n.password,
            hintText: l10n.passwordPlaceholder,
            prefixIcon: Icon(LucideIcons.lock, size: AppDesign.fontL),
            suffixIcon: IconButton(
              icon: Icon(
                obscurePassword ? LucideIcons.eye : LucideIcons.eyeOff,
                size: AppDesign.fontL,
              ),
              onPressed: onToggleVisibility,
            ),
          ),
        ),
        SizedBox(height: AppDesign.spaceL),
        if (isLoading)
          const Center(child: CircularProgressIndicator())
        else
          ElevatedButton(
            onPressed: onSubmit,
            child: Text(
              isLogin ? l10n.login : l10n.createAccount,
            ),
          )
              .animate(onPlay: (c) => c.repeat())
              .shimmer(delay: 2000.ms, duration: 1000.ms),
      ],
    );
  }
}
