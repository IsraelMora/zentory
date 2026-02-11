// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InventoryEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InventoryEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InventoryEvent()';
  }
}

/// @nodoc
class $InventoryEventCopyWith<$Res> {
  $InventoryEventCopyWith(InventoryEvent _, $Res Function(InventoryEvent) __);
}

/// Adds pattern-matching-related methods to [InventoryEvent].
extension InventoryEventPatterns on InventoryEvent {
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
    TResult Function(_ProductsFetched value)? productsFetched,
    TResult Function(_ProductAdded value)? productAdded,
    TResult Function(_ProductUpdated value)? productUpdated,
    TResult Function(_ProductDeleted value)? productDeleted,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_CategoryFilterChanged value)? categoryFilterChanged,
    TResult Function(_ProductImageUploadRequested value)?
        productImageUploadRequested,
    TResult Function(_SubscriptionRequested value)? subscriptionRequested,
    TResult Function(_RealtimeUpdateReceived value)? realtimeUpdateReceived,
    TResult Function(_LoadMoreProducts value)? loadMoreProducts,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductsFetched() when productsFetched != null:
        return productsFetched(_that);
      case _ProductAdded() when productAdded != null:
        return productAdded(_that);
      case _ProductUpdated() when productUpdated != null:
        return productUpdated(_that);
      case _ProductDeleted() when productDeleted != null:
        return productDeleted(_that);
      case _SearchQueryChanged() when searchQueryChanged != null:
        return searchQueryChanged(_that);
      case _CategoryFilterChanged() when categoryFilterChanged != null:
        return categoryFilterChanged(_that);
      case _ProductImageUploadRequested()
          when productImageUploadRequested != null:
        return productImageUploadRequested(_that);
      case _SubscriptionRequested() when subscriptionRequested != null:
        return subscriptionRequested(_that);
      case _RealtimeUpdateReceived() when realtimeUpdateReceived != null:
        return realtimeUpdateReceived(_that);
      case _LoadMoreProducts() when loadMoreProducts != null:
        return loadMoreProducts(_that);
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
    required TResult Function(_ProductsFetched value) productsFetched,
    required TResult Function(_ProductAdded value) productAdded,
    required TResult Function(_ProductUpdated value) productUpdated,
    required TResult Function(_ProductDeleted value) productDeleted,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_CategoryFilterChanged value)
        categoryFilterChanged,
    required TResult Function(_ProductImageUploadRequested value)
        productImageUploadRequested,
    required TResult Function(_SubscriptionRequested value)
        subscriptionRequested,
    required TResult Function(_RealtimeUpdateReceived value)
        realtimeUpdateReceived,
    required TResult Function(_LoadMoreProducts value) loadMoreProducts,
  }) {
    final _that = this;
    switch (_that) {
      case _ProductsFetched():
        return productsFetched(_that);
      case _ProductAdded():
        return productAdded(_that);
      case _ProductUpdated():
        return productUpdated(_that);
      case _ProductDeleted():
        return productDeleted(_that);
      case _SearchQueryChanged():
        return searchQueryChanged(_that);
      case _CategoryFilterChanged():
        return categoryFilterChanged(_that);
      case _ProductImageUploadRequested():
        return productImageUploadRequested(_that);
      case _SubscriptionRequested():
        return subscriptionRequested(_that);
      case _RealtimeUpdateReceived():
        return realtimeUpdateReceived(_that);
      case _LoadMoreProducts():
        return loadMoreProducts(_that);
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
    TResult? Function(_ProductsFetched value)? productsFetched,
    TResult? Function(_ProductAdded value)? productAdded,
    TResult? Function(_ProductUpdated value)? productUpdated,
    TResult? Function(_ProductDeleted value)? productDeleted,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_CategoryFilterChanged value)? categoryFilterChanged,
    TResult? Function(_ProductImageUploadRequested value)?
        productImageUploadRequested,
    TResult? Function(_SubscriptionRequested value)? subscriptionRequested,
    TResult? Function(_RealtimeUpdateReceived value)? realtimeUpdateReceived,
    TResult? Function(_LoadMoreProducts value)? loadMoreProducts,
  }) {
    final _that = this;
    switch (_that) {
      case _ProductsFetched() when productsFetched != null:
        return productsFetched(_that);
      case _ProductAdded() when productAdded != null:
        return productAdded(_that);
      case _ProductUpdated() when productUpdated != null:
        return productUpdated(_that);
      case _ProductDeleted() when productDeleted != null:
        return productDeleted(_that);
      case _SearchQueryChanged() when searchQueryChanged != null:
        return searchQueryChanged(_that);
      case _CategoryFilterChanged() when categoryFilterChanged != null:
        return categoryFilterChanged(_that);
      case _ProductImageUploadRequested()
          when productImageUploadRequested != null:
        return productImageUploadRequested(_that);
      case _SubscriptionRequested() when subscriptionRequested != null:
        return subscriptionRequested(_that);
      case _RealtimeUpdateReceived() when realtimeUpdateReceived != null:
        return realtimeUpdateReceived(_that);
      case _LoadMoreProducts() when loadMoreProducts != null:
        return loadMoreProducts(_that);
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
    TResult Function(String workspaceId)? productsFetched,
    TResult Function(ProductEntity product)? productAdded,
    TResult Function(ProductEntity product)? productUpdated,
    TResult Function(String productId, String workspaceId)? productDeleted,
    TResult Function(String query)? searchQueryChanged,
    TResult Function(String? category)? categoryFilterChanged,
    TResult Function(String filePath, String fileName)?
        productImageUploadRequested,
    TResult Function(String workspaceId)? subscriptionRequested,
    TResult Function()? realtimeUpdateReceived,
    TResult Function(String workspaceId)? loadMoreProducts,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductsFetched() when productsFetched != null:
        return productsFetched(_that.workspaceId);
      case _ProductAdded() when productAdded != null:
        return productAdded(_that.product);
      case _ProductUpdated() when productUpdated != null:
        return productUpdated(_that.product);
      case _ProductDeleted() when productDeleted != null:
        return productDeleted(_that.productId, _that.workspaceId);
      case _SearchQueryChanged() when searchQueryChanged != null:
        return searchQueryChanged(_that.query);
      case _CategoryFilterChanged() when categoryFilterChanged != null:
        return categoryFilterChanged(_that.category);
      case _ProductImageUploadRequested()
          when productImageUploadRequested != null:
        return productImageUploadRequested(_that.filePath, _that.fileName);
      case _SubscriptionRequested() when subscriptionRequested != null:
        return subscriptionRequested(_that.workspaceId);
      case _RealtimeUpdateReceived() when realtimeUpdateReceived != null:
        return realtimeUpdateReceived();
      case _LoadMoreProducts() when loadMoreProducts != null:
        return loadMoreProducts(_that.workspaceId);
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
    required TResult Function(String workspaceId) productsFetched,
    required TResult Function(ProductEntity product) productAdded,
    required TResult Function(ProductEntity product) productUpdated,
    required TResult Function(String productId, String workspaceId)
        productDeleted,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function(String? category) categoryFilterChanged,
    required TResult Function(String filePath, String fileName)
        productImageUploadRequested,
    required TResult Function(String workspaceId) subscriptionRequested,
    required TResult Function() realtimeUpdateReceived,
    required TResult Function(String workspaceId) loadMoreProducts,
  }) {
    final _that = this;
    switch (_that) {
      case _ProductsFetched():
        return productsFetched(_that.workspaceId);
      case _ProductAdded():
        return productAdded(_that.product);
      case _ProductUpdated():
        return productUpdated(_that.product);
      case _ProductDeleted():
        return productDeleted(_that.productId, _that.workspaceId);
      case _SearchQueryChanged():
        return searchQueryChanged(_that.query);
      case _CategoryFilterChanged():
        return categoryFilterChanged(_that.category);
      case _ProductImageUploadRequested():
        return productImageUploadRequested(_that.filePath, _that.fileName);
      case _SubscriptionRequested():
        return subscriptionRequested(_that.workspaceId);
      case _RealtimeUpdateReceived():
        return realtimeUpdateReceived();
      case _LoadMoreProducts():
        return loadMoreProducts(_that.workspaceId);
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
    TResult? Function(String workspaceId)? productsFetched,
    TResult? Function(ProductEntity product)? productAdded,
    TResult? Function(ProductEntity product)? productUpdated,
    TResult? Function(String productId, String workspaceId)? productDeleted,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function(String? category)? categoryFilterChanged,
    TResult? Function(String filePath, String fileName)?
        productImageUploadRequested,
    TResult? Function(String workspaceId)? subscriptionRequested,
    TResult? Function()? realtimeUpdateReceived,
    TResult? Function(String workspaceId)? loadMoreProducts,
  }) {
    final _that = this;
    switch (_that) {
      case _ProductsFetched() when productsFetched != null:
        return productsFetched(_that.workspaceId);
      case _ProductAdded() when productAdded != null:
        return productAdded(_that.product);
      case _ProductUpdated() when productUpdated != null:
        return productUpdated(_that.product);
      case _ProductDeleted() when productDeleted != null:
        return productDeleted(_that.productId, _that.workspaceId);
      case _SearchQueryChanged() when searchQueryChanged != null:
        return searchQueryChanged(_that.query);
      case _CategoryFilterChanged() when categoryFilterChanged != null:
        return categoryFilterChanged(_that.category);
      case _ProductImageUploadRequested()
          when productImageUploadRequested != null:
        return productImageUploadRequested(_that.filePath, _that.fileName);
      case _SubscriptionRequested() when subscriptionRequested != null:
        return subscriptionRequested(_that.workspaceId);
      case _RealtimeUpdateReceived() when realtimeUpdateReceived != null:
        return realtimeUpdateReceived();
      case _LoadMoreProducts() when loadMoreProducts != null:
        return loadMoreProducts(_that.workspaceId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductsFetched implements InventoryEvent {
  const _ProductsFetched(this.workspaceId);

  final String workspaceId;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductsFetchedCopyWith<_ProductsFetched> get copyWith =>
      __$ProductsFetchedCopyWithImpl<_ProductsFetched>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductsFetched &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceId);

  @override
  String toString() {
    return 'InventoryEvent.productsFetched(workspaceId: $workspaceId)';
  }
}

/// @nodoc
abstract mixin class _$ProductsFetchedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory _$ProductsFetchedCopyWith(
          _ProductsFetched value, $Res Function(_ProductsFetched) _then) =
      __$ProductsFetchedCopyWithImpl;
  @useResult
  $Res call({String workspaceId});
}

/// @nodoc
class __$ProductsFetchedCopyWithImpl<$Res>
    implements _$ProductsFetchedCopyWith<$Res> {
  __$ProductsFetchedCopyWithImpl(this._self, this._then);

  final _ProductsFetched _self;
  final $Res Function(_ProductsFetched) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workspaceId = null,
  }) {
    return _then(_ProductsFetched(
      null == workspaceId
          ? _self.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _ProductAdded implements InventoryEvent {
  const _ProductAdded(this.product);

  final ProductEntity product;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductAddedCopyWith<_ProductAdded> get copyWith =>
      __$ProductAddedCopyWithImpl<_ProductAdded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductAdded &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'InventoryEvent.productAdded(product: $product)';
  }
}

/// @nodoc
abstract mixin class _$ProductAddedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory _$ProductAddedCopyWith(
          _ProductAdded value, $Res Function(_ProductAdded) _then) =
      __$ProductAddedCopyWithImpl;
  @useResult
  $Res call({ProductEntity product});

  $ProductEntityCopyWith<$Res> get product;
}

/// @nodoc
class __$ProductAddedCopyWithImpl<$Res>
    implements _$ProductAddedCopyWith<$Res> {
  __$ProductAddedCopyWithImpl(this._self, this._then);

  final _ProductAdded _self;
  final $Res Function(_ProductAdded) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(_ProductAdded(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductEntity,
    ));
  }

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductEntityCopyWith<$Res> get product {
    return $ProductEntityCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

/// @nodoc

class _ProductUpdated implements InventoryEvent {
  const _ProductUpdated(this.product);

  final ProductEntity product;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductUpdatedCopyWith<_ProductUpdated> get copyWith =>
      __$ProductUpdatedCopyWithImpl<_ProductUpdated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductUpdated &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'InventoryEvent.productUpdated(product: $product)';
  }
}

/// @nodoc
abstract mixin class _$ProductUpdatedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory _$ProductUpdatedCopyWith(
          _ProductUpdated value, $Res Function(_ProductUpdated) _then) =
      __$ProductUpdatedCopyWithImpl;
  @useResult
  $Res call({ProductEntity product});

  $ProductEntityCopyWith<$Res> get product;
}

