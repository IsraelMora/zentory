// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'members_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MembersEvent {
  String get workspaceId;

  /// Create a copy of MembersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MembersEventCopyWith<MembersEvent> get copyWith =>
      _$MembersEventCopyWithImpl<MembersEvent>(
          this as MembersEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MembersEvent &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceId);

  @override
  String toString() {
    return 'MembersEvent(workspaceId: $workspaceId)';
  }
}

/// @nodoc
abstract mixin class $MembersEventCopyWith<$Res> {
  factory $MembersEventCopyWith(
          MembersEvent value, $Res Function(MembersEvent) _then) =
      _$MembersEventCopyWithImpl;
  @useResult
  $Res call({String workspaceId});
}

/// @nodoc
class _$MembersEventCopyWithImpl<$Res> implements $MembersEventCopyWith<$Res> {
  _$MembersEventCopyWithImpl(this._self, this._then);

  final MembersEvent _self;
  final $Res Function(MembersEvent) _then;

  /// Create a copy of MembersEvent
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

/// Adds pattern-matching-related methods to [MembersEvent].
extension MembersEventPatterns on MembersEvent {
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
    TResult Function(_MembersFetched value)? membersFetched,
    TResult Function(_MemberInvited value)? memberInvited,
    TResult Function(_MemberRemoved value)? memberRemoved,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MembersFetched() when membersFetched != null:
        return membersFetched(_that);
      case _MemberInvited() when memberInvited != null:
        return memberInvited(_that);
      case _MemberRemoved() when memberRemoved != null:
        return memberRemoved(_that);
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
    required TResult Function(_MembersFetched value) membersFetched,
    required TResult Function(_MemberInvited value) memberInvited,
    required TResult Function(_MemberRemoved value) memberRemoved,
  }) {
    final _that = this;
    switch (_that) {
      case _MembersFetched():
        return membersFetched(_that);
      case _MemberInvited():
        return memberInvited(_that);
      case _MemberRemoved():
        return memberRemoved(_that);
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
    TResult? Function(_MembersFetched value)? membersFetched,
    TResult? Function(_MemberInvited value)? memberInvited,
    TResult? Function(_MemberRemoved value)? memberRemoved,
  }) {
    final _that = this;
    switch (_that) {
      case _MembersFetched() when membersFetched != null:
        return membersFetched(_that);
      case _MemberInvited() when memberInvited != null:
        return memberInvited(_that);
      case _MemberRemoved() when memberRemoved != null:
        return memberRemoved(_that);
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
    TResult Function(String workspaceId)? membersFetched,
    TResult Function(String workspaceId, String email, String role)?
        memberInvited,
    TResult Function(String workspaceId, String memberId)? memberRemoved,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MembersFetched() when membersFetched != null:
        return membersFetched(_that.workspaceId);
      case _MemberInvited() when memberInvited != null:
        return memberInvited(_that.workspaceId, _that.email, _that.role);
      case _MemberRemoved() when memberRemoved != null:
        return memberRemoved(_that.workspaceId, _that.memberId);
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
    required TResult Function(String workspaceId) membersFetched,
    required TResult Function(String workspaceId, String email, String role)
        memberInvited,
    required TResult Function(String workspaceId, String memberId)
        memberRemoved,
  }) {
    final _that = this;
    switch (_that) {
      case _MembersFetched():
        return membersFetched(_that.workspaceId);
      case _MemberInvited():
        return memberInvited(_that.workspaceId, _that.email, _that.role);
      case _MemberRemoved():
        return memberRemoved(_that.workspaceId, _that.memberId);
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
    TResult? Function(String workspaceId)? membersFetched,
    TResult? Function(String workspaceId, String email, String role)?
        memberInvited,
    TResult? Function(String workspaceId, String memberId)? memberRemoved,
  }) {
    final _that = this;
    switch (_that) {
      case _MembersFetched() when membersFetched != null:
        return membersFetched(_that.workspaceId);
      case _MemberInvited() when memberInvited != null:
        return memberInvited(_that.workspaceId, _that.email, _that.role);
      case _MemberRemoved() when memberRemoved != null:
        return memberRemoved(_that.workspaceId, _that.memberId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MembersFetched implements MembersEvent {
  const _MembersFetched(this.workspaceId);

  @override
  final String workspaceId;

  /// Create a copy of MembersEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MembersFetchedCopyWith<_MembersFetched> get copyWith =>
      __$MembersFetchedCopyWithImpl<_MembersFetched>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MembersFetched &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceId);

  @override
  String toString() {
    return 'MembersEvent.membersFetched(workspaceId: $workspaceId)';
  }
}

/// @nodoc
abstract mixin class _$MembersFetchedCopyWith<$Res>
    implements $MembersEventCopyWith<$Res> {
  factory _$MembersFetchedCopyWith(
          _MembersFetched value, $Res Function(_MembersFetched) _then) =
      __$MembersFetchedCopyWithImpl;
  @override
  @useResult
  $Res call({String workspaceId});
}

/// @nodoc
class __$MembersFetchedCopyWithImpl<$Res>
    implements _$MembersFetchedCopyWith<$Res> {
  __$MembersFetchedCopyWithImpl(this._self, this._then);

  final _MembersFetched _self;
  final $Res Function(_MembersFetched) _then;

  /// Create a copy of MembersEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workspaceId = null,
  }) {
    return _then(_MembersFetched(
      null == workspaceId
          ? _self.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _MemberInvited implements MembersEvent {
  const _MemberInvited(
      {required this.workspaceId, required this.email, required this.role});

  @override
  final String workspaceId;
  final String email;
  final String role;

  /// Create a copy of MembersEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberInvitedCopyWith<_MemberInvited> get copyWith =>
      __$MemberInvitedCopyWithImpl<_MemberInvited>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberInvited &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceId, email, role);

  @override
  String toString() {
    return 'MembersEvent.memberInvited(workspaceId: $workspaceId, email: $email, role: $role)';
  }
}

/// @nodoc
abstract mixin class _$MemberInvitedCopyWith<$Res>
    implements $MembersEventCopyWith<$Res> {
  factory _$MemberInvitedCopyWith(
          _MemberInvited value, $Res Function(_MemberInvited) _then) =
      __$MemberInvitedCopyWithImpl;
  @override
  @useResult
  $Res call({String workspaceId, String email, String role});
}

/// @nodoc
class __$MemberInvitedCopyWithImpl<$Res>
    implements _$MemberInvitedCopyWith<$Res> {
  __$MemberInvitedCopyWithImpl(this._self, this._then);

  final _MemberInvited _self;
  final $Res Function(_MemberInvited) _then;

  /// Create a copy of MembersEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workspaceId = null,
    Object? email = null,
    Object? role = null,
  }) {
    return _then(_MemberInvited(
      workspaceId: null == workspaceId
          ? _self.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _MemberRemoved implements MembersEvent {
  const _MemberRemoved({required this.workspaceId, required this.memberId});

  @override
  final String workspaceId;
  final String memberId;

  /// Create a copy of MembersEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberRemovedCopyWith<_MemberRemoved> get copyWith =>
      __$MemberRemovedCopyWithImpl<_MemberRemoved>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberRemoved &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceId, memberId);

  @override
  String toString() {
    return 'MembersEvent.memberRemoved(workspaceId: $workspaceId, memberId: $memberId)';
  }
}

/// @nodoc
abstract mixin class _$MemberRemovedCopyWith<$Res>
    implements $MembersEventCopyWith<$Res> {
  factory _$MemberRemovedCopyWith(
          _MemberRemoved value, $Res Function(_MemberRemoved) _then) =
      __$MemberRemovedCopyWithImpl;
  @override
  @useResult
  $Res call({String workspaceId, String memberId});
}

/// @nodoc
class __$MemberRemovedCopyWithImpl<$Res>
    implements _$MemberRemovedCopyWith<$Res> {
  __$MemberRemovedCopyWithImpl(this._self, this._then);

  final _MemberRemoved _self;
  final $Res Function(_MemberRemoved) _then;

  /// Create a copy of MembersEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workspaceId = null,
    Object? memberId = null,
  }) {
    return _then(_MemberRemoved(
      workspaceId: null == workspaceId
          ? _self.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
      memberId: null == memberId
          ? _self.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$MembersState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MembersState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MembersState()';
  }
}

/// @nodoc
class $MembersStateCopyWith<$Res> {
  $MembersStateCopyWith(MembersState _, $Res Function(MembersState) __);
}

/// Adds pattern-matching-related methods to [MembersState].
extension MembersStatePatterns on MembersState {
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
    TResult Function(List<MemberEntity> members)? loaded,
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
        return loaded(_that.members);
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
    required TResult Function(List<MemberEntity> members) loaded,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Loaded():
        return loaded(_that.members);
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
    TResult? Function(List<MemberEntity> members)? loaded,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(_that.members);
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements MembersState {
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
    return 'MembersState.initial()';
  }
}

/// @nodoc

class _Loading implements MembersState {
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
    return 'MembersState.loading()';
  }
}

/// @nodoc

class _Loaded implements MembersState {
  const _Loaded(final List<MemberEntity> members) : _members = members;

  final List<MemberEntity> _members;
  List<MemberEntity> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  /// Create a copy of MembersState
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
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_members));

  @override
  String toString() {
    return 'MembersState.loaded(members: $members)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $MembersStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call({List<MemberEntity> members});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of MembersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? members = null,
  }) {
    return _then(_Loaded(
      null == members
          ? _self._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<MemberEntity>,
    ));
  }
}

/// @nodoc

class _Error implements MembersState {
  const _Error(this.message);

  final String message;

  /// Create a copy of MembersState
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
    return 'MembersState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $MembersStateCopyWith<$Res> {
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

  /// Create a copy of MembersState
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
