// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movements_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovementsEvent {
  String get workspaceId;

  /// Create a copy of MovementsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MovementsEventCopyWith<MovementsEvent> get copyWith =>
      _$MovementsEventCopyWithImpl<MovementsEvent>(
          this as MovementsEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MovementsEvent &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceId);

  @override
  String toString() {
    return 'MovementsEvent(workspaceId: $workspaceId)';
  }
}

/// @nodoc
abstract mixin class $MovementsEventCopyWith<$Res> {
  factory $MovementsEventCopyWith(
          MovementsEvent value, $Res Function(MovementsEvent) _then) =
      _$MovementsEventCopyWithImpl;
  @useResult
  $Res call({String workspaceId});
}

/// @nodoc
class _$MovementsEventCopyWithImpl<$Res>
    implements $MovementsEventCopyWith<$Res> {
  _$MovementsEventCopyWithImpl(this._self, this._then);

  final MovementsEvent _self;
  final $Res Function(MovementsEvent) _then;

  /// Create a copy of MovementsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workspaceId = null,
  }) {
    return _then(_self.copyWith(
      workspaceId: null == workspaceId
          ? _self.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [MovementsEvent].
extension MovementsEventPatterns on MovementsEvent {
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
    TResult Function(_MovementsFetched value)? movementsFetched,
    TResult Function(_LoadMoreMovements value)? loadMoreMovements,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MovementsFetched() when movementsFetched != null:
        return movementsFetched(_that);
      case _LoadMoreMovements() when loadMoreMovements != null:
        return loadMoreMovements(_that);
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
    required TResult Function(_MovementsFetched value) movementsFetched,
    required TResult Function(_LoadMoreMovements value) loadMoreMovements,
  }) {
    final _that = this;
    switch (_that) {
      case _MovementsFetched():
        return movementsFetched(_that);
      case _LoadMoreMovements():
        return loadMoreMovements(_that);
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
    TResult? Function(_MovementsFetched value)? movementsFetched,
    TResult? Function(_LoadMoreMovements value)? loadMoreMovements,
  }) {
    final _that = this;
    switch (_that) {
      case _MovementsFetched() when movementsFetched != null:
        return movementsFetched(_that);
      case _LoadMoreMovements() when loadMoreMovements != null:
        return loadMoreMovements(_that);
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
    TResult Function(String workspaceId)? movementsFetched,
    TResult Function(String workspaceId)? loadMoreMovements,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MovementsFetched() when movementsFetched != null:
        return movementsFetched(_that.workspaceId);
      case _LoadMoreMovements() when loadMoreMovements != null:
        return loadMoreMovements(_that.workspaceId);
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
    required TResult Function(String workspaceId) movementsFetched,
    required TResult Function(String workspaceId) loadMoreMovements,
  }) {
    final _that = this;
    switch (_that) {
      case _MovementsFetched():
        return movementsFetched(_that.workspaceId);
      case _LoadMoreMovements():
        return loadMoreMovements(_that.workspaceId);
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
    TResult? Function(String workspaceId)? movementsFetched,
    TResult? Function(String workspaceId)? loadMoreMovements,
  }) {
    final _that = this;
    switch (_that) {
      case _MovementsFetched() when movementsFetched != null:
        return movementsFetched(_that.workspaceId);
      case _LoadMoreMovements() when loadMoreMovements != null:
        return loadMoreMovements(_that.workspaceId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MovementsFetched implements MovementsEvent {
  const _MovementsFetched(this.workspaceId);

  @override
  final String workspaceId;

  /// Create a copy of MovementsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MovementsFetchedCopyWith<_MovementsFetched> get copyWith =>
      __$MovementsFetchedCopyWithImpl<_MovementsFetched>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MovementsFetched &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceId);

  @override
  String toString() {
    return 'MovementsEvent.movementsFetched(workspaceId: $workspaceId)';
  }
}

/// @nodoc
abstract mixin class _$MovementsFetchedCopyWith<$Res>
    implements $MovementsEventCopyWith<$Res> {
  factory _$MovementsFetchedCopyWith(
          _MovementsFetched value, $Res Function(_MovementsFetched) _then) =
      __$MovementsFetchedCopyWithImpl;
  @override
  @useResult
  $Res call({String workspaceId});
}

/// @nodoc
class __$MovementsFetchedCopyWithImpl<$Res>
    implements _$MovementsFetchedCopyWith<$Res> {
  __$MovementsFetchedCopyWithImpl(this._self, this._then);

  final _MovementsFetched _self;
  final $Res Function(_MovementsFetched) _then;

  /// Create a copy of MovementsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workspaceId = null,
  }) {
    return _then(_MovementsFetched(
      null == workspaceId
          ? _self.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _LoadMoreMovements implements MovementsEvent {
  const _LoadMoreMovements(this.workspaceId);

  @override
  final String workspaceId;

  /// Create a copy of MovementsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadMoreMovementsCopyWith<_LoadMoreMovements> get copyWith =>
      __$LoadMoreMovementsCopyWithImpl<_LoadMoreMovements>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadMoreMovements &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceId);

  @override
  String toString() {
    return 'MovementsEvent.loadMoreMovements(workspaceId: $workspaceId)';
  }
}

/// @nodoc
abstract mixin class _$LoadMoreMovementsCopyWith<$Res>
    implements $MovementsEventCopyWith<$Res> {
  factory _$LoadMoreMovementsCopyWith(
          _LoadMoreMovements value, $Res Function(_LoadMoreMovements) _then) =
      __$LoadMoreMovementsCopyWithImpl;
  @override
  @useResult
  $Res call({String workspaceId});
}

/// @nodoc
class __$LoadMoreMovementsCopyWithImpl<$Res>
    implements _$LoadMoreMovementsCopyWith<$Res> {
  __$LoadMoreMovementsCopyWithImpl(this._self, this._then);

  final _LoadMoreMovements _self;
  final $Res Function(_LoadMoreMovements) _then;

  /// Create a copy of MovementsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workspaceId = null,
  }) {
    return _then(_LoadMoreMovements(
      null == workspaceId
          ? _self.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$MovementsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MovementsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MovementsState()';
  }
}

/// @nodoc
class $MovementsStateCopyWith<$Res> {
  $MovementsStateCopyWith(MovementsState _, $Res Function(MovementsState) __);
}

/// Adds pattern-matching-related methods to [MovementsState].
extension MovementsStatePatterns on MovementsState {
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
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Loaded():
        return loaded(_that);
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
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
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
    TResult Function(List<MovementEntity> movements, bool hasReachedMax,
            bool isLoadingMore)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(
            _that.movements, _that.hasReachedMax, _that.isLoadingMore);
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
    required TResult Function(List<MovementEntity> movements,
            bool hasReachedMax, bool isLoadingMore)
        loaded,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Loaded():
        return loaded(
            _that.movements, _that.hasReachedMax, _that.isLoadingMore);
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
    TResult? Function(List<MovementEntity> movements, bool hasReachedMax,
            bool isLoadingMore)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(
            _that.movements, _that.hasReachedMax, _that.isLoadingMore);
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements MovementsState {
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
    return 'MovementsState.initial()';
  }
}

/// @nodoc

class _Loading implements MovementsState {
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
    return 'MovementsState.loading()';
  }
}

/// @nodoc

class _Loaded implements MovementsState {
  const _Loaded(
      {required final List<MovementEntity> movements,
      this.hasReachedMax = false,
      this.isLoadingMore = false})
      : _movements = movements;

  final List<MovementEntity> _movements;
  List<MovementEntity> get movements {
    if (_movements is EqualUnmodifiableListView) return _movements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movements);
  }

  @JsonKey()
  final bool hasReachedMax;
  @JsonKey()
  final bool isLoadingMore;

  /// Create a copy of MovementsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality()
                .equals(other._movements, _movements) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_movements),
      hasReachedMax,
      isLoadingMore);

  @override
  String toString() {
    return 'MovementsState.loaded(movements: $movements, hasReachedMax: $hasReachedMax, isLoadingMore: $isLoadingMore)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $MovementsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call(
      {List<MovementEntity> movements, bool hasReachedMax, bool isLoadingMore});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of MovementsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? movements = null,
    Object? hasReachedMax = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_Loaded(
      movements: null == movements
          ? _self._movements
          : movements // ignore: cast_nullable_to_non_nullable
              as List<MovementEntity>,
      hasReachedMax: null == hasReachedMax
          ? _self.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _Error implements MovementsState {
  const _Error(this.message);

  final String message;

  /// Create a copy of MovementsState
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
    return 'MovementsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $MovementsStateCopyWith<$Res> {
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

  /// Create a copy of MovementsState
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
