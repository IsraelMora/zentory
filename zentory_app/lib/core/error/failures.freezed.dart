// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Failure {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Failure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Failure()';
  }
}

/// @nodoc
class $FailureCopyWith<$Res> {
  $FailureCopyWith(Failure _, $Res Function(Failure) __);
}

/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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
    TResult Function(ServerFailure value)? serverError,
    TResult Function(CacheFailure value)? cacheError,
    TResult Function(UnauthorizedFailure value)? unauthorized,
    TResult Function(InvalidInputFailure value)? invalidInput,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ServerFailure() when serverError != null:
        return serverError(_that);
      case CacheFailure() when cacheError != null:
        return cacheError(_that);
      case UnauthorizedFailure() when unauthorized != null:
        return unauthorized(_that);
      case InvalidInputFailure() when invalidInput != null:
        return invalidInput(_that);
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
    required TResult Function(ServerFailure value) serverError,
    required TResult Function(CacheFailure value) cacheError,
    required TResult Function(UnauthorizedFailure value) unauthorized,
    required TResult Function(InvalidInputFailure value) invalidInput,
  }) {
    final _that = this;
    switch (_that) {
      case ServerFailure():
        return serverError(_that);
      case CacheFailure():
        return cacheError(_that);
      case UnauthorizedFailure():
        return unauthorized(_that);
      case InvalidInputFailure():
        return invalidInput(_that);
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
    TResult? Function(ServerFailure value)? serverError,
    TResult? Function(CacheFailure value)? cacheError,
    TResult? Function(UnauthorizedFailure value)? unauthorized,
    TResult? Function(InvalidInputFailure value)? invalidInput,
  }) {
    final _that = this;
    switch (_that) {
      case ServerFailure() when serverError != null:
        return serverError(_that);
      case CacheFailure() when cacheError != null:
        return cacheError(_that);
      case UnauthorizedFailure() when unauthorized != null:
        return unauthorized(_that);
      case InvalidInputFailure() when invalidInput != null:
        return invalidInput(_that);
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
    TResult Function(String? message)? serverError,
    TResult Function()? cacheError,
    TResult Function()? unauthorized,
    TResult Function(String? message)? invalidInput,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ServerFailure() when serverError != null:
        return serverError(_that.message);
      case CacheFailure() when cacheError != null:
        return cacheError();
      case UnauthorizedFailure() when unauthorized != null:
        return unauthorized();
      case InvalidInputFailure() when invalidInput != null:
        return invalidInput(_that.message);
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
    required TResult Function(String? message) serverError,
    required TResult Function() cacheError,
    required TResult Function() unauthorized,
    required TResult Function(String? message) invalidInput,
  }) {
    final _that = this;
    switch (_that) {
      case ServerFailure():
        return serverError(_that.message);
      case CacheFailure():
        return cacheError();
      case UnauthorizedFailure():
        return unauthorized();
      case InvalidInputFailure():
        return invalidInput(_that.message);
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
    TResult? Function(String? message)? serverError,
    TResult? Function()? cacheError,
    TResult? Function()? unauthorized,
    TResult? Function(String? message)? invalidInput,
  }) {
    final _that = this;
    switch (_that) {
      case ServerFailure() when serverError != null:
        return serverError(_that.message);
      case CacheFailure() when cacheError != null:
        return cacheError();
      case UnauthorizedFailure() when unauthorized != null:
        return unauthorized();
      case InvalidInputFailure() when invalidInput != null:
        return invalidInput(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ServerFailure implements Failure {
  const ServerFailure([this.message]);

  final String? message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServerFailureCopyWith<ServerFailure> get copyWith =>
      _$ServerFailureCopyWithImpl<ServerFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Failure.serverError(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ServerFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(
          ServerFailure value, $Res Function(ServerFailure) _then) =
      _$ServerFailureCopyWithImpl;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$ServerFailureCopyWithImpl<$Res>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(this._self, this._then);

  final ServerFailure _self;
  final $Res Function(ServerFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
  }) {
    return _then(ServerFailure(
      freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class CacheFailure implements Failure {
  const CacheFailure();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CacheFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Failure.cacheError()';
  }
}

/// @nodoc

class UnauthorizedFailure implements Failure {
  const UnauthorizedFailure();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UnauthorizedFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Failure.unauthorized()';
  }
}

/// @nodoc

class InvalidInputFailure implements Failure {
  const InvalidInputFailure([this.message]);

  final String? message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvalidInputFailureCopyWith<InvalidInputFailure> get copyWith =>
      _$InvalidInputFailureCopyWithImpl<InvalidInputFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidInputFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Failure.invalidInput(message: $message)';
  }
}

/// @nodoc
abstract mixin class $InvalidInputFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $InvalidInputFailureCopyWith(
          InvalidInputFailure value, $Res Function(InvalidInputFailure) _then) =
      _$InvalidInputFailureCopyWithImpl;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$InvalidInputFailureCopyWithImpl<$Res>
    implements $InvalidInputFailureCopyWith<$Res> {
  _$InvalidInputFailureCopyWithImpl(this._self, this._then);

  final InvalidInputFailure _self;
  final $Res Function(InvalidInputFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
  }) {
    return _then(InvalidInputFailure(
      freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
