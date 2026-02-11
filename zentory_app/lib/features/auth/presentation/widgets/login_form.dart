import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class LoginForm extends StatelessWidget {
  final FormGroup form;
  final bool isLogin;
  final bool obscurePassword;
  final VoidCallback onToggleVisibility;
  final VoidCallback onSubmit;
  final bool isLoading;

  const LoginForm({
    super.key,
    required this.form,
    required this.isLogin,
    required this.obscurePassword,
    required this.onToggleVisibility,
    required this.onSubmit,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!isLogin) ...[
            ReactiveTextField<String>(
              formControlName: 'name',
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: 'Nombre completo',
                hintText: 'Ej. Juan Pérez',
                prefixIcon: Icon(LucideIcons.user, size: AppDesign.fontL),
              ),
              validationMessages: {
                ValidationMessage.required: (error) =>
                    'El nombre es obligatorio',
                ValidationMessage.minLength: (error) => 'Mínimo 3 caracteres',
              },
            ).animate().fade().slideX(begin: -0.1, end: 0),
            SizedBox(height: AppDesign.spaceM),
          ],
          ReactiveTextField<String>(
            formControlName: 'email',
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Correo electrónico',
              hintText: 'nombre@ejemplo.com',
              prefixIcon: Icon(LucideIcons.mail, size: AppDesign.fontL),
            ),
            validationMessages: {
              ValidationMessage.required: (error) => 'El correo es obligatorio',
              ValidationMessage.email: (error) => 'Formato de correo inválido',
            },
          ),
          SizedBox(height: AppDesign.spaceM),
          ReactiveTextField<String>(
            formControlName: 'password',
            obscureText: obscurePassword,
            onSubmitted: (_) => onSubmit(),
            decoration: InputDecoration(
              labelText: 'Contraseña',
              hintText: '••••••••',
              prefixIcon: Icon(LucideIcons.lock, size: AppDesign.fontL),
              suffixIcon: IconButton(
                icon: Icon(
                  obscurePassword ? LucideIcons.eye : LucideIcons.eyeOff,
                  size: AppDesign.fontL,
                ),
                onPressed: onToggleVisibility,
              ),
            ),
            validationMessages: {
              ValidationMessage.required: (error) =>
                  'La contraseña es obligatoria',
              ValidationMessage.minLength: (error) => 'Mínimo 8 caracteres',
            },
          ),
          SizedBox(height: AppDesign.spaceL),
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else
            ElevatedButton(
              onPressed: onSubmit,
              child: Text(
                isLogin ? 'Iniciar Sesión' : 'Crear Cuenta',
              ),
            )
                .animate(onPlay: (c) => c.repeat())
                .shimmer(delay: 2000.ms, duration: 1000.ms),
        ],
      ),
    );
  }
}
