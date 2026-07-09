// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartState {

 CartStateStatus get currState; List<CartItemModel> get items; bool get isCheckoutLoading; bool get isCheckoutSuccess;// ── Coupon ──
 bool get isCouponLoading; bool get isCouponApplied; String? get appliedCouponCode; String? get couponPercentage; num get discountAmount; num? get apiCartTotal; num? get apiFinalTotal; String? get couponErrorKey;
/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartStateCopyWith<CartState> get copyWith => _$CartStateCopyWithImpl<CartState>(this as CartState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState&&(identical(other.currState, currState) || other.currState == currState)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.isCheckoutLoading, isCheckoutLoading) || other.isCheckoutLoading == isCheckoutLoading)&&(identical(other.isCheckoutSuccess, isCheckoutSuccess) || other.isCheckoutSuccess == isCheckoutSuccess)&&(identical(other.isCouponLoading, isCouponLoading) || other.isCouponLoading == isCouponLoading)&&(identical(other.isCouponApplied, isCouponApplied) || other.isCouponApplied == isCouponApplied)&&(identical(other.appliedCouponCode, appliedCouponCode) || other.appliedCouponCode == appliedCouponCode)&&(identical(other.couponPercentage, couponPercentage) || other.couponPercentage == couponPercentage)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.apiCartTotal, apiCartTotal) || other.apiCartTotal == apiCartTotal)&&(identical(other.apiFinalTotal, apiFinalTotal) || other.apiFinalTotal == apiFinalTotal)&&(identical(other.couponErrorKey, couponErrorKey) || other.couponErrorKey == couponErrorKey));
}


@override
int get hashCode => Object.hash(runtimeType,currState,const DeepCollectionEquality().hash(items),isCheckoutLoading,isCheckoutSuccess,isCouponLoading,isCouponApplied,appliedCouponCode,couponPercentage,discountAmount,apiCartTotal,apiFinalTotal,couponErrorKey);

@override
String toString() {
  return 'CartState(currState: $currState, items: $items, isCheckoutLoading: $isCheckoutLoading, isCheckoutSuccess: $isCheckoutSuccess, isCouponLoading: $isCouponLoading, isCouponApplied: $isCouponApplied, appliedCouponCode: $appliedCouponCode, couponPercentage: $couponPercentage, discountAmount: $discountAmount, apiCartTotal: $apiCartTotal, apiFinalTotal: $apiFinalTotal, couponErrorKey: $couponErrorKey)';
}


}

/// @nodoc
abstract mixin class $CartStateCopyWith<$Res>  {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) _then) = _$CartStateCopyWithImpl;
@useResult
$Res call({
 CartStateStatus currState, List<CartItemModel> items, bool isCheckoutLoading, bool isCheckoutSuccess, bool isCouponLoading, bool isCouponApplied, String? appliedCouponCode, String? couponPercentage, num discountAmount, num? apiCartTotal, num? apiFinalTotal, String? couponErrorKey
});


