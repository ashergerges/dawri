// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreState {

 int get cartCount; RefreshController get refreshController; bool get isCategoriesLoading; List<CategoryModel> get categories; int? get selectedCategoryId; String get search; bool get isProductsLoading; List<ProductModel> get products; int get currentPage; bool get hasMore; String? get generalErrorKey;
/// Create a copy of StoreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreStateCopyWith<StoreState> get copyWith => _$StoreStateCopyWithImpl<StoreState>(this as StoreState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreState&&(identical(other.cartCount, cartCount) || other.cartCount == cartCount)&&(identical(other.refreshController, refreshController) || other.refreshController == refreshController)&&(identical(other.isCategoriesLoading, isCategoriesLoading) || other.isCategoriesLoading == isCategoriesLoading)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.search, search) || other.search == search)&&(identical(other.isProductsLoading, isProductsLoading) || other.isProductsLoading == isProductsLoading)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.generalErrorKey, generalErrorKey) || other.generalErrorKey == generalErrorKey));
}


@override
int get hashCode => Object.hash(runtimeType,cartCount,refreshController,isCategoriesLoading,const DeepCollectionEquality().hash(categories),selectedCategoryId,search,isProductsLoading,const DeepCollectionEquality().hash(products),currentPage,hasMore,generalErrorKey);

@override
String toString() {
  return 'StoreState(cartCount: $cartCount, refreshController: $refreshController, isCategoriesLoading: $isCategoriesLoading, categories: $categories, selectedCategoryId: $selectedCategoryId, search: $search, isProductsLoading: $isProductsLoading, products: $products, currentPage: $currentPage, hasMore: $hasMore, generalErrorKey: $generalErrorKey)';
}


}

/// @nodoc
abstract mixin class $StoreStateCopyWith<$Res>  {
  factory $StoreStateCopyWith(StoreState value, $Res Function(StoreState) _then) = _$StoreStateCopyWithImpl;
@useResult
$Res call({
 int cartCount, RefreshController refreshController, bool isCategoriesLoading, List<CategoryModel> categories, int? selectedCategoryId, String search, bool isProductsLoading, List<ProductModel> products, int currentPage, bool hasMore, String? generalErrorKey
});




}
/// @nodoc
class _$StoreStateCopyWithImpl<$Res>
    implements $StoreStateCopyWith<$Res> {
  _$StoreStateCopyWithImpl(this._self, this._then);

  final StoreState _self;
  final $Res Function(StoreState) _then;

/// Create a copy of StoreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cartCount = null,Object? refreshController = null,Object? isCategoriesLoading = null,Object? categories = null,Object? selectedCategoryId = freezed,Object? search = null,Object? isProductsLoading = null,Object? products = null,Object? currentPage = null,Object? hasMore = null,Object? generalErrorKey = freezed,}) {
  return _then(_self.copyWith(
cartCount: null == cartCount ? _self.cartCount : cartCount // ignore: cast_nullable_to_non_nullable
as int,refreshController: null == refreshController ? _self.refreshController : refreshController // ignore: cast_nullable_to_non_nullable
as RefreshController,isCategoriesLoading: null == isCategoriesLoading ? _self.isCategoriesLoading : isCategoriesLoading // ignore: cast_nullable_to_non_nullable
as bool,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as int?,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,isProductsLoading: null == isProductsLoading ? _self.isProductsLoading : isProductsLoading // ignore: cast_nullable_to_non_nullable
as bool,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,generalErrorKey: freezed == generalErrorKey ? _self.generalErrorKey : generalErrorKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreState].
extension StoreStatePatterns on StoreState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreState value)  $default,){
final _that = this;
switch (_that) {
case _StoreState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreState value)?  $default,){
final _that = this;
switch (_that) {
case _StoreState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int cartCount,  RefreshController refreshController,  bool isCategoriesLoading,  List<CategoryModel> categories,  int? selectedCategoryId,  String search,  bool isProductsLoading,  List<ProductModel> products,  int currentPage,  bool hasMore,  String? generalErrorKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreState() when $default != null:
return $default(_that.cartCount,_that.refreshController,_that.isCategoriesLoading,_that.categories,_that.selectedCategoryId,_that.search,_that.isProductsLoading,_that.products,_that.currentPage,_that.hasMore,_that.generalErrorKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int cartCount,  RefreshController refreshController,  bool isCategoriesLoading,  List<CategoryModel> categories,  int? selectedCategoryId,  String search,  bool isProductsLoading,  List<ProductModel> products,  int currentPage,  bool hasMore,  String? generalErrorKey)  $default,) {final _that = this;
switch (_that) {
case _StoreState():
return $default(_that.cartCount,_that.refreshController,_that.isCategoriesLoading,_that.categories,_that.selectedCategoryId,_that.search,_that.isProductsLoading,_that.products,_that.currentPage,_that.hasMore,_that.generalErrorKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int cartCount,  RefreshController refreshController,  bool isCategoriesLoading,  List<CategoryModel> categories,  int? selectedCategoryId,  String search,  bool isProductsLoading,  List<ProductModel> products,  int currentPage,  bool hasMore,  String? generalErrorKey)?  $default,) {final _that = this;
switch (_that) {
case _StoreState() when $default != null:
return $default(_that.cartCount,_that.refreshController,_that.isCategoriesLoading,_that.categories,_that.selectedCategoryId,_that.search,_that.isProductsLoading,_that.products,_that.currentPage,_that.hasMore,_that.generalErrorKey);case _:
  return null;

}
}

}

/// @nodoc


class _StoreState implements StoreState {
  const _StoreState({this.cartCount = 0, required this.refreshController, this.isCategoriesLoading = false, final  List<CategoryModel> categories = const [], this.selectedCategoryId = null, this.search = '', this.isProductsLoading = true, final  List<ProductModel> products = const [], this.currentPage = 1, this.hasMore = false, this.generalErrorKey = null}): _categories = categories,_products = products;
  

@override@JsonKey() final  int cartCount;
@override final  RefreshController refreshController;
@override@JsonKey() final  bool isCategoriesLoading;
 final  List<CategoryModel> _categories;
@override@JsonKey() List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override@JsonKey() final  int? selectedCategoryId;
@override@JsonKey() final  String search;
@override@JsonKey() final  bool isProductsLoading;
 final  List<ProductModel> _products;
@override@JsonKey() List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  String? generalErrorKey;

/// Create a copy of StoreState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreStateCopyWith<_StoreState> get copyWith => __$StoreStateCopyWithImpl<_StoreState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreState&&(identical(other.cartCount, cartCount) || other.cartCount == cartCount)&&(identical(other.refreshController, refreshController) || other.refreshController == refreshController)&&(identical(other.isCategoriesLoading, isCategoriesLoading) || other.isCategoriesLoading == isCategoriesLoading)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.search, search) || other.search == search)&&(identical(other.isProductsLoading, isProductsLoading) || other.isProductsLoading == isProductsLoading)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.generalErrorKey, generalErrorKey) || other.generalErrorKey == generalErrorKey));
}


@override
int get hashCode => Object.hash(runtimeType,cartCount,refreshController,isCategoriesLoading,const DeepCollectionEquality().hash(_categories),selectedCategoryId,search,isProductsLoading,const DeepCollectionEquality().hash(_products),currentPage,hasMore,generalErrorKey);

@override
String toString() {
  return 'StoreState(cartCount: $cartCount, refreshController: $refreshController, isCategoriesLoading: $isCategoriesLoading, categories: $categories, selectedCategoryId: $selectedCategoryId, search: $search, isProductsLoading: $isProductsLoading, products: $products, currentPage: $currentPage, hasMore: $hasMore, generalErrorKey: $generalErrorKey)';
}


}

