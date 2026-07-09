// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductDetailsState {

 ProductDetailsStateStatus get currState; ProductDetailsModel? get product; int? get selectedSizeId; int? get selectedColorId; bool get isWishlisted; bool get isWishlistLoading; bool get isAddingToCart; bool get addedToCart;
/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailsStateCopyWith<ProductDetailsState> get copyWith => _$ProductDetailsStateCopyWithImpl<ProductDetailsState>(this as ProductDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailsState&&(identical(other.currState, currState) || other.currState == currState)&&(identical(other.product, product) || other.product == product)&&(identical(other.selectedSizeId, selectedSizeId) || other.selectedSizeId == selectedSizeId)&&(identical(other.selectedColorId, selectedColorId) || other.selectedColorId == selectedColorId)&&(identical(other.isWishlisted, isWishlisted) || other.isWishlisted == isWishlisted)&&(identical(other.isWishlistLoading, isWishlistLoading) || other.isWishlistLoading == isWishlistLoading)&&(identical(other.isAddingToCart, isAddingToCart) || other.isAddingToCart == isAddingToCart)&&(identical(other.addedToCart, addedToCart) || other.addedToCart == addedToCart));
}


@override
int get hashCode => Object.hash(runtimeType,currState,product,selectedSizeId,selectedColorId,isWishlisted,isWishlistLoading,isAddingToCart,addedToCart);

@override
String toString() {
  return 'ProductDetailsState(currState: $currState, product: $product, selectedSizeId: $selectedSizeId, selectedColorId: $selectedColorId, isWishlisted: $isWishlisted, isWishlistLoading: $isWishlistLoading, isAddingToCart: $isAddingToCart, addedToCart: $addedToCart)';
}


}

