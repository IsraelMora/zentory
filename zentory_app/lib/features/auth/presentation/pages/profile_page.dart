import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/router/router.gr.dart';
import 'package:zentory_app/core/widgets/zentory_ui_components.dart';
import 'package:zentory_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:zentory_app/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:zentory_app/features/auth/presentation/widgets/profile_option.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          unauthenticated: () => context.router.replace(const LoginRoute()),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.maybeWhen(
              authenticated: (user) => _buildProfileBody(context, user),
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => const Center(child: Text('Cargando perfil...')),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileBody(BuildContext context, dynamic user) {
    return Column(
      children: [
        const ZentoryHeader(
          title: 'Mi Perfil',
          subtitle: 'Configuración personal',
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppDesign.paddingL),
            child: Column(
              children: [
                ZentoryIconContainer(
                  icon: LucideIcons.user,
                  size: AppDesign.fontDisplay * 1.5,
                  padding: AppDesign.paddingXL,
                ),
                SizedBox(height: AppDesign.spaceM),
                Text(
                  user.name,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: AppDesign.fontXL,
                      ),
                ),
                Text(
                  user.email,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: AppDesign.fontM,
                      ),
                ),
                SizedBox(height: AppDesign.spaceXL),
                ProfileOption(
                  icon: LucideIcons.user,
                  label: 'Editar Nombre',
                  onTap: () {
                    _showEditNameDialog(context, user.name);
                  },
                ),
                ProfileOption(
                  icon: LucideIcons.lock,
                  label: 'Cambiar Contraseña',
                  onTap: () {
                    _showChangePasswordDialog(context);
                  },
                ),
                ProfileOption(
                  icon: LucideIcons.bell,
                  label: 'Notificaciones',
                  onTap: () {
                    context.router.push(const NotificationsRoute());
                  },
                ),
                ProfileOption(
                  icon: LucideIcons.palette,
                  label: 'Tema y Apariencia',
                  onTap: () => _showThemeSelectionDialog(context),
                ),
                SizedBox(height: AppDesign.spaceL),
                ProfileOption(
                  icon: LucideIcons.logOut,
                  label: 'Cerrar Sesión',
                  color: Theme.of(context).colorScheme.error,
                  onTap: () => _showLogoutConfirmation(context),
                ),
                SizedBox(height: AppDesign.spaceXL),
                Text(
                  'Zentory v1.0.0',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: AppDesign.fontXS,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showEditNameDialog(BuildContext context, String currentName) {
    final controller = TextEditingController(text: currentName);
    ZentoryDialogs.showCustomDialog(
      context: context,
      title: 'Editar Nombre',
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(labelText: 'Nombre Completo'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        SizedBox(width: AppDesign.spaceS),
        ElevatedButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              context.read<AuthBloc>().add(
                    AuthEvent.profileUpdated(controller.text.trim()),
                  );
              Navigator.pop(context);
            }
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    ZentoryDialogs.showCustomDialog(
      context: context,
      title: 'Cambiar Contraseña',
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: oldPasswordController,
              decoration: const InputDecoration(
                labelText: 'Contraseña Actual',
              ),
              obscureText: true,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Campo requerido' : null,
            ),
            TextFormField(
              controller: newPasswordController,
              decoration: const InputDecoration(
                labelText: 'Nueva Contraseña',
              ),
              obscureText: true,
              validator: (value) =>
                  (value?.length ?? 0) < 8 ? 'Mínimo 8 caracteres' : null,
            ),
            TextFormField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirmar Contraseña',
              ),
              obscureText: true,
              validator: (value) =>
                  value != newPasswordController.text ? 'No coincide' : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        SizedBox(width: AppDesign.spaceS),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              context.read<AuthBloc>().add(
                    AuthEvent.passwordUpdateRequested(
                      oldPassword: oldPasswordController.text,
                      newPassword: newPasswordController.text,
                    ),
                  );
              Navigator.pop(context);
              ZentoryFeedback.showSuccess(context, 'Contraseña actualizada');
            }
          },
          child: const Text('Actualizar'),
        ),
      ],
    );
  }

  void _showThemeSelectionDialog(BuildContext context) {
    ZentoryDialogs.showCustomDialog(
      context: context,
      title: 'Tema y Apariencia',
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          final currentTheme = state.maybeWhen(
            loaded: (themeMode) => themeMode,
            orElse: () => ThemeMode.system,
          );

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<ThemeMode>(
                title: const Text('Automático (Sistema)'),
                value: ThemeMode.system,
                groupValue: currentTheme,
                onChanged: (value) {
                  if (value != null) {
                    context
                        .read<SettingsBloc>()
                        .add(SettingsEvent.themeChanged(value));
                  }
                },
              ),
              RadioListTile<ThemeMode>(
                title: const Text('Modo Claro'),
                value: ThemeMode.light,
                groupValue: currentTheme,
                onChanged: (value) {
                  if (value != null) {
                    context
                        .read<SettingsBloc>()
                        .add(SettingsEvent.themeChanged(value));
                  }
                },
              ),
              RadioListTile<ThemeMode>(
                title: const Text('Modo Oscuro'),
                value: ThemeMode.dark,
                groupValue: currentTheme,
                onChanged: (value) {
                  if (value != null) {
                    context
                        .read<SettingsBloc>()
                        .add(SettingsEvent.themeChanged(value));
                  }
                },
              ),
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cerrar'),
        ),
      ],
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    ZentoryDialogs.showActionDialog(
      context: context,
      title: 'Cerrar Sesión',
      description: '¿Estás seguro de que quieres salir?',
      confirmLabel: 'Salir',
      confirmColor: Theme.of(context).colorScheme.error,
      icon: LucideIcons.logOut,
      onConfirm: () {
        context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
      },
    );
  }
}