$CartStateStatusCopyWith<$Res> get currState;

}
/// @nodoc
class _$CartStateCopyWithImpl<$Res>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._self, this._then);

  final CartState _self;
  final $Res Function(CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currState = null,Object? items = null,Object? isCheckoutLoading = null,Object? isCheckoutSuccess = null,Object? isCouponLoading = null,Object? isCouponApplied = null,Object? appliedCouponCode = freezed,Object? couponPercentage = freezed,Object? discountAmount = null,Object? apiCartTotal = freezed,Object? apiFinalTotal = freezed,Object? couponErrorKey = freezed,}) {
  return _then(_self.copyWith(
currState: null == currState ? _self.currState : currState // ignore: cast_nullable_to_non_nullable
as CartStateStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemModel>,isCheckoutLoading: null == isCheckoutLoading ? _self.isCheckoutLoading : isCheckoutLoading // ignore: cast_nullable_to_non_nullable
as bool,isCheckoutSuccess: null == isCheckoutSuccess ? _self.isCheckoutSuccess : isCheckoutSuccess // ignore: cast_nullable_to_non_nullable
as bool,isCouponLoading: null == isCouponLoading ? _self.isCouponLoading : isCouponLoading // ignore: cast_nullable_to_non_nullable
as bool,isCouponApplied: null == isCouponApplied ? _self.isCouponApplied : isCouponApplied // ignore: cast_nullable_to_non_nullable
as bool,appliedCouponCode: freezed == appliedCouponCode ? _self.appliedCouponCode : appliedCouponCode // ignore: cast_nullable_to_non_nullable
as String?,couponPercentage: freezed == couponPercentage ? _self.couponPercentage : couponPercentage // ignore: cast_nullable_to_non_nullable
as String?,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as num,apiCartTotal: freezed == apiCartTotal ? _self.apiCartTotal : apiCartTotal // ignore: cast_nullable_to_non_nullable
as num?,apiFinalTotal: freezed == apiFinalTotal ? _self.apiFinalTotal : apiFinalTotal // ignore: cast_nullable_to_non_nullable
as num?,couponErrorKey: freezed == couponErrorKey ? _self.couponErrorKey : couponErrorKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartStateStatusCopyWith<$Res> get currState {
  
  return $CartStateStatusCopyWith<$Res>(_self.currState, (value) {
    return _then(_self.copyWith(currState: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartState value)  $default,){
final _that = this;
switch (_that) {
case _CartState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartState value)?  $default,){
final _that = this;
switch (_that) {
case _CartState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CartStateStatus currState,  List<CartItemModel> items,  bool isCheckoutLoading,  bool isCheckoutSuccess,  bool isCouponLoading,  bool isCouponApplied,  String? appliedCouponCode,  String? couponPercentage,  num discountAmount,  num? apiCartTotal,  num? apiFinalTotal,  String? couponErrorKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartState() when $default != null:
return $default(_that.currState,_that.items,_that.isCheckoutLoading,_that.isCheckoutSuccess,_that.isCouponLoading,_that.isCouponApplied,_that.appliedCouponCode,_that.couponPercentage,_that.discountAmount,_that.apiCartTotal,_that.apiFinalTotal,_that.couponErrorKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CartStateStatus currState,  List<CartItemModel> items,  bool isCheckoutLoading,  bool isCheckoutSuccess,  bool isCouponLoading,  bool isCouponApplied,  String? appliedCouponCode,  String? couponPercentage,  num discountAmount,  num? apiCartTotal,  num? apiFinalTotal,  String? couponErrorKey)  $default,) {final _that = this;
switch (_that) {
case _CartState():
return $default(_that.currState,_that.items,_that.isCheckoutLoading,_that.isCheckoutSuccess,_that.isCouponLoading,_that.isCouponApplied,_that.appliedCouponCode,_that.couponPercentage,_that.discountAmount,_that.apiCartTotal,_that.apiFinalTotal,_that.couponErrorKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CartStateStatus currState,  List<CartItemModel> items,  bool isCheckoutLoading,  bool isCheckoutSuccess,  bool isCouponLoading,  bool isCouponApplied,  String? appliedCouponCode,  String? couponPercentage,  num discountAmount,  num? apiCartTotal,  num? apiFinalTotal,  String? couponErrorKey)?  $default,) {final _that = this;
switch (_that) {
case _CartState() when $default != null:
return $default(_that.currState,_that.items,_that.isCheckoutLoading,_that.isCheckoutSuccess,_that.isCouponLoading,_that.isCouponApplied,_that.appliedCouponCode,_that.couponPercentage,_that.discountAmount,_that.apiCartTotal,_that.apiFinalTotal,_that.couponErrorKey);case _:
  return null;

}
}

}

/// @nodoc


class _CartState implements CartState {
  const _CartState({this.currState = const CartStateStatus.initial(), final  List<CartItemModel> items = const [], this.isCheckoutLoading = false, this.isCheckoutSuccess = false, this.isCouponLoading = false, this.isCouponApplied = false, this.appliedCouponCode = null, this.couponPercentage = null, this.discountAmount = 0, this.apiCartTotal = null, this.apiFinalTotal = null, this.couponErrorKey = null}): _items = items;
  

@override@JsonKey() final  CartStateStatus currState;
 final  List<CartItemModel> _items;
@override@JsonKey() List<CartItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool isCheckoutLoading;
@override@JsonKey() final  bool isCheckoutSuccess;
// ── Coupon ──
@override@JsonKey() final  bool isCouponLoading;
@override@JsonKey() final  bool isCouponApplied;
@override@JsonKey() final  String? appliedCouponCode;
@override@JsonKey() final  String? couponPercentage;
@override@JsonKey() final  num discountAmount;
@override@JsonKey() final  num? apiCartTotal;
@override@JsonKey() final  num? apiFinalTotal;
@override@JsonKey() final  String? couponErrorKey;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartStateCopyWith<_CartState> get copyWith => __$CartStateCopyWithImpl<_CartState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartState&&(identical(other.currState, currState) || other.currState == currState)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.isCheckoutLoading, isCheckoutLoading) || other.isCheckoutLoading == isCheckoutLoading)&&(identical(other.isCheckoutSuccess, isCheckoutSuccess) || other.isCheckoutSuccess == isCheckoutSuccess)&&(identical(other.isCouponLoading, isCouponLoading) || other.isCouponLoading == isCouponLoading)&&(identical(other.isCouponApplied, isCouponApplied) || other.isCouponApplied == isCouponApplied)&&(identical(other.appliedCouponCode, appliedCouponCode) || other.appliedCouponCode == appliedCouponCode)&&(identical(other.couponPercentage, couponPercentage) || other.couponPercentage == couponPercentage)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.apiCartTotal, apiCartTotal) || other.apiCartTotal == apiCartTotal)&&(identical(other.apiFinalTotal, apiFinalTotal) || other.apiFinalTotal == apiFinalTotal)&&(identical(other.couponErrorKey, couponErrorKey) || other.couponErrorKey == couponErrorKey));
}


@override
int get hashCode => Object.hash(runtimeType,currState,const DeepCollectionEquality().hash(_items),isCheckoutLoading,isCheckoutSuccess,isCouponLoading,isCouponApplied,appliedCouponCode,couponPercentage,discountAmount,apiCartTotal,apiFinalTotal,couponErrorKey);

@override
String toString() {
  return 'CartState(currState: $currState, items: $items, isCheckoutLoading: $isCheckoutLoading, isCheckoutSuccess: $isCheckoutSuccess, isCouponLoading: $isCouponLoading, isCouponApplied: $isCouponApplied, appliedCouponCode: $appliedCouponCode, couponPercentage: $couponPercentage, discountAmount: $discountAmount, apiCartTotal: $apiCartTotal, apiFinalTotal: $apiFinalTotal, couponErrorKey: $couponErrorKey)';
}


}

/// @nodoc
abstract mixin class _$CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$CartStateCopyWith(_CartState value, $Res Function(_CartState) _then) = __$CartStateCopyWithImpl;
@override @useResult
$Res call({
 CartStateStatus currState, List<CartItemModel> items, bool isCheckoutLoading, bool isCheckoutSuccess, bool isCouponLoading, bool isCouponApplied, String? appliedCouponCode, String? couponPercentage, num discountAmount, num? apiCartTotal, num? apiFinalTotal, String? couponErrorKey
});


@override $CartStateStatusCopyWith<$Res> get currState;

}
/// @nodoc
class __$CartStateCopyWithImpl<$Res>
    implements _$CartStateCopyWith<$Res> {
  __$CartStateCopyWithImpl(this._self, this._then);

  final _CartState _self;
  final $Res Function(_CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currState = null,Object? items = null,Object? isCheckoutLoading = null,Object? isCheckoutSuccess = null,Object? isCouponLoading = null,Object? isCouponApplied = null,Object? appliedCouponCode = freezed,Object? couponPercentage = freezed,Object? discountAmount = null,Object? apiCartTotal = freezed,Object? apiFinalTotal = freezed,Object? couponErrorKey = freezed,}) {
  return _then(_CartState(
currState: null == currState ? _self.currState : currState // ignore: cast_nullable_to_non_nullable
as CartStateStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemModel>,isCheckoutLoading: null == isCheckoutLoading ? _self.isCheckoutLoading : isCheckoutLoading // ignore: cast_nullable_to_non_nullable
as bool,isCheckoutSuccess: null == isCheckoutSuccess ? _self.isCheckoutSuccess : isCheckoutSuccess // ignore: cast_nullable_to_non_nullable
as bool,isCouponLoading: null == isCouponLoading ? _self.isCouponLoading : isCouponLoading // ignore: cast_nullable_to_non_nullable
as bool,isCouponApplied: null == isCouponApplied ? _self.isCouponApplied : isCouponApplied // ignore: cast_nullable_to_non_nullable
as bool,appliedCouponCode: freezed == appliedCouponCode ? _self.appliedCouponCode : appliedCouponCode // ignore: cast_nullable_to_non_nullable
as String?,couponPercentage: freezed == couponPercentage ? _self.couponPercentage : couponPercentage // ignore: cast_nullable_to_non_nullable
as String?,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as num,apiCartTotal: freezed == apiCartTotal ? _self.apiCartTotal : apiCartTotal // ignore: cast_nullable_to_non_nullable
as num?,apiFinalTotal: freezed == apiFinalTotal ? _self.apiFinalTotal : apiFinalTotal // ignore: cast_nullable_to_non_nullable
as num?,couponErrorKey: freezed == couponErrorKey ? _self.couponErrorKey : couponErrorKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartStateStatusCopyWith<$Res> get currState {
  
  return $CartStateStatusCopyWith<$Res>(_self.currState, (value) {
    return _then(_self.copyWith(currState: value));
  });
}
}

/// @nodoc
mixin _$CartStateStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartStateStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartStateStatus()';
}


}