/// @nodoc
abstract mixin class $ProductDetailsStateCopyWith<$Res>  {
  factory $ProductDetailsStateCopyWith(ProductDetailsState value, $Res Function(ProductDetailsState) _then) = _$ProductDetailsStateCopyWithImpl;
@useResult
$Res call({
 ProductDetailsStateStatus currState, ProductDetailsModel? product, int? selectedSizeId, int? selectedColorId, bool isWishlisted, bool isWishlistLoading, bool isAddingToCart, bool addedToCart
});


$ProductDetailsStateStatusCopyWith<$Res> get currState;

}
/// @nodoc
class _$ProductDetailsStateCopyWithImpl<$Res>
    implements $ProductDetailsStateCopyWith<$Res> {
  _$ProductDetailsStateCopyWithImpl(this._self, this._then);

  final ProductDetailsState _self;
  final $Res Function(ProductDetailsState) _then;

/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currState = null,Object? product = freezed,Object? selectedSizeId = freezed,Object? selectedColorId = freezed,Object? isWishlisted = null,Object? isWishlistLoading = null,Object? isAddingToCart = null,Object? addedToCart = null,}) {
  return _then(_self.copyWith(
currState: null == currState ? _self.currState : currState // ignore: cast_nullable_to_non_nullable
as ProductDetailsStateStatus,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductDetailsModel?,selectedSizeId: freezed == selectedSizeId ? _self.selectedSizeId : selectedSizeId // ignore: cast_nullable_to_non_nullable
as int?,selectedColorId: freezed == selectedColorId ? _self.selectedColorId : selectedColorId // ignore: cast_nullable_to_non_nullable
as int?,isWishlisted: null == isWishlisted ? _self.isWishlisted : isWishlisted // ignore: cast_nullable_to_non_nullable
as bool,isWishlistLoading: null == isWishlistLoading ? _self.isWishlistLoading : isWishlistLoading // ignore: cast_nullable_to_non_nullable
as bool,isAddingToCart: null == isAddingToCart ? _self.isAddingToCart : isAddingToCart // ignore: cast_nullable_to_non_nullable
as bool,addedToCart: null == addedToCart ? _self.addedToCart : addedToCart // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductDetailsStateStatusCopyWith<$Res> get currState {
  
  return $ProductDetailsStateStatusCopyWith<$Res>(_self.currState, (value) {
    return _then(_self.copyWith(currState: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductDetailsState].
extension ProductDetailsStatePatterns on ProductDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductDetailsStateStatus currState,  ProductDetailsModel? product,  int? selectedSizeId,  int? selectedColorId,  bool isWishlisted,  bool isWishlistLoading,  bool isAddingToCart,  bool addedToCart)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
return $default(_that.currState,_that.product,_that.selectedSizeId,_that.selectedColorId,_that.isWishlisted,_that.isWishlistLoading,_that.isAddingToCart,_that.addedToCart);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductDetailsStateStatus currState,  ProductDetailsModel? product,  int? selectedSizeId,  int? selectedColorId,  bool isWishlisted,  bool isWishlistLoading,  bool isAddingToCart,  bool addedToCart)  $default,) {final _that = this;
switch (_that) {
case _ProductDetailsState():
return $default(_that.currState,_that.product,_that.selectedSizeId,_that.selectedColorId,_that.isWishlisted,_that.isWishlistLoading,_that.isAddingToCart,_that.addedToCart);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductDetailsStateStatus currState,  ProductDetailsModel? product,  int? selectedSizeId,  int? selectedColorId,  bool isWishlisted,  bool isWishlistLoading,  bool isAddingToCart,  bool addedToCart)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
return $default(_that.currState,_that.product,_that.selectedSizeId,_that.selectedColorId,_that.isWishlisted,_that.isWishlistLoading,_that.isAddingToCart,_that.addedToCart);case _:
  return null;

}
}

}

/// @nodoc


class _ProductDetailsState implements ProductDetailsState {
  const _ProductDetailsState({this.currState = const ProductDetailsStateStatus.initial(), this.product, this.selectedSizeId = null, this.selectedColorId = null, this.isWishlisted = false, this.isWishlistLoading = false, this.isAddingToCart = false, this.addedToCart = false});
  

@override@JsonKey() final  ProductDetailsStateStatus currState;
@override final  ProductDetailsModel? product;
@override@JsonKey() final  int? selectedSizeId;
@override@JsonKey() final  int? selectedColorId;
@override@JsonKey() final  bool isWishlisted;
@override@JsonKey() final  bool isWishlistLoading;
@override@JsonKey() final  bool isAddingToCart;
@override@JsonKey() final  bool addedToCart;

/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailsStateCopyWith<_ProductDetailsState> get copyWith => __$ProductDetailsStateCopyWithImpl<_ProductDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailsState&&(identical(other.currState, currState) || other.currState == currState)&&(identical(other.product, product) || other.product == product)&&(identical(other.selectedSizeId, selectedSizeId) || other.selectedSizeId == selectedSizeId)&&(identical(other.selectedColorId, selectedColorId) || other.selectedColorId == selectedColorId)&&(identical(other.isWishlisted, isWishlisted) || other.isWishlisted == isWishlisted)&&(identical(other.isWishlistLoading, isWishlistLoading) || other.isWishlistLoading == isWishlistLoading)&&(identical(other.isAddingToCart, isAddingToCart) || other.isAddingToCart == isAddingToCart)&&(identical(other.addedToCart, addedToCart) || other.addedToCart == addedToCart));
}


@override
int get hashCode => Object.hash(runtimeType,currState,product,selectedSizeId,selectedColorId,isWishlisted,isWishlistLoading,isAddingToCart,addedToCart);

@override
String toString() {
  return 'ProductDetailsState(currState: $currState, product: $product, selectedSizeId: $selectedSizeId, selectedColorId: $selectedColorId, isWishlisted: $isWishlisted, isWishlistLoading: $isWishlistLoading, isAddingToCart: $isAddingToCart, addedToCart: $addedToCart)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailsStateCopyWith<$Res> implements $ProductDetailsStateCopyWith<$Res> {
  factory _$ProductDetailsStateCopyWith(_ProductDetailsState value, $Res Function(_ProductDetailsState) _then) = __$ProductDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 ProductDetailsStateStatus currState, ProductDetailsModel? product, int? selectedSizeId, int? selectedColorId, bool isWishlisted, bool isWishlistLoading, bool isAddingToCart, bool addedToCart
});


