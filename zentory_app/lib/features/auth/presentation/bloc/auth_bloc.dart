import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zentory_app/features/auth/domain/entities/user.dart';
import 'package:zentory_app/core/usecases/usecase.dart';
import 'package:zentory_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:zentory_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:zentory_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:zentory_app/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:zentory_app/features/auth/domain/usecases/update_profile_usecase.dart';
import 'package:zentory_app/features/auth/domain/usecases/update_password_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final RegisterUseCase _registerUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final UpdatePasswordUseCase _updatePasswordUseCase;

  AuthBloc(
    this._loginUseCase,
    this._logoutUseCase,
    this._registerUseCase,
    this._getCurrentUserUseCase,
    this._updateProfileUseCase,
    this._updatePasswordUseCase,
  ) : super(const AuthState.initial()) {
    on<_LoginRequested>((event, emit) async {
      emit(const AuthState.loading());
      final result = await _loginUseCase(
        LoginParams(email: event.email, password: event.password),
      );
      result.fold(
        (failure) => emit(AuthState.error(failure.toString())),
        (user) => emit(AuthState.authenticated(user)),
      );
    });

    on<_RegisterRequested>((event, emit) async {
      emit(const AuthState.loading());
      final result = await _registerUseCase(
        RegisterParams(
          email: event.email,
          password: event.password,
          name: event.name,
        ),
      );
      result.fold(
        (failure) => emit(AuthState.error(failure.toString())),
        (user) => emit(AuthState.authenticated(user)),
      );
    });

    on<_LogoutRequested>((event, emit) async {
      emit(const AuthState.loading());
      await _logoutUseCase(NoParams());
      emit(const AuthState.unauthenticated());
    });

    on<_AuthCheckRequested>((event, emit) async {
      emit(const AuthState.loading());
      final result = await _getCurrentUserUseCase(NoParams());
      result.fold(
        (failure) => emit(const AuthState.unauthenticated()),
        (user) => emit(AuthState.authenticated(user)),
      );
    });

    on<_ProfileUpdated>((event, emit) async {
      final result = await _updateProfileUseCase(event.name);
      result.fold(
        (failure) => null, // Maybe emit error state?
        (user) => emit(AuthState.authenticated(user)),
      );
    });

    on<_PasswordUpdateRequested>((event, emit) async {
      final result = await _updatePasswordUseCase(
        UpdatePasswordParams(
          oldPassword: event.oldPassword,
          newPassword: event.newPassword,
        ),
      );
      result.fold(
        (failure) => null, // Maybe emit error state or show snackbar in UI
        (_) => null,
      );
    });
  }
}