/// @nodoc
class $CartStateStatusCopyWith<$Res>  {
$CartStateStatusCopyWith(CartStateStatus _, $Res Function(CartStateStatus) __);
}


/// Adds pattern-matching-related methods to [CartStateStatus].
extension CartStateStatusPatterns on CartStateStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CartInitial value)?  initial,TResult Function( CartLoading value)?  loading,TResult Function( CartError value)?  error,TResult Function( CartSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CartInitial() when initial != null:
return initial(_that);case CartLoading() when loading != null:
return loading(_that);case CartError() when error != null:
return error(_that);case CartSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CartInitial value)  initial,required TResult Function( CartLoading value)  loading,required TResult Function( CartError value)  error,required TResult Function( CartSuccess value)  success,}){
final _that = this;
switch (_that) {
case CartInitial():
return initial(_that);case CartLoading():
return loading(_that);case CartError():
return error(_that);case CartSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CartInitial value)?  initial,TResult? Function( CartLoading value)?  loading,TResult? Function( CartError value)?  error,TResult? Function( CartSuccess value)?  success,}){
final _that = this;
switch (_that) {
case CartInitial() when initial != null:
return initial(_that);case CartLoading() when loading != null:
return loading(_that);case CartError() when error != null:
return error(_that);case CartSuccess() when success != null:
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
case CartInitial() when initial != null:
return initial();case CartLoading() when loading != null:
return loading();case CartError() when error != null:
return error();case CartSuccess() when success != null:
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
case CartInitial():
return initial();case CartLoading():
return loading();case CartError():
return error();case CartSuccess():
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
case CartInitial() when initial != null:
return initial();case CartLoading() when loading != null:
return loading();case CartError() when error != null:
return error();case CartSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class CartInitial implements CartStateStatus {
  const CartInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartStateStatus.initial()';
}


}




/// @nodoc


class CartLoading implements CartStateStatus {
  const CartLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartStateStatus.loading()';
}


}




/// @nodoc


class CartError implements CartStateStatus {
  const CartError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartStateStatus.error()';
}


}




/// @nodoc


class CartSuccess implements CartStateStatus {
  const CartSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartStateStatus.success()';
}


}




// dart format on
