import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/injection.dart';
import '../blocs/auth/auth_cubit.dart';
import '../blocs/auth/auth_state.dart';
import '../../common/widgets/zentory_button.dart';
import '../../common/widgets/zentory_text_field.dart';
import '../../core/theme/app_ui_constants.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Inicialización del FormGroup con validadores
  final FormGroup form = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    'password': FormControl<String>(
      validators: [Validators.required, Validators.minLength(6)],
    ),
  });

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _obscurePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Padding general calculado por sizer
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  state.maybeWhen(
                    error: (message) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                          backgroundColor: theme.colorScheme.error,
                        ),
                      );
                    },
                    authenticated: (user) {
                      // Se dejará la redirección explícita para el router después
                      // contexto.router.replace(const DashboardRoute());
                    },
                    orElse: () {},
                  );
                },
                builder: (context, state) {
                  final isLoading = state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  );

                  return ReactiveForm(
                    formGroup: form,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Logo o Icono de cabecera
                        Icon(
                          LucideIcons.boxes,
                          size: AppSpacing.xxl * 2,
                          color: theme.colorScheme.primary,
                        ),
                        SizedBox(height: AppSpacing.md),
                        // Título principal
                        Text(
                          'Bienvenido a Zentory',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: AppSpacing.xs),
                        // Subtítulo
                        Text(
                          'Inicia sesión para gestionar tu inventario',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.7,
                            ),
                          ),
                        ),
                        SizedBox(height: AppSpacing.xl),

                        // Campos del Formulario (Componentes Genéricos)
                        ZentoryTextField(
                          formControlName: 'email',
                          labelText: 'Correo Electrónico',
                          hintText: 'admin@zentory.com',
                          prefixIcon: LucideIcons.mail,
                          keyboardType: TextInputType.emailAddress,
                          validationMessages: {
                            ValidationMessage.required: (error) =>
                                'El correo es obligatorio',
                            ValidationMessage.email: (error) =>
                                'Ingresa un correo válido',
                          },
                        ),
                        SizedBox(height: AppSpacing.md),
                        ValueListenableBuilder<bool>(
                          valueListenable: _obscurePassword,
                          builder: (context, isObscure, child) {
                            return ZentoryTextField(
                              formControlName: 'password',
                              labelText: 'Contraseña',
                              hintText: '******',
                              prefixIcon: LucideIcons.lock,
                              obscureText: isObscure,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isObscure
                                      ? LucideIcons.eye
                                      : LucideIcons.eyeOff,
                                  color: theme.colorScheme.onSurface.withValues(
                                    alpha: 0.6,
                                  ),
                                ),
                                onPressed: () {
                                  _obscurePassword.value = !isObscure;
                                },
                              ),
                              textInputAction: TextInputAction.done,
                              validationMessages: {
                                ValidationMessage.required: (error) =>
                                    'La contraseña es obligatoria',
                                ValidationMessage.minLength: (error) =>
                                    'Mínimo 6 caracteres',
                              },
                            );
                          },
                        ),
                        SizedBox(height: AppSpacing.xl),

                        // Botón de Autenticación
                        ReactiveFormConsumer(
                          builder: (context, form, child) {
                            return ZentoryButton(
                              text: 'Ingresar',
                              icon: LucideIcons.logIn,
                              isLoading: isLoading,
                              // El botón queda inactivo si el formulario es inválido o carga
                              onPressed: form.valid && !isLoading
                                  ? () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      context.read<AuthCubit>().login(
                                        form.control('email').value as String,
                                        form.control('password').value
                                            as String,
                                      );
                                    }
                                  : null,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
