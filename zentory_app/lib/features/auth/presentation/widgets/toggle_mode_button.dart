import 'package:flutter/material.dart';
import 'package:zentory_app/core/theme/app_design.dart';

class ToggleModeButton extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onToggle;

  const ToggleModeButton({
    super.key,
    required this.isLogin,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin ? '¿No tienes cuenta?' : '¿Ya tienes una cuenta?',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: AppDesign.fontM,
              ),
        ),
        TextButton(
          onPressed: onToggle,
          child: Text(
            isLogin ? 'Regístrate' : 'Inicia Sesión',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppDesign.fontM,
            ),
          ),
        ),
      ],
    );
  }
}