/// @nodoc
abstract mixin class _$StoreStateCopyWith<$Res> implements $StoreStateCopyWith<$Res> {
  factory _$StoreStateCopyWith(_StoreState value, $Res Function(_StoreState) _then) = __$StoreStateCopyWithImpl;
@override @useResult
$Res call({
 int cartCount, RefreshController refreshController, bool isCategoriesLoading, List<CategoryModel> categories, int? selectedCategoryId, String search, bool isProductsLoading, List<ProductModel> products, int currentPage, bool hasMore, String? generalErrorKey
});




}
/// @nodoc
class __$StoreStateCopyWithImpl<$Res>
    implements _$StoreStateCopyWith<$Res> {
  __$StoreStateCopyWithImpl(this._self, this._then);

  final _StoreState _self;
  final $Res Function(_StoreState) _then;

/// Create a copy of StoreState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cartCount = null,Object? refreshController = null,Object? isCategoriesLoading = null,Object? categories = null,Object? selectedCategoryId = freezed,Object? search = null,Object? isProductsLoading = null,Object? products = null,Object? currentPage = null,Object? hasMore = null,Object? generalErrorKey = freezed,}) {
  return _then(_StoreState(
cartCount: null == cartCount ? _self.cartCount : cartCount // ignore: cast_nullable_to_non_nullable
as int,refreshController: null == refreshController ? _self.refreshController : refreshController // ignore: cast_nullable_to_non_nullable
as RefreshController,isCategoriesLoading: null == isCategoriesLoading ? _self.isCategoriesLoading : isCategoriesLoading // ignore: cast_nullable_to_non_nullable
as bool,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as int?,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,isProductsLoading: null == isProductsLoading ? _self.isProductsLoading : isProductsLoading // ignore: cast_nullable_to_non_nullable
as bool,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,generalErrorKey: freezed == generalErrorKey ? _self.generalErrorKey : generalErrorKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
