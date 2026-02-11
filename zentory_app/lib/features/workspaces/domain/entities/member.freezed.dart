// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberEntity {
  String get id;
  String get name;
  String get email;
  String get role;
  DateTime get joinedAt;

  /// Create a copy of MemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberEntityCopyWith<MemberEntity> get copyWith =>
      _$MemberEntityCopyWithImpl<MemberEntity>(
          this as MemberEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemberEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, role, joinedAt);

  @override
  String toString() {
    return 'MemberEntity(id: $id, name: $name, email: $email, role: $role, joinedAt: $joinedAt)';
  }
}

/// @nodoc
abstract mixin class $MemberEntityCopyWith<$Res> {
  factory $MemberEntityCopyWith(
          MemberEntity value, $Res Function(MemberEntity) _then) =
      _$MemberEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id, String name, String email, String role, DateTime joinedAt});
}

/// @nodoc
class _$MemberEntityCopyWithImpl<$Res> implements $MemberEntityCopyWith<$Res> {
  _$MemberEntityCopyWithImpl(this._self, this._then);

  final MemberEntity _self;
  final $Res Function(MemberEntity) _then;

  /// Create a copy of MemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? joinedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _self.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [MemberEntity].
extension MemberEntityPatterns on MemberEntity {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MemberEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberEntity() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_MemberEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberEntity():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MemberEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberEntity() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, String email, String role,
            DateTime joinedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberEntity() when $default != null:
        return $default(
            _that.id, _that.name, _that.email, _that.role, _that.joinedAt);
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
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, String email, String role,
            DateTime joinedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberEntity():
        return $default(
            _that.id, _that.name, _that.email, _that.role, _that.joinedAt);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, String email, String role,
            DateTime joinedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberEntity() when $default != null:
        return $default(
            _that.id, _that.name, _that.email, _that.role, _that.joinedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MemberEntity implements MemberEntity {
  const _MemberEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.role,
      required this.joinedAt});

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String role;
  @override
  final DateTime joinedAt;

  /// Create a copy of MemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberEntityCopyWith<_MemberEntity> get copyWith =>
      __$MemberEntityCopyWithImpl<_MemberEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, role, joinedAt);

  @override
  String toString() {
    return 'MemberEntity(id: $id, name: $name, email: $email, role: $role, joinedAt: $joinedAt)';
  }
}

/// @nodoc
abstract mixin class _$MemberEntityCopyWith<$Res>
    implements $MemberEntityCopyWith<$Res> {
  factory _$MemberEntityCopyWith(
          _MemberEntity value, $Res Function(_MemberEntity) _then) =
      __$MemberEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id, String name, String email, String role, DateTime joinedAt});
}

/// @nodoc
class __$MemberEntityCopyWithImpl<$Res>
    implements _$MemberEntityCopyWith<$Res> {
  __$MemberEntityCopyWithImpl(this._self, this._then);

  final _MemberEntity _self;
  final $Res Function(_MemberEntity) _then;

  /// Create a copy of MemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? joinedAt = null,
  }) {
    return _then(_MemberEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _self.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
