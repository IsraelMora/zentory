import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:injectable/injectable.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/i_auth_repository.dart';

@LazySingleton(as: IAuthRepository)
class AppwriteAuthRepository implements IAuthRepository {
  final Account _account;

  AppwriteAuthRepository(this._account);

  @override
  Future<User> login({required String email, required String password}) async {
    try {
      await _account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      final user = await _account.get();
      return _mapToUser(user);
    } on AppwriteException catch (e) {
      throw Exception(
        e.message ?? 'Error desconocido de Appwrite al iniciar sesión',
      );
    } catch (e) {
      throw Exception('Error interno al iniciar sesión: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _account.deleteSession(sessionId: 'current');
    } on AppwriteException catch (e) {
      throw Exception(e.message ?? 'Error al cerrar sesión');
    }
  }

  @override
  Future<User?> checkAuthStatus() async {
    try {
      final user = await _account.get();
      return _mapToUser(user);
    } on AppwriteException catch (e) {
      if (e.code == 401) {
        return null; // No hay sesión o está expirada
      }
      throw Exception(e.message ?? 'Error al verificar estado de sesión');
    } catch (e) {
      return null;
    }
  }

  User _mapToUser(models.User appwriteUser) {
    return User(
      id: appwriteUser.$id,
      email: appwriteUser.email,
      name: appwriteUser.name,
    );
  }
}
