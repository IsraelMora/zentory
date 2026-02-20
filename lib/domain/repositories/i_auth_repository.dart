import '../entities/user.dart';

abstract class IAuthRepository {
  /// Inicia sesión con correo y contraseña. Retorna el usuario autenticado.
  Future<User> login({required String email, required String password});

  /// Cierra la sesión activa actual.
  Future<void> logout();

  /// Verifica si existe una sesión activa y retorna el usuario. Si no hay, retorna null.
  Future<User?> checkAuthStatus();
}
