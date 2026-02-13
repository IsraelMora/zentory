import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/core/router/router.gr.dart';
import 'package:zentory_app/presentation/widgets/zentory_header.dart';
import 'package:zentory_app/presentation/widgets/zentory_icon_container.dart';
import 'package:zentory_app/presentation/widgets/zentory_dialogs.dart';
import 'package:zentory_app/presentation/widgets/zentory_feedback.dart';
import 'package:zentory_app/presentation/widgets/zentory_card.dart';
import 'package:zentory_app/presentation/blocs/auth_bloc.dart';
import 'package:zentory_app/l10n/app_localizations.dart';
import 'package:zentory_app/presentation/blocs/settings_bloc.dart';

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
    final l10n = L10n.of(context)!;
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
                _buildActionTile(
                  context,
                  icon: LucideIcons.user,
                  label: l10n.editName,
                  onTap: () {
                    _showEditNameDialog(context, user.name);
                  },
                ),
                _buildActionTile(
                  context,
                  icon: LucideIcons.lock,
                  label: l10n.changePassword,
                  onTap: () {
                    _showChangePasswordDialog(context);
                  },
                ),
                _buildActionTile(
                  context,
                  icon: LucideIcons.bell,
                  label: l10n.notifications,
                  onTap: () {
                    context.router.push(const NotificationsRoute());
                  },
                ),
                _buildActionTile(
                  context,
                  icon: LucideIcons.palette,
                  label: l10n.themeAndAppearance,
                  onTap: () => _showThemeSelectionDialog(context),
                ),
                SizedBox(height: AppDesign.spaceL),
                _buildActionTile(
                  context,
                  icon: LucideIcons.logOut,
                  label: l10n.logout,
                  textColor: Theme.of(context).colorScheme.error,
                  onTap: () => _showLogoutConfirmation(context),
                ),
                SizedBox(height: AppDesign.spaceXL),
                Text(
                  l10n.appVersion,
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
    final form = FormGroup({
      'name': FormControl<String>(
        value: currentName,
        validators: [Validators.required],
      ),
    });

    ZentoryDialogs.showCustomDialog(
      context: context,
      title: l10n.editName,
      child: ReactiveForm(
        formGroup: form,
        child: ReactiveTextField<String>(
          formControlName: 'name',
          decoration: InputDecoration(labelText: l10n.fullName),
          textCapitalization: TextCapitalization.words,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
        SizedBox(width: AppDesign.spaceS),
        ReactiveFormConsumer(
          builder: (context, form, child) {
            return ElevatedButton(
              onPressed: form.valid
                  ? () {
                      final name = form.control('name').value as String;
                      context.read<AuthBloc>().add(
                            AuthEvent.profileUpdated(name.trim()),
                          );
                      Navigator.pop(context);
                    }
                  : null,
              child: Text(l10n.save),
            );
          },
        ),
      ],
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    final l10n = L10n.of(context)!;
    final form = FormGroup({
      'oldPassword': FormControl<String>(validators: [Validators.required]),
      'newPassword': FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(8),
      ]),
      'confirmPassword': FormControl<String>(validators: [Validators.required]),
    }, validators: [
      Validators.mustMatch('newPassword', 'confirmPassword'),
    ]);

    ZentoryDialogs.showCustomDialog(
      context: context,
      title: l10n.changePassword,
      child: ReactiveForm(
        formGroup: form,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ReactiveTextField<String>(
              formControlName: 'oldPassword',
              decoration: InputDecoration(
                labelText: l10n.currentPassword,
              ),
              obscureText: true,
            ),
            ReactiveTextField<String>(
              formControlName: 'newPassword',
              decoration: InputDecoration(
                labelText: l10n.newPassword,
              ),
              obscureText: true,
            ),
            ReactiveTextField<String>(
              formControlName: 'confirmPassword',
              decoration: InputDecoration(
                labelText: l10n.confirmPassword,
              ),
              obscureText: true,
              validationMessages: {
                ValidationMessage.mustMatch: (_) => l10n.doesNotMatch,
              },
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
        ReactiveFormConsumer(
          builder: (context, form, child) {
            return ElevatedButton(
              onPressed: form.valid
                  ? () {
                      final oldPassword =
                          form.control('oldPassword').value as String;
                      final newPassword =
                          form.control('newPassword').value as String;
                      context.read<AuthBloc>().add(
                            AuthEvent.passwordUpdateRequested(
                              oldPassword: oldPassword,
                              newPassword: newPassword,
                            ),
                          );
                      Navigator.pop(context);
                      ZentoryFeedback.showSuccess(
                          context, l10n.passwordUpdated);
                    }
                  : null,
              child: Text(l10n.update),
            );
          },
        ),
      ],
    );
  }

  void _showThemeSelectionDialog(BuildContext context) {
    final l10n = L10n.of(context)!;
    final settingsBloc = context.read<SettingsBloc>();
    final form = FormGroup({
      'theme': FormControl<ThemeMode>(
        value: settingsBloc.state.maybeWhen(
          loaded: (themeMode) => themeMode,
          orElse: () => ThemeMode.system,
        ),
      ),
    });

    // Listen to form changes and update theme
    form.control('theme').valueChanges.listen((value) {
      if (value is ThemeMode) {
        settingsBloc.add(SettingsEvent.themeChanged(value));
      }
    });

    ZentoryDialogs.showCustomDialog(
      context: context,
      title: l10n.themeAndAppearance,
      child: ReactiveForm(
        formGroup: form,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ReactiveRadioListTile<ThemeMode>(
              formControlName: 'theme',
              title: Text(l10n.automaticSystem),
              value: ThemeMode.system,
            ),
            ReactiveRadioListTile<ThemeMode>(
              formControlName: 'theme',
              title: Text(l10n.lightMode),
              value: ThemeMode.light,
            ),
            ReactiveRadioListTile<ThemeMode>(
              formControlName: 'theme',
              title: Text(l10n.darkMode),
              value: ThemeMode.dark,
            ),
          ],
        ),
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

  Widget _buildActionTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? textColor,
  }) {
    return ZentoryCard(
      margin: EdgeInsets.only(bottom: AppDesign.spaceS),
      padding: EdgeInsets.zero,
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.onSurface,
          size: AppDesign.fontL,
        ),
        title: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: textColor,
                fontWeight: FontWeight.normal,
                fontSize: AppDesign.fontM,
              ),
        ),
        trailing: Icon(
          LucideIcons.chevronRight,
          size: AppDesign.fontS,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
