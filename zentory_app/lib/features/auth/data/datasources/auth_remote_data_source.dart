import 'package:appwrite/appwrite.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/core/utils/logger.dart';
import 'package:zentory_app/features/auth/domain/entities/user.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> login({required String email, required String password});

  Future<UserEntity> register({
    required String email,
    required String password,
    required String name,
  });

  Future<void> logout();

  Future<UserEntity> getCurrentUser();
  Future<UserEntity> updateName(String name);
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  });
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Account _account;

  AuthRemoteDataSourceImpl(this._account);

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    try {
      ZentoryLogger.info('Intentando login para: $email');
      await _account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      ZentoryLogger.info('Login exitoso para: $email');
      return getCurrentUser();
    } catch (e, stackTrace) {
      ZentoryLogger.error('Error en login para $email', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<UserEntity> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      ZentoryLogger.info('Intentando registro para: $email');
      await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );
      ZentoryLogger.info('Registro exitoso para: $email, procediendo al login');
      return login(email: email, password: password);
    } catch (e, stackTrace) {
      ZentoryLogger.error('Error en registro para $email', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      ZentoryLogger.info('Cerrando sesión del usuario actual');
      await _account.deleteSession(sessionId: 'current');
      ZentoryLogger.info('Sesión cerrada correctamente');
    } catch (e, stackTrace) {
      ZentoryLogger.error('Error al cerrar sesión', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<UserEntity> getCurrentUser() async {
    try {
      final user = await _account.get();
      ZentoryLogger.debug('Usuario actual obtenido: ${user.email}');
      return UserEntity(
        id: user.$id,
        email: user.email,
        name: user.name,
        emailVerification: user.emailVerification,
      );
    } catch (e) {
      // No logueamos error aquí como crítico porque puede ser simplemente que no hay sesión
      ZentoryLogger.debug('No hay sesión de usuario activa: $e');
      rethrow;
    }
  }

  @override
  Future<UserEntity> updateName(String name) async {
    try {
      ZentoryLogger.info('Actualizando nombre de usuario a: $name');
      final user = await _account.updateName(name: name);
      return UserEntity(
        id: user.$id,
        email: user.email,
        name: user.name,
        emailVerification: user.emailVerification,
      );
    } catch (e) {
      ZentoryLogger.error('Error al actualizar nombre', e);
      rethrow;
    }
  }

  @override
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      ZentoryLogger.info('Actualizando contraseña de usuario');
      await _account.updatePassword(
        password: newPassword,
        oldPassword: oldPassword,
      );
      ZentoryLogger.info('Contraseña actualizada con éxito');
    } catch (e, stackTrace) {
      ZentoryLogger.error('Error al actualizar contraseña', e, stackTrace);
      rethrow;
    }
  }
}
