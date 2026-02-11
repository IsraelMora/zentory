part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = _LoginRequested;

  const factory AuthEvent.registerRequested({
    required String email,
    required String password,
    required String name,
  }) = _RegisterRequested;

  const factory AuthEvent.logoutRequested() = _LogoutRequested;
  const factory AuthEvent.authCheckRequested() = _AuthCheckRequested;
  const factory AuthEvent.profileUpdated(String name) = _ProfileUpdated;
  const factory AuthEvent.passwordUpdateRequested({
    required String oldPassword,
    required String newPassword,
  }) = _PasswordUpdateRequested;
}
