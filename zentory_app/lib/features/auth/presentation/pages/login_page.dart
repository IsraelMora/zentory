import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zentory_app/common/widgets/zentory_ui_components.dart';
import 'package:zentory_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:zentory_app/features/auth/presentation/widgets/desktop_layout.dart';
import 'package:zentory_app/features/auth/presentation/widgets/mobile_layout.dart';
import 'package:zentory_app/features/auth/presentation/models/auth_form_model.dart';
import 'package:zentory_app/core/router/router.gr.dart';

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

  void _submit(BuildContext context) {
    if (_formModel.form.valid) {
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
    }
  }

  @override
  Widget build(BuildContext context) {
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

            return kIsWeb || MediaQuery.of(context).size.width > 600
                ? DesktopLayout(
                    formModel: _formModel,
                    isLogin: _isLogin,
                    obscurePassword: _obscurePassword,
                    onToggleMode: _toggleMode,
                    onToggleVisibility: _toggleVisibility,
                    onSubmit: () => _submit(context),
                    isLoading: isLoading,
                  )
                : MobileLayout(
                    formModel: _formModel,
                    isLogin: _isLogin,
                    obscurePassword: _obscurePassword,
                    onToggleMode: _toggleMode,
                    onToggleVisibility: _toggleVisibility,
                    onSubmit: () => _submit(context),
                    isLoading: isLoading,
                  );
          },
        ),
      ),
    );
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
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }
}
