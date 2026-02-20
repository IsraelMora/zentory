import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/i_auth_repository.dart';
import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const AuthState.initial());

  Future<void> checkAuthStatus() async {
    emit(const AuthState.loading());
    try {
      final user = await _authRepository.checkAuthStatus();
      if (user != null) {
        emit(AuthState.authenticated(user));
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> login(String email, String password) async {
    emit(const AuthState.loading());
    try {
      final user = await _authRepository.login(
        email: email,
        password: password,
      );
      emit(AuthState.authenticated(user));
    } catch (e) {
      // Al emitir un estado de error, se limpia poco después con un emit del estado previo
      // o se deja a criterio de la UI reaccionar a ".error()"
      emit(AuthState.error(e.toString().replaceAll('Exception: ', '')));
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> logout() async {
    emit(const AuthState.loading());
    try {
      await _authRepository.logout();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(AuthState.error(e.toString().replaceAll('Exception: ', '')));
    }
  }
}
