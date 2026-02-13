import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zentory_app/presentation/widgets/zentory_feedback.dart';
import 'package:zentory_app/core/theme/app_design.dart';
import 'package:zentory_app/data/models/auth_form_model.dart';
import 'package:zentory_app/presentation/blocs/auth_bloc.dart';
import 'package:zentory_app/core/router/router.gr.dart';
import 'package:zentory_app/l10n/app_localizations.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthFormModel _formModel;
  bool _isLogin = true;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _formModel = AuthFormModel();

    if (kDebugMode) {
      _formModel.emailControl.value = 'isramora3@gmail.com';
      _formModel.passwordControl.value = 'password123';
    }

    _updateFormValidators();
  }

  void _updateFormValidators() {
    if (_isLogin) {
      _formModel.nameControl.clearValidators();
      _formModel.nameControl.updateValueAndValidity();
    } else {
      _formModel.nameControl.setValidators([
        Validators.required,
        Validators.minLength(3),
      ]);
      _formModel.nameControl.updateValueAndValidity();
    }
  }

  void _submit() {
    if (_formModel.form.valid) {
      HapticFeedback.heavyImpact();
      final email = _formModel.emailControl.value!;
      final password = _formModel.passwordControl.value!;

      if (_isLogin) {
        context.read<AuthBloc>().add(
              AuthEvent.loginRequested(
                email: email,
                password: password,
              ),
            );
      } else {
        final name = _formModel.nameControl.value!;
        context.read<AuthBloc>().add(
              AuthEvent.registerRequested(
                name: name,
                email: email,
                password: password,
              ),
            );
      }
    } else {
      _formModel.form.markAllAsTouched();
      HapticFeedback.vibrate();
    }
  }

  void _toggleMode() {
    setState(() {
      _isLogin = !_isLogin;
      _updateFormValidators();
    });
  }

  void _toggleVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (_) {
            context.router.replaceAll([const WorkspacesRoute()]);
          },
          error: (message) {
            ZentoryFeedback.showError(context, message);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppDesign.paddingXL),
                child: ReactiveForm(
                  formGroup: _formModel.form,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildLogo(context),
                      SizedBox(height: AppDesign.spaceL),
                      _buildHeader(context, l10n),
                      SizedBox(height: AppDesign.spaceXL),
                      _buildFormFields(context, l10n),
                      SizedBox(height: AppDesign.spaceL),
                      _buildSubmitButton(context, l10n, isLoading),
                      SizedBox(height: AppDesign.spaceL),
                      _buildToggleMode(context, l10n),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(AppDesign.paddingL),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          LucideIcons.package,
          size: AppDesign.fontDisplay,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    ).animate().scale(curve: Curves.easeOutBack, duration: 500.ms);
  }

  Widget _buildHeader(BuildContext context, L10n l10n) {
    return Column(
      children: [
        Text(
          _isLogin ? l10n.welcomeBack : l10n.joinZentory,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: AppDesign.fontXL,
              ),
        ).animate().fade().slideY(begin: 0.2, end: 0),
        SizedBox(height: AppDesign.spaceS),
        Text(
          _isLogin ? l10n.manageEverything : l10n.createAccountInSeconds,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: AppDesign.fontM,
              ),
        ),
      ],
    );
  }

  Widget _buildFormFields(BuildContext context, L10n l10n) {
    return Column(
      children: [
        if (!_isLogin) ...[
          ReactiveTextField<String>(
            formControl: _formModel.nameControl,
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
          formControl: _formModel.emailControl,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: l10n.email,
            hintText: l10n.emailPlaceholder,
            prefixIcon: Icon(LucideIcons.mail, size: AppDesign.fontL),
          ),
        ),
        SizedBox(height: AppDesign.spaceM),
        ReactiveTextField<String>(
          formControl: _formModel.passwordControl,
          obscureText: _obscurePassword,
          onSubmitted: (_) => _submit(),
          decoration: InputDecoration(
            labelText: l10n.password,
            hintText: l10n.passwordPlaceholder,
            prefixIcon: Icon(LucideIcons.lock, size: AppDesign.fontL),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? LucideIcons.eye : LucideIcons.eyeOff,
                size: AppDesign.fontL,
              ),
              onPressed: _toggleVisibility,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context, L10n l10n, bool isLoading) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ElevatedButton(
      onPressed: _submit,
      child: Text(
        _isLogin ? l10n.login : l10n.createAccount,
      ),
    )
        .animate(onPlay: (c) => c.repeat())
        .shimmer(delay: 2000.ms, duration: 1000.ms);
  }

  Widget _buildToggleMode(BuildContext context, L10n l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _isLogin ? l10n.dontHaveAccount : l10n.alreadyHaveAccount,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: AppDesign.fontM,
              ),
        ),
        TextButton(
          onPressed: _toggleMode,
          child: Text(
            _isLogin ? l10n.signUp : l10n.logIn,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppDesign.fontM,
            ),
          ),
        ),
      ],
    ).animate().fade(delay: 300.ms);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }
}
