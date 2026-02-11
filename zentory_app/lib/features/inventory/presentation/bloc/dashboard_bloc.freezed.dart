// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardEvent {
  String get workspaceId;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardEventCopyWith<DashboardEvent> get copyWith =>
      _$DashboardEventCopyWithImpl<DashboardEvent>(
          this as DashboardEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardEvent &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceId);

  @override
  String toString() {
    return 'DashboardEvent(workspaceId: $workspaceId)';
  }
}

/// @nodoc
abstract mixin class $DashboardEventCopyWith<$Res> {
  factory $DashboardEventCopyWith(
          DashboardEvent value, $Res Function(DashboardEvent) _then) =
      _$DashboardEventCopyWithImpl;
  @useResult
  $Res call({String workspaceId});
}

/// @nodoc
class _$DashboardEventCopyWithImpl<$Res>
    implements $DashboardEventCopyWith<$Res> {
  _$DashboardEventCopyWithImpl(this._self, this._then);

  final DashboardEvent _self;
  final $Res Function(DashboardEvent) _then;

  /// Create a copy of DashboardEvent
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

/// Adds pattern-matching-related methods to [DashboardEvent].
extension DashboardEventPatterns on DashboardEvent {
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
    TResult Function(_DashboardFetched value)? dashboardFetched,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardFetched() when dashboardFetched != null:
        return dashboardFetched(_that);
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
    required TResult Function(_DashboardFetched value) dashboardFetched,
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardFetched():
        return dashboardFetched(_that);
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
    TResult? Function(_DashboardFetched value)? dashboardFetched,
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardFetched() when dashboardFetched != null:
        return dashboardFetched(_that);
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
    TResult Function(String workspaceId)? dashboardFetched,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardFetched() when dashboardFetched != null:
        return dashboardFetched(_that.workspaceId);
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
    required TResult Function(String workspaceId) dashboardFetched,
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardFetched():
        return dashboardFetched(_that.workspaceId);
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
    TResult? Function(String workspaceId)? dashboardFetched,
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardFetched() when dashboardFetched != null:
        return dashboardFetched(_that.workspaceId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DashboardFetched implements DashboardEvent {
  const _DashboardFetched(this.workspaceId);

  @override
  final String workspaceId;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardFetchedCopyWith<_DashboardFetched> get copyWith =>
      __$DashboardFetchedCopyWithImpl<_DashboardFetched>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardFetched &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceId);

  @override
  String toString() {
    return 'DashboardEvent.dashboardFetched(workspaceId: $workspaceId)';
  }
}

/// @nodoc
abstract mixin class _$DashboardFetchedCopyWith<$Res>
    implements $DashboardEventCopyWith<$Res> {
  factory _$DashboardFetchedCopyWith(
          _DashboardFetched value, $Res Function(_DashboardFetched) _then) =
      __$DashboardFetchedCopyWithImpl;
  @override
  @useResult
  $Res call({String workspaceId});
}

/// @nodoc
class __$DashboardFetchedCopyWithImpl<$Res>
    implements _$DashboardFetchedCopyWith<$Res> {
  __$DashboardFetchedCopyWithImpl(this._self, this._then);

  final _DashboardFetched _self;
  final $Res Function(_DashboardFetched) _then;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workspaceId = null,
  }) {
    return _then(_DashboardFetched(
      null == workspaceId
          ? _self.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$DashboardState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DashboardState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DashboardState()';
  }
}

/// @nodoc
class $DashboardStateCopyWith<$Res> {
  $DashboardStateCopyWith(DashboardState _, $Res Function(DashboardState) __);
}

/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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
    TResult Function(
            int totalItems,
            double totalStockValue,
            int totalCategories,
            List<ProductEntity> lowStockItems,
            List<MovementEntity> recentMovements)?
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
        return loaded(_that.totalItems, _that.totalStockValue,
            _that.totalCategories, _that.lowStockItems, _that.recentMovements);
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
    required TResult Function(
            int totalItems,
            double totalStockValue,
            int totalCategories,
            List<ProductEntity> lowStockItems,
            List<MovementEntity> recentMovements)
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
        return loaded(_that.totalItems, _that.totalStockValue,
            _that.totalCategories, _that.lowStockItems, _that.recentMovements);
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
    TResult? Function(
            int totalItems,
            double totalStockValue,
            int totalCategories,
            List<ProductEntity> lowStockItems,
            List<MovementEntity> recentMovements)?
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
        return loaded(_that.totalItems, _that.totalStockValue,
            _that.totalCategories, _that.lowStockItems, _that.recentMovements);
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements DashboardState {
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
    return 'DashboardState.initial()';
  }
}

/// @nodoc

class _Loading implements DashboardState {
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
    return 'DashboardState.loading()';
  }
}

/// @nodoc

class _Loaded implements DashboardState {
  const _Loaded(
      {required this.totalItems,
      required this.totalStockValue,
      required this.totalCategories,
      required final List<ProductEntity> lowStockItems,
      required final List<MovementEntity> recentMovements})
      : _lowStockItems = lowStockItems,
        _recentMovements = recentMovements;

  final int totalItems;
  final double totalStockValue;
  final int totalCategories;
  final List<ProductEntity> _lowStockItems;
  List<ProductEntity> get lowStockItems {
    if (_lowStockItems is EqualUnmodifiableListView) return _lowStockItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lowStockItems);
  }

  final List<MovementEntity> _recentMovements;
  List<MovementEntity> get recentMovements {
    if (_recentMovements is EqualUnmodifiableListView) return _recentMovements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentMovements);
  }

  /// Create a copy of DashboardState
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
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.totalStockValue, totalStockValue) ||
                other.totalStockValue == totalStockValue) &&
            (identical(other.totalCategories, totalCategories) ||
                other.totalCategories == totalCategories) &&
            const DeepCollectionEquality()
                .equals(other._lowStockItems, _lowStockItems) &&
            const DeepCollectionEquality()
                .equals(other._recentMovements, _recentMovements));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalItems,
      totalStockValue,
      totalCategories,
      const DeepCollectionEquality().hash(_lowStockItems),
      const DeepCollectionEquality().hash(_recentMovements));

  @override
  String toString() {
    return 'DashboardState.loaded(totalItems: $totalItems, totalStockValue: $totalStockValue, totalCategories: $totalCategories, lowStockItems: $lowStockItems, recentMovements: $recentMovements)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call(
      {int totalItems,
      double totalStockValue,
      int totalCategories,
      List<ProductEntity> lowStockItems,
      List<MovementEntity> recentMovements});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalItems = null,
    Object? totalStockValue = null,
    Object? totalCategories = null,
    Object? lowStockItems = null,
    Object? recentMovements = null,
  }) {
    return _then(_Loaded(
      totalItems: null == totalItems
          ? _self.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      totalStockValue: null == totalStockValue
          ? _self.totalStockValue
          : totalStockValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalCategories: null == totalCategories
          ? _self.totalCategories
          : totalCategories // ignore: cast_nullable_to_non_nullable
              as int,
      lowStockItems: null == lowStockItems
          ? _self._lowStockItems
          : lowStockItems // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      recentMovements: null == recentMovements
          ? _self._recentMovements
          : recentMovements // ignore: cast_nullable_to_non_nullable
              as List<MovementEntity>,
    ));
  }
}

/// @nodoc

class _Error implements DashboardState {
  const _Error(this.message);

  final String message;

  /// Create a copy of DashboardState
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
    return 'DashboardState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
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

  /// Create a copy of DashboardState
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