/// @nodoc
class __$ProductUpdatedCopyWithImpl<$Res>
    implements _$ProductUpdatedCopyWith<$Res> {
  __$ProductUpdatedCopyWithImpl(this._self, this._then);

  final _ProductUpdated _self;
  final $Res Function(_ProductUpdated) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(_ProductUpdated(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductEntity,
    ));
  }

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductEntityCopyWith<$Res> get product {
    return $ProductEntityCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

/// @nodoc

class _ProductDeleted implements InventoryEvent {
  const _ProductDeleted(this.productId, this.workspaceId);

  final String productId;
  final String workspaceId;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductDeletedCopyWith<_ProductDeleted> get copyWith =>
      __$ProductDeletedCopyWithImpl<_ProductDeleted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductDeleted &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, workspaceId);

  @override
  String toString() {
    return 'InventoryEvent.productDeleted(productId: $productId, workspaceId: $workspaceId)';
  }
}

/// @nodoc
abstract mixin class _$ProductDeletedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory _$ProductDeletedCopyWith(
          _ProductDeleted value, $Res Function(_ProductDeleted) _then) =
      __$ProductDeletedCopyWithImpl;
  @useResult
  $Res call({String productId, String workspaceId});
}

/// @nodoc
class __$ProductDeletedCopyWithImpl<$Res>
    implements _$ProductDeletedCopyWith<$Res> {
  __$ProductDeletedCopyWithImpl(this._self, this._then);

  final _ProductDeleted _self;
  final $Res Function(_ProductDeleted) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
    Object? workspaceId = null,
  }) {
    return _then(_ProductDeleted(
      null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      null == workspaceId
          ? _self.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SearchQueryChanged implements InventoryEvent {
  const _SearchQueryChanged(this.query);

  final String query;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchQueryChangedCopyWith<_SearchQueryChanged> get copyWith =>
      __$SearchQueryChangedCopyWithImpl<_SearchQueryChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchQueryChanged &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'InventoryEvent.searchQueryChanged(query: $query)';
  }
}

/// @nodoc
abstract mixin class _$SearchQueryChangedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory _$SearchQueryChangedCopyWith(
          _SearchQueryChanged value, $Res Function(_SearchQueryChanged) _then) =
      __$SearchQueryChangedCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$SearchQueryChangedCopyWithImpl<$Res>
    implements _$SearchQueryChangedCopyWith<$Res> {
  __$SearchQueryChangedCopyWithImpl(this._self, this._then);

  final _SearchQueryChanged _self;
  final $Res Function(_SearchQueryChanged) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(_SearchQueryChanged(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _CategoryFilterChanged implements InventoryEvent {
  const _CategoryFilterChanged(this.category);

  final String? category;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryFilterChangedCopyWith<_CategoryFilterChanged> get copyWith =>
      __$CategoryFilterChangedCopyWithImpl<_CategoryFilterChanged>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryFilterChanged &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @override
  String toString() {
    return 'InventoryEvent.categoryFilterChanged(category: $category)';
  }
}

/// @nodoc
abstract mixin class _$CategoryFilterChangedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory _$CategoryFilterChangedCopyWith(_CategoryFilterChanged value,
          $Res Function(_CategoryFilterChanged) _then) =
      __$CategoryFilterChangedCopyWithImpl;
  @useResult
  $Res call({String? category});
}

/// @nodoc
class __$CategoryFilterChangedCopyWithImpl<$Res>
    implements _$CategoryFilterChangedCopyWith<$Res> {
  __$CategoryFilterChangedCopyWithImpl(this._self, this._then);

  final _CategoryFilterChanged _self;
  final $Res Function(_CategoryFilterChanged) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = freezed,
  }) {
    return _then(_CategoryFilterChanged(
      freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _ProductImageUploadRequested implements InventoryEvent {
  const _ProductImageUploadRequested(this.filePath, this.fileName);

  final String filePath;
  final String fileName;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductImageUploadRequestedCopyWith<_ProductImageUploadRequested>
      get copyWith => __$ProductImageUploadRequestedCopyWithImpl<
          _ProductImageUploadRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductImageUploadRequested &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath, fileName);

  @override
  String toString() {
    return 'InventoryEvent.productImageUploadRequested(filePath: $filePath, fileName: $fileName)';
  }
}

/// @nodoc
abstract mixin class _$ProductImageUploadRequestedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory _$ProductImageUploadRequestedCopyWith(
          _ProductImageUploadRequested value,
          $Res Function(_ProductImageUploadRequested) _then) =
      __$ProductImageUploadRequestedCopyWithImpl;
  @useResult
  $Res call({String filePath, String fileName});
}

/// @nodoc
class __$ProductImageUploadRequestedCopyWithImpl<$Res>
    implements _$ProductImageUploadRequestedCopyWith<$Res> {
  __$ProductImageUploadRequestedCopyWithImpl(this._self, this._then);

  final _ProductImageUploadRequested _self;
  final $Res Function(_ProductImageUploadRequested) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? filePath = null,
    Object? fileName = null,
  }) {
    return _then(_ProductImageUploadRequested(
      null == filePath
          ? _self.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      null == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SubscriptionRequested implements InventoryEvent {
  const _SubscriptionRequested(this.workspaceId);

  final String workspaceId;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionRequestedCopyWith<_SubscriptionRequested> get copyWith =>
      __$SubscriptionRequestedCopyWithImpl<_SubscriptionRequested>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionRequested &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceId);

  @override
  String toString() {
    return 'InventoryEvent.subscriptionRequested(workspaceId: $workspaceId)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionRequestedCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory _$SubscriptionRequestedCopyWith(_SubscriptionRequested value,
          $Res Function(_SubscriptionRequested) _then) =
      __$SubscriptionRequestedCopyWithImpl;
  @useResult
  $Res call({String workspaceId});
}

/// @nodoc
class __$SubscriptionRequestedCopyWithImpl<$Res>
    implements _$SubscriptionRequestedCopyWith<$Res> {
  __$SubscriptionRequestedCopyWithImpl(this._self, this._then);

  final _SubscriptionRequested _self;
  final $Res Function(_SubscriptionRequested) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workspaceId = null,
  }) {
    return _then(_SubscriptionRequested(
      null == workspaceId
          ? _self.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _RealtimeUpdateReceived implements InventoryEvent {
  const _RealtimeUpdateReceived();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RealtimeUpdateReceived);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InventoryEvent.realtimeUpdateReceived()';
  }
}

/// @nodoc

class _LoadMoreProducts implements InventoryEvent {
  const _LoadMoreProducts(this.workspaceId);

  final String workspaceId;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadMoreProductsCopyWith<_LoadMoreProducts> get copyWith =>
      __$LoadMoreProductsCopyWithImpl<_LoadMoreProducts>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadMoreProducts &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceId);

  @override
  String toString() {
    return 'InventoryEvent.loadMoreProducts(workspaceId: $workspaceId)';
  }
}

/// @nodoc
abstract mixin class _$LoadMoreProductsCopyWith<$Res>
    implements $InventoryEventCopyWith<$Res> {
  factory _$LoadMoreProductsCopyWith(
          _LoadMoreProducts value, $Res Function(_LoadMoreProducts) _then) =
      __$LoadMoreProductsCopyWithImpl;
  @useResult
  $Res call({String workspaceId});
}

/// @nodoc
class __$LoadMoreProductsCopyWithImpl<$Res>
    implements _$LoadMoreProductsCopyWith<$Res> {
  __$LoadMoreProductsCopyWithImpl(this._self, this._then);

  final _LoadMoreProducts _self;
  final $Res Function(_LoadMoreProducts) _then;

  /// Create a copy of InventoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workspaceId = null,
  }) {
    return _then(_LoadMoreProducts(
      null == workspaceId
          ? _self.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$InventoryState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InventoryState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InventoryState()';
  }
}

/// @nodoc
class $InventoryStateCopyWith<$Res> {
  $InventoryStateCopyWith(InventoryState _, $Res Function(InventoryState) __);
}

/// Adds pattern-matching-related methods to [InventoryState].
extension InventoryStatePatterns on InventoryState {
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
            List<ProductEntity> allProducts,
            List<ProductEntity> filteredProducts,
            String searchQuery,
            String? selectedCategory,
            String? lastUploadedImageUrl,
            bool isUploadingImage,
            bool hasReachedMax,
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
            _that.allProducts,
            _that.filteredProducts,
            _that.searchQuery,
            _that.selectedCategory,
            _that.lastUploadedImageUrl,
            _that.isUploadingImage,
            _that.hasReachedMax,
            _that.isLoadingMore);
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
            List<ProductEntity> allProducts,
            List<ProductEntity> filteredProducts,
            String searchQuery,
            String? selectedCategory,
            String? lastUploadedImageUrl,
            bool isUploadingImage,
            bool hasReachedMax,
            bool isLoadingMore)
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
            _that.allProducts,
            _that.filteredProducts,
            _that.searchQuery,
            _that.selectedCategory,
            _that.lastUploadedImageUrl,
            _that.isUploadingImage,
            _that.hasReachedMax,
            _that.isLoadingMore);
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
            List<ProductEntity> allProducts,
            List<ProductEntity> filteredProducts,
            String searchQuery,
            String? selectedCategory,
            String? lastUploadedImageUrl,
            bool isUploadingImage,
            bool hasReachedMax,
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
            _that.allProducts,
            _that.filteredProducts,
            _that.searchQuery,
            _that.selectedCategory,
            _that.lastUploadedImageUrl,
            _that.isUploadingImage,
            _that.hasReachedMax,
            _that.isLoadingMore);
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements InventoryState {
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
    return 'InventoryState.initial()';
  }
}