@override $ProductDetailsStateStatusCopyWith<$Res> get currState;

}
/// @nodoc
class __$ProductDetailsStateCopyWithImpl<$Res>
    implements _$ProductDetailsStateCopyWith<$Res> {
  __$ProductDetailsStateCopyWithImpl(this._self, this._then);

  final _ProductDetailsState _self;
  final $Res Function(_ProductDetailsState) _then;

/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currState = null,Object? product = freezed,Object? selectedSizeId = freezed,Object? selectedColorId = freezed,Object? isWishlisted = null,Object? isWishlistLoading = null,Object? isAddingToCart = null,Object? addedToCart = null,}) {
  return _then(_ProductDetailsState(
currState: null == currState ? _self.currState : currState // ignore: cast_nullable_to_non_nullable
as ProductDetailsStateStatus,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductDetailsModel?,selectedSizeId: freezed == selectedSizeId ? _self.selectedSizeId : selectedSizeId // ignore: cast_nullable_to_non_nullable
as int?,selectedColorId: freezed == selectedColorId ? _self.selectedColorId : selectedColorId // ignore: cast_nullable_to_non_nullable
as int?,isWishlisted: null == isWishlisted ? _self.isWishlisted : isWishlisted // ignore: cast_nullable_to_non_nullable
as bool,isWishlistLoading: null == isWishlistLoading ? _self.isWishlistLoading : isWishlistLoading // ignore: cast_nullable_to_non_nullable
as bool,isAddingToCart: null == isAddingToCart ? _self.isAddingToCart : isAddingToCart // ignore: cast_nullable_to_non_nullable
as bool,addedToCart: null == addedToCart ? _self.addedToCart : addedToCart // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductDetailsStateStatusCopyWith<$Res> get currState {
  
  return $ProductDetailsStateStatusCopyWith<$Res>(_self.currState, (value) {
    return _then(_self.copyWith(currState: value));
  });
}
}

/// @nodoc
mixin _$ProductDetailsStateStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailsStateStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailsStateStatus()';
}


}

/// @nodoc
class $ProductDetailsStateStatusCopyWith<$Res>  {
$ProductDetailsStateStatusCopyWith(ProductDetailsStateStatus _, $Res Function(ProductDetailsStateStatus) __);
}


/// Adds pattern-matching-related methods to [ProductDetailsStateStatus].
extension ProductDetailsStateStatusPatterns on ProductDetailsStateStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PDInitial value)?  initial,TResult Function( PDLoading value)?  loading,TResult Function( PDError value)?  error,TResult Function( PDSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PDInitial() when initial != null:
return initial(_that);case PDLoading() when loading != null:
return loading(_that);case PDError() when error != null:
return error(_that);case PDSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PDInitial value)  initial,required TResult Function( PDLoading value)  loading,required TResult Function( PDError value)  error,required TResult Function( PDSuccess value)  success,}){
final _that = this;
switch (_that) {
case PDInitial():
return initial(_that);case PDLoading():
return loading(_that);case PDError():
return error(_that);case PDSuccess():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PDInitial value)?  initial,TResult? Function( PDLoading value)?  loading,TResult? Function( PDError value)?  error,TResult? Function( PDSuccess value)?  success,}){
final _that = this;
switch (_that) {
case PDInitial() when initial != null:
return initial(_that);case PDLoading() when loading != null:
return loading(_that);case PDError() when error != null:
return error(_that);case PDSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  error,TResult Function()?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PDInitial() when initial != null:
return initial();case PDLoading() when loading != null:
return loading();case PDError() when error != null:
return error();case PDSuccess() when success != null:
return success();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  error,required TResult Function()  success,}) {final _that = this;
switch (_that) {
case PDInitial():
return initial();case PDLoading():
return loading();case PDError():
return error();case PDSuccess():
return success();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  error,TResult? Function()?  success,}) {final _that = this;
switch (_that) {
case PDInitial() when initial != null:
return initial();case PDLoading() when loading != null:
return loading();case PDError() when error != null:
return error();case PDSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class PDInitial implements ProductDetailsStateStatus {
  const PDInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PDInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailsStateStatus.initial()';
}


}




/// @nodoc


class PDLoading implements ProductDetailsStateStatus {
  const PDLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PDLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailsStateStatus.loading()';
}


}




/// @nodoc


class PDError implements ProductDetailsStateStatus {
  const PDError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PDError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailsStateStatus.error()';
}


}




/// @nodoc


class PDSuccess implements ProductDetailsStateStatus {
  const PDSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PDSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailsStateStatus.success()';
}


}




// dart format on
