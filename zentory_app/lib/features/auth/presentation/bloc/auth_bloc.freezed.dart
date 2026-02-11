// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent()';
  }
}

/// @nodoc
class $AuthEventCopyWith<$Res> {
  $AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}

/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginRequested value)? loginRequested,
    TResult Function(_RegisterRequested value)? registerRequested,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_AuthCheckRequested value)? authCheckRequested,
    TResult Function(_ProfileUpdated value)? profileUpdated,
    TResult Function(_PasswordUpdateRequested value)? passwordUpdateRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginRequested() when loginRequested != null:
        return loginRequested(_that);
      case _RegisterRequested() when registerRequested != null:
        return registerRequested(_that);
      case _LogoutRequested() when logoutRequested != null:
        return logoutRequested(_that);
      case _AuthCheckRequested() when authCheckRequested != null:
        return authCheckRequested(_that);
      case _ProfileUpdated() when profileUpdated != null:
        return profileUpdated(_that);
      case _PasswordUpdateRequested() when passwordUpdateRequested != null:
        return passwordUpdateRequested(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginRequested value) loginRequested,
    required TResult Function(_RegisterRequested value) registerRequested,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_AuthCheckRequested value) authCheckRequested,
    required TResult Function(_ProfileUpdated value) profileUpdated,
    required TResult Function(_PasswordUpdateRequested value)
        passwordUpdateRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _LoginRequested():
        return loginRequested(_that);
      case _RegisterRequested():
        return registerRequested(_that);
      case _LogoutRequested():
        return logoutRequested(_that);
      case _AuthCheckRequested():
        return authCheckRequested(_that);
      case _ProfileUpdated():
        return profileUpdated(_that);
      case _PasswordUpdateRequested():
        return passwordUpdateRequested(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoginRequested value)? loginRequested,
    TResult? Function(_RegisterRequested value)? registerRequested,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_AuthCheckRequested value)? authCheckRequested,
    TResult? Function(_ProfileUpdated value)? profileUpdated,
    TResult? Function(_PasswordUpdateRequested value)? passwordUpdateRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _LoginRequested() when loginRequested != null:
        return loginRequested(_that);
      case _RegisterRequested() when registerRequested != null:
        return registerRequested(_that);
      case _LogoutRequested() when logoutRequested != null:
        return logoutRequested(_that);
      case _AuthCheckRequested() when authCheckRequested != null:
        return authCheckRequested(_that);
      case _ProfileUpdated() when profileUpdated != null:
        return profileUpdated(_that);
      case _PasswordUpdateRequested() when passwordUpdateRequested != null:
        return passwordUpdateRequested(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? loginRequested,
    TResult Function(String email, String password, String name)?
        registerRequested,
    TResult Function()? logoutRequested,
    TResult Function()? authCheckRequested,
    TResult Function(String name)? profileUpdated,
    TResult Function(String oldPassword, String newPassword)?
        passwordUpdateRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginRequested() when loginRequested != null:
        return loginRequested(_that.email, _that.password);
      case _RegisterRequested() when registerRequested != null:
        return registerRequested(_that.email, _that.password, _that.name);
      case _LogoutRequested() when logoutRequested != null:
        return logoutRequested();
      case _AuthCheckRequested() when authCheckRequested != null:
        return authCheckRequested();
      case _ProfileUpdated() when profileUpdated != null:
        return profileUpdated(_that.name);
      case _PasswordUpdateRequested() when passwordUpdateRequested != null:
        return passwordUpdateRequested(_that.oldPassword, _that.newPassword);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) loginRequested,
    required TResult Function(String email, String password, String name)
        registerRequested,
    required TResult Function() logoutRequested,
    required TResult Function() authCheckRequested,
    required TResult Function(String name) profileUpdated,
    required TResult Function(String oldPassword, String newPassword)
        passwordUpdateRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _LoginRequested():
        return loginRequested(_that.email, _that.password);
      case _RegisterRequested():
        return registerRequested(_that.email, _that.password, _that.name);
      case _LogoutRequested():
        return logoutRequested();
      case _AuthCheckRequested():
        return authCheckRequested();
      case _ProfileUpdated():
        return profileUpdated(_that.name);
      case _PasswordUpdateRequested():
        return passwordUpdateRequested(_that.oldPassword, _that.newPassword);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? loginRequested,
    TResult? Function(String email, String password, String name)?
        registerRequested,
    TResult? Function()? logoutRequested,
    TResult? Function()? authCheckRequested,
    TResult? Function(String name)? profileUpdated,
    TResult? Function(String oldPassword, String newPassword)?
        passwordUpdateRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _LoginRequested() when loginRequested != null:
        return loginRequested(_that.email, _that.password);
      case _RegisterRequested() when registerRequested != null:
        return registerRequested(_that.email, _that.password, _that.name);
      case _LogoutRequested() when logoutRequested != null:
        return logoutRequested();
      case _AuthCheckRequested() when authCheckRequested != null:
        return authCheckRequested();
      case _ProfileUpdated() when profileUpdated != null:
        return profileUpdated(_that.name);
      case _PasswordUpdateRequested() when passwordUpdateRequested != null:
        return passwordUpdateRequested(_that.oldPassword, _that.newPassword);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoginRequested implements AuthEvent {
  const _LoginRequested({required this.email, required this.password});

  final String email;
  final String password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginRequestedCopyWith<_LoginRequested> get copyWith =>
      __$LoginRequestedCopyWithImpl<_LoginRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginRequested &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'AuthEvent.loginRequested(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$LoginRequestedCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$LoginRequestedCopyWith(
          _LoginRequested value, $Res Function(_LoginRequested) _then) =
      __$LoginRequestedCopyWithImpl;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$LoginRequestedCopyWithImpl<$Res>
    implements _$LoginRequestedCopyWith<$Res> {
  __$LoginRequestedCopyWithImpl(this._self, this._then);

  final _LoginRequested _self;
  final $Res Function(_LoginRequested) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_LoginRequested(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _RegisterRequested implements AuthEvent {
  const _RegisterRequested(
      {required this.email, required this.password, required this.name});

  final String email;
  final String password;
  final String name;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterRequestedCopyWith<_RegisterRequested> get copyWith =>
      __$RegisterRequestedCopyWithImpl<_RegisterRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterRequested &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, name);

  @override
  String toString() {
    return 'AuthEvent.registerRequested(email: $email, password: $password, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$RegisterRequestedCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$RegisterRequestedCopyWith(
          _RegisterRequested value, $Res Function(_RegisterRequested) _then) =
      __$RegisterRequestedCopyWithImpl;
  @useResult
  $Res call({String email, String password, String name});
}

/// @nodoc
class __$RegisterRequestedCopyWithImpl<$Res>
    implements _$RegisterRequestedCopyWith<$Res> {
  __$RegisterRequestedCopyWithImpl(this._self, this._then);

  final _RegisterRequested _self;
  final $Res Function(_RegisterRequested) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? name = null,
  }) {
    return _then(_RegisterRequested(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _LogoutRequested implements AuthEvent {
  const _LogoutRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LogoutRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.logoutRequested()';
  }
}

/// @nodoc

class _AuthCheckRequested implements AuthEvent {
  const _AuthCheckRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AuthCheckRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.authCheckRequested()';
  }
}

/// @nodoc

class _ProfileUpdated implements AuthEvent {
  const _ProfileUpdated(this.name);

  final String name;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileUpdatedCopyWith<_ProfileUpdated> get copyWith =>
      __$ProfileUpdatedCopyWithImpl<_ProfileUpdated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileUpdated &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @override
  String toString() {
    return 'AuthEvent.profileUpdated(name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ProfileUpdatedCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$ProfileUpdatedCopyWith(
          _ProfileUpdated value, $Res Function(_ProfileUpdated) _then) =
      __$ProfileUpdatedCopyWithImpl;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$ProfileUpdatedCopyWithImpl<$Res>
    implements _$ProfileUpdatedCopyWith<$Res> {
  __$ProfileUpdatedCopyWithImpl(this._self, this._then);

  final _ProfileUpdated _self;
  final $Res Function(_ProfileUpdated) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
  }) {
    return _then(_ProfileUpdated(
      null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _PasswordUpdateRequested implements AuthEvent {
  const _PasswordUpdateRequested(
      {required this.oldPassword, required this.newPassword});

  final String oldPassword;
  final String newPassword;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PasswordUpdateRequestedCopyWith<_PasswordUpdateRequested> get copyWith =>
      __$PasswordUpdateRequestedCopyWithImpl<_PasswordUpdateRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PasswordUpdateRequested &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldPassword, newPassword);

  @override
  String toString() {
    return 'AuthEvent.passwordUpdateRequested(oldPassword: $oldPassword, newPassword: $newPassword)';
  }
}

/// @nodoc
abstract mixin class _$PasswordUpdateRequestedCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$PasswordUpdateRequestedCopyWith(_PasswordUpdateRequested value,
          $Res Function(_PasswordUpdateRequested) _then) =
      __$PasswordUpdateRequestedCopyWithImpl;
  @useResult
  $Res call({String oldPassword, String newPassword});
}

/// @nodoc
class __$PasswordUpdateRequestedCopyWithImpl<$Res>
    implements _$PasswordUpdateRequestedCopyWith<$Res> {
  __$PasswordUpdateRequestedCopyWithImpl(this._self, this._then);

  final _PasswordUpdateRequested _self;
  final $Res Function(_PasswordUpdateRequested) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? oldPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_PasswordUpdateRequested(
      oldPassword: null == oldPassword
          ? _self.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$AuthState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState()';
  }
}

/// @nodoc
class $AuthStateCopyWith<$Res> {
  $AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}

/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Authenticated() when authenticated != null:
        return authenticated(_that);
      case _Unauthenticated() when unauthenticated != null:
        return unauthenticated(_that);
      case _Error() when error != null:
        return error(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Authenticated():
        return authenticated(_that);
      case _Unauthenticated():
        return unauthenticated(_that);
      case _Error():
        return error(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Authenticated() when authenticated != null:
        return authenticated(_that);
      case _Unauthenticated() when unauthenticated != null:
        return unauthenticated(_that);
      case _Error() when error != null:
        return error(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserEntity user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Authenticated() when authenticated != null:
        return authenticated(_that.user);
      case _Unauthenticated() when unauthenticated != null:
        return unauthenticated();
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserEntity user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Authenticated():
        return authenticated(_that.user);
      case _Unauthenticated():
        return unauthenticated();
      case _Error():
        return error(_that.message);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserEntity user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Authenticated() when authenticated != null:
        return authenticated(_that.user);
      case _Unauthenticated() when unauthenticated != null:
        return unauthenticated();
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements AuthState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.initial()';
  }
}

/// @nodoc

class _Loading implements AuthState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.loading()';
  }
}

/// @nodoc

class _Authenticated implements AuthState {
  const _Authenticated(this.user);

  final UserEntity user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthenticatedCopyWith<_Authenticated> get copyWith =>
      __$AuthenticatedCopyWithImpl<_Authenticated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Authenticated &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }
}

/// @nodoc
abstract mixin class _$AuthenticatedCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$AuthenticatedCopyWith(
          _Authenticated value, $Res Function(_Authenticated) _then) =
      __$AuthenticatedCopyWithImpl;
  @useResult
  $Res call({UserEntity user});

  $UserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$AuthenticatedCopyWithImpl<$Res>
    implements _$AuthenticatedCopyWith<$Res> {
  __$AuthenticatedCopyWithImpl(this._self, this._then);

  final _Authenticated _self;
  final $Res Function(_Authenticated) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
  }) {
    return _then(_Authenticated(
      null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get user {
    return $UserEntityCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class _Unauthenticated implements AuthState {
  const _Unauthenticated();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }
}

/// @nodoc

class _Error implements AuthState {
  const _Error(this.message);

  final String message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Error(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