/// @nodoc

class _Loading implements InventoryState {
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
    return 'InventoryState.loading()';
  }
}

/// @nodoc

class _Loaded implements InventoryState {
  const _Loaded(
      {required final List<ProductEntity> allProducts,
      required final List<ProductEntity> filteredProducts,
      this.searchQuery = '',
      this.selectedCategory,
      this.lastUploadedImageUrl,
      this.isUploadingImage = false,
      this.hasReachedMax = false,
      this.isLoadingMore = false})
      : _allProducts = allProducts,
        _filteredProducts = filteredProducts;

  final List<ProductEntity> _allProducts;
  List<ProductEntity> get allProducts {
    if (_allProducts is EqualUnmodifiableListView) return _allProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allProducts);
  }

  final List<ProductEntity> _filteredProducts;
  List<ProductEntity> get filteredProducts {
    if (_filteredProducts is EqualUnmodifiableListView)
      return _filteredProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredProducts);
  }

  @JsonKey()
  final String searchQuery;
  final String? selectedCategory;
  final String? lastUploadedImageUrl;
  @JsonKey()
  final bool isUploadingImage;
  @JsonKey()
  final bool hasReachedMax;
  @JsonKey()
  final bool isLoadingMore;

  /// Create a copy of InventoryState
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
                .equals(other._allProducts, _allProducts) &&
            const DeepCollectionEquality()
                .equals(other._filteredProducts, _filteredProducts) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.lastUploadedImageUrl, lastUploadedImageUrl) ||
                other.lastUploadedImageUrl == lastUploadedImageUrl) &&
            (identical(other.isUploadingImage, isUploadingImage) ||
                other.isUploadingImage == isUploadingImage) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allProducts),
      const DeepCollectionEquality().hash(_filteredProducts),
      searchQuery,
      selectedCategory,
      lastUploadedImageUrl,
      isUploadingImage,
      hasReachedMax,
      isLoadingMore);

  @override
  String toString() {
    return 'InventoryState.loaded(allProducts: $allProducts, filteredProducts: $filteredProducts, searchQuery: $searchQuery, selectedCategory: $selectedCategory, lastUploadedImageUrl: $lastUploadedImageUrl, isUploadingImage: $isUploadingImage, hasReachedMax: $hasReachedMax, isLoadingMore: $isLoadingMore)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $InventoryStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call(
      {List<ProductEntity> allProducts,
      List<ProductEntity> filteredProducts,
      String searchQuery,
      String? selectedCategory,
      String? lastUploadedImageUrl,
      bool isUploadingImage,
      bool hasReachedMax,
      bool isLoadingMore});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? allProducts = null,
    Object? filteredProducts = null,
    Object? searchQuery = null,
    Object? selectedCategory = freezed,
    Object? lastUploadedImageUrl = freezed,
    Object? isUploadingImage = null,
    Object? hasReachedMax = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_Loaded(
      allProducts: null == allProducts
          ? _self._allProducts
          : allProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      filteredProducts: null == filteredProducts
          ? _self._filteredProducts
          : filteredProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCategory: freezed == selectedCategory
          ? _self.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUploadedImageUrl: freezed == lastUploadedImageUrl
          ? _self.lastUploadedImageUrl
          : lastUploadedImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isUploadingImage: null == isUploadingImage
          ? _self.isUploadingImage
          : isUploadingImage // ignore: cast_nullable_to_non_nullable
              as bool,
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

class _Error implements InventoryState {
  const _Error(this.message);

  final String message;

  /// Create a copy of InventoryState
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
    return 'InventoryState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $InventoryStateCopyWith<$Res> {
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

  /// Create a copy of InventoryState
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
