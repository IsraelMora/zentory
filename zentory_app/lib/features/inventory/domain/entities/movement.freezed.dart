// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovementEntity {
  String get id;
  String get productId;
  String get productName;
  String get workspaceId;
  MovementType get type;
  int get quantity;
  String get reason;
  DateTime get createdAt;
  String get userId;
  String? get userName;

  /// Create a copy of MovementEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MovementEntityCopyWith<MovementEntity> get copyWith =>
      _$MovementEntityCopyWithImpl<MovementEntity>(
          this as MovementEntity, _$identity);

  /// Serializes this MovementEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MovementEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productId, productName,
      workspaceId, type, quantity, reason, createdAt, userId, userName);

  @override
  String toString() {
    return 'MovementEntity(id: $id, productId: $productId, productName: $productName, workspaceId: $workspaceId, type: $type, quantity: $quantity, reason: $reason, createdAt: $createdAt, userId: $userId, userName: $userName)';
  }
}

/// @nodoc
abstract mixin class $MovementEntityCopyWith<$Res> {
  factory $MovementEntityCopyWith(
          MovementEntity value, $Res Function(MovementEntity) _then) =
      _$MovementEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String productId,
      String productName,
      String workspaceId,
      MovementType type,
      int quantity,
      String reason,
      DateTime createdAt,
      String userId,
      String? userName});
}

/// @nodoc
class _$MovementEntityCopyWithImpl<$Res>
    implements $MovementEntityCopyWith<$Res> {
  _$MovementEntityCopyWithImpl(this._self, this._then);

  final MovementEntity _self;
  final $Res Function(MovementEntity) _then;

  /// Create a copy of MovementEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? workspaceId = null,
    Object? type = null,
    Object? quantity = null,
    Object? reason = null,
    Object? createdAt = null,
    Object? userId = null,
    Object? userName = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      workspaceId: null == workspaceId
          ? _self.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as MovementType,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MovementEntity].
extension MovementEntityPatterns on MovementEntity {
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
    TResult Function(_MovementEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MovementEntity() when $default != null:
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
    TResult Function(_MovementEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovementEntity():
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
    TResult? Function(_MovementEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovementEntity() when $default != null:
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
    TResult Function(
            String id,
            String productId,
            String productName,
            String workspaceId,
            MovementType type,
            int quantity,
            String reason,
            DateTime createdAt,
            String userId,
            String? userName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MovementEntity() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.workspaceId,
            _that.type,
            _that.quantity,
            _that.reason,
            _that.createdAt,
            _that.userId,
            _that.userName);
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
    TResult Function(
            String id,
            String productId,
            String productName,
            String workspaceId,
            MovementType type,
            int quantity,
            String reason,
            DateTime createdAt,
            String userId,
            String? userName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovementEntity():
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.workspaceId,
            _that.type,
            _that.quantity,
            _that.reason,
            _that.createdAt,
            _that.userId,
            _that.userName);
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
    TResult? Function(
            String id,
            String productId,
            String productName,
            String workspaceId,
            MovementType type,
            int quantity,
            String reason,
            DateTime createdAt,
            String userId,
            String? userName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovementEntity() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.productName,
            _that.workspaceId,
            _that.type,
            _that.quantity,
            _that.reason,
            _that.createdAt,
            _that.userId,
            _that.userName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MovementEntity implements MovementEntity {
  const _MovementEntity(
      {required this.id,
      required this.productId,
      required this.productName,
      required this.workspaceId,
      required this.type,
      required this.quantity,
      required this.reason,
      required this.createdAt,
      required this.userId,
      this.userName});
  factory _MovementEntity.fromJson(Map<String, dynamic> json) =>
      _$MovementEntityFromJson(json);

  @override
  final String id;
  @override
  final String productId;
  @override
  final String productName;
  @override
  final String workspaceId;
  @override
  final MovementType type;
  @override
  final int quantity;
  @override
  final String reason;
  @override
  final DateTime createdAt;
  @override
  final String userId;
  @override
  final String? userName;

  /// Create a copy of MovementEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MovementEntityCopyWith<_MovementEntity> get copyWith =>
      __$MovementEntityCopyWithImpl<_MovementEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MovementEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MovementEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productId, productName,
      workspaceId, type, quantity, reason, createdAt, userId, userName);

  @override
  String toString() {
    return 'MovementEntity(id: $id, productId: $productId, productName: $productName, workspaceId: $workspaceId, type: $type, quantity: $quantity, reason: $reason, createdAt: $createdAt, userId: $userId, userName: $userName)';
  }
}

/// @nodoc
abstract mixin class _$MovementEntityCopyWith<$Res>
    implements $MovementEntityCopyWith<$Res> {
  factory _$MovementEntityCopyWith(
          _MovementEntity value, $Res Function(_MovementEntity) _then) =
      __$MovementEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String productId,
      String productName,
      String workspaceId,
      MovementType type,
      int quantity,
      String reason,
      DateTime createdAt,
      String userId,
      String? userName});
}

/// @nodoc
class __$MovementEntityCopyWithImpl<$Res>
    implements _$MovementEntityCopyWith<$Res> {
  __$MovementEntityCopyWithImpl(this._self, this._then);

  final _MovementEntity _self;
  final $Res Function(_MovementEntity) _then;

  /// Create a copy of MovementEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? workspaceId = null,
    Object? type = null,
    Object? quantity = null,
    Object? reason = null,
    Object? createdAt = null,
    Object? userId = null,
    Object? userName = freezed,
  }) {
    return _then(_MovementEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      workspaceId: null == workspaceId
          ? _self.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as MovementType,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
