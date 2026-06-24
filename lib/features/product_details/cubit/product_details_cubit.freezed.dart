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

 int get selectedSizeIndex; bool get isWishlisted; bool get addedToCart;
/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailsStateCopyWith<ProductDetailsState> get copyWith => _$ProductDetailsStateCopyWithImpl<ProductDetailsState>(this as ProductDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailsState&&(identical(other.selectedSizeIndex, selectedSizeIndex) || other.selectedSizeIndex == selectedSizeIndex)&&(identical(other.isWishlisted, isWishlisted) || other.isWishlisted == isWishlisted)&&(identical(other.addedToCart, addedToCart) || other.addedToCart == addedToCart));
}


@override
int get hashCode => Object.hash(runtimeType,selectedSizeIndex,isWishlisted,addedToCart);

@override
String toString() {
  return 'ProductDetailsState(selectedSizeIndex: $selectedSizeIndex, isWishlisted: $isWishlisted, addedToCart: $addedToCart)';
}


}

/// @nodoc
abstract mixin class $ProductDetailsStateCopyWith<$Res>  {
  factory $ProductDetailsStateCopyWith(ProductDetailsState value, $Res Function(ProductDetailsState) _then) = _$ProductDetailsStateCopyWithImpl;
@useResult
$Res call({
 int selectedSizeIndex, bool isWishlisted, bool addedToCart
});




}
/// @nodoc
class _$ProductDetailsStateCopyWithImpl<$Res>
    implements $ProductDetailsStateCopyWith<$Res> {
  _$ProductDetailsStateCopyWithImpl(this._self, this._then);

  final ProductDetailsState _self;
  final $Res Function(ProductDetailsState) _then;

/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedSizeIndex = null,Object? isWishlisted = null,Object? addedToCart = null,}) {
  return _then(_self.copyWith(
selectedSizeIndex: null == selectedSizeIndex ? _self.selectedSizeIndex : selectedSizeIndex // ignore: cast_nullable_to_non_nullable
as int,isWishlisted: null == isWishlisted ? _self.isWishlisted : isWishlisted // ignore: cast_nullable_to_non_nullable
as bool,addedToCart: null == addedToCart ? _self.addedToCart : addedToCart // ignore: cast_nullable_to_non_nullable
as bool,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int selectedSizeIndex,  bool isWishlisted,  bool addedToCart)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
return $default(_that.selectedSizeIndex,_that.isWishlisted,_that.addedToCart);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int selectedSizeIndex,  bool isWishlisted,  bool addedToCart)  $default,) {final _that = this;
switch (_that) {
case _ProductDetailsState():
return $default(_that.selectedSizeIndex,_that.isWishlisted,_that.addedToCart);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int selectedSizeIndex,  bool isWishlisted,  bool addedToCart)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
return $default(_that.selectedSizeIndex,_that.isWishlisted,_that.addedToCart);case _:
  return null;

}
}

}

/// @nodoc


class _ProductDetailsState implements ProductDetailsState {
  const _ProductDetailsState({this.selectedSizeIndex = ProductDetailsMockData.defaultSizeIndex, this.isWishlisted = false, this.addedToCart = false});
  

@override@JsonKey() final  int selectedSizeIndex;
@override@JsonKey() final  bool isWishlisted;
@override@JsonKey() final  bool addedToCart;

/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailsStateCopyWith<_ProductDetailsState> get copyWith => __$ProductDetailsStateCopyWithImpl<_ProductDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailsState&&(identical(other.selectedSizeIndex, selectedSizeIndex) || other.selectedSizeIndex == selectedSizeIndex)&&(identical(other.isWishlisted, isWishlisted) || other.isWishlisted == isWishlisted)&&(identical(other.addedToCart, addedToCart) || other.addedToCart == addedToCart));
}


@override
int get hashCode => Object.hash(runtimeType,selectedSizeIndex,isWishlisted,addedToCart);

@override
String toString() {
  return 'ProductDetailsState(selectedSizeIndex: $selectedSizeIndex, isWishlisted: $isWishlisted, addedToCart: $addedToCart)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailsStateCopyWith<$Res> implements $ProductDetailsStateCopyWith<$Res> {
  factory _$ProductDetailsStateCopyWith(_ProductDetailsState value, $Res Function(_ProductDetailsState) _then) = __$ProductDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedSizeIndex, bool isWishlisted, bool addedToCart
});




}
/// @nodoc
class __$ProductDetailsStateCopyWithImpl<$Res>
    implements _$ProductDetailsStateCopyWith<$Res> {
  __$ProductDetailsStateCopyWithImpl(this._self, this._then);

  final _ProductDetailsState _self;
  final $Res Function(_ProductDetailsState) _then;

/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedSizeIndex = null,Object? isWishlisted = null,Object? addedToCart = null,}) {
  return _then(_ProductDetailsState(
selectedSizeIndex: null == selectedSizeIndex ? _self.selectedSizeIndex : selectedSizeIndex // ignore: cast_nullable_to_non_nullable
as int,isWishlisted: null == isWishlisted ? _self.isWishlisted : isWishlisted // ignore: cast_nullable_to_non_nullable
as bool,addedToCart: null == addedToCart ? _self.addedToCart : addedToCart // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
