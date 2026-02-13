import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/router/router.gr.dart';
import 'package:zentory_app/common/widgets/zentory_ui_components.dart';
import 'package:zentory_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:zentory_app/l10n/app_localizations.dart';
import 'package:zentory_app/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:zentory_app/features/auth/presentation/widgets/profile_option.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
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
              orElse: () => Center(child: Text(l10n.loadingProfile)),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileBody(BuildContext context, dynamic user) {
    return Column(
      children: [
        ZentoryHeader(
          title: context.router.current.title(context),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppDesign.paddingL),
            child: Column(
              children: [
                ZentoryIconContainer(
                  icon: LucideIcons.user,
                  size: AppDesign.fontDisplay,
                  padding: AppDesign.paddingXL,
                ),
                SizedBox(height: AppDesign.spaceM),
                Text(
                  user.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  user.email,
                  style: Theme.of(context).textTheme.bodyMedium,
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
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showEditNameDialog(BuildContext context, String currentName) {
    final l10n = L10n.of(context)!;
    final controller = TextEditingController(text: currentName);
    ZentoryDialogs.showCustomDialog(
      context: context,
      title: l10n.editName,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: l10n.fullName),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
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
          child: Text(l10n.save),
        ),
      ],
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    final l10n = L10n.of(context)!;
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    ZentoryDialogs.showCustomDialog(
      context: context,
      title: l10n.changePassword,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: oldPasswordController,
              decoration: InputDecoration(
                labelText: l10n.currentPassword,
              ),
              obscureText: true,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Campo requerido' : null,
            ),
            TextFormField(
              controller: newPasswordController,
              decoration: InputDecoration(
                labelText: l10n.newPassword,
              ),
              obscureText: true,
              validator: (value) =>
                  (value?.length ?? 0) < 8 ? 'Mínimo 8 caracteres' : null,
            ),
            TextFormField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: l10n.confirmPassword,
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
          child: Text(l10n.cancel),
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
          child: Text(l10n.update),
        ),
      ],
    );
  }

  void _showThemeSelectionDialog(BuildContext context) {
    final l10n = L10n.of(context)!;
    ZentoryDialogs.showCustomDialog(
      context: context,
      title: l10n.themeAndAppearance,
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
                title: Text(l10n.automaticSystem),
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
                title: Text(l10n.lightMode),
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
                title: Text(l10n.darkMode),
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
          child: Text(l10n.close),
        ),
      ],
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    final l10n = L10n.of(context)!;
    ZentoryDialogs.showActionDialog(
      context: context,
      title: l10n.logout,
      description: l10n.logoutDescAlt,
      confirmLabel: l10n.logout,
      confirmColor: Theme.of(context).colorScheme.error,
      icon: LucideIcons.logOut,
      onConfirm: () {
        context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
      },
    );
  }
}
