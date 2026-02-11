import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:zentory_app/core/widgets/zentory_ui_components.dart';
import 'package:zentory_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:zentory_app/features/auth/presentation/widgets/desktop_layout.dart';
import 'package:zentory_app/features/auth/presentation/widgets/mobile_layout.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FormGroup _form;
  bool _isLogin = true;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _form = FormGroup({
      'email': FormControl<String>(validators: [
        Validators.required,
        Validators.email,
      ]),
      'password': FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(8),
      ]),
      'name': FormControl<String>(),
    });
    _updateFormValidators();
  }

  void _updateFormValidators() {
    if (_isLogin) {
      _form.control('name').clearValidators();
      _form.control('name').updateValueAndValidity();
    } else {
      _form.control('name').setValidators([
        Validators.required,
        Validators.minLength(3),
      ]);
      _form.control('name').updateValueAndValidity();
    }
  }

  void _submit(BuildContext context) {
    if (_form.valid) {
      final email = _form.control('email').value as String;
      final password = _form.control('password').value as String;

      if (_isLogin) {
        context.read<AuthBloc>().add(
              AuthEvent.loginRequested(
                email: email,
                password: password,
              ),
            );
      } else {
        final name = _form.control('name').value as String;
        context.read<AuthBloc>().add(
              AuthEvent.registerRequested(
                name: name,
                email: email,
                password: password,
              ),
            );
      }
    } else {
      _form.markAllAsTouched();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
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
                    form: _form,
                    isLogin: _isLogin,
                    obscurePassword: _obscurePassword,
                    onToggleMode: _toggleMode,
                    onToggleVisibility: _toggleVisibility,
                    onSubmit: () => _submit(context),
                    isLoading: isLoading,
                  )
                : MobileLayout(
                    form: _form,
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
    _form.dispose();
    super.dispose();
  }
}
