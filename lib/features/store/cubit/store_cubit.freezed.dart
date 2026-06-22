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

 int get selectedCategoryIndex; int get cartCount;
/// Create a copy of StoreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreStateCopyWith<StoreState> get copyWith => _$StoreStateCopyWithImpl<StoreState>(this as StoreState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreState&&(identical(other.selectedCategoryIndex, selectedCategoryIndex) || other.selectedCategoryIndex == selectedCategoryIndex)&&(identical(other.cartCount, cartCount) || other.cartCount == cartCount));
}


@override
int get hashCode => Object.hash(runtimeType,selectedCategoryIndex,cartCount);

@override
String toString() {
  return 'StoreState(selectedCategoryIndex: $selectedCategoryIndex, cartCount: $cartCount)';
}


}

/// @nodoc
abstract mixin class $StoreStateCopyWith<$Res>  {
  factory $StoreStateCopyWith(StoreState value, $Res Function(StoreState) _then) = _$StoreStateCopyWithImpl;
@useResult
$Res call({
 int selectedCategoryIndex, int cartCount
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
@pragma('vm:prefer-inline') @override $Res call({Object? selectedCategoryIndex = null,Object? cartCount = null,}) {
  return _then(_self.copyWith(
selectedCategoryIndex: null == selectedCategoryIndex ? _self.selectedCategoryIndex : selectedCategoryIndex // ignore: cast_nullable_to_non_nullable
as int,cartCount: null == cartCount ? _self.cartCount : cartCount // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int selectedCategoryIndex,  int cartCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreState() when $default != null:
return $default(_that.selectedCategoryIndex,_that.cartCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int selectedCategoryIndex,  int cartCount)  $default,) {final _that = this;
switch (_that) {
case _StoreState():
return $default(_that.selectedCategoryIndex,_that.cartCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int selectedCategoryIndex,  int cartCount)?  $default,) {final _that = this;
switch (_that) {
case _StoreState() when $default != null:
return $default(_that.selectedCategoryIndex,_that.cartCount);case _:
  return null;

}
}

}

/// @nodoc


class _StoreState implements StoreState {
  const _StoreState({this.selectedCategoryIndex = 0, this.cartCount = 0});
  

@override@JsonKey() final  int selectedCategoryIndex;
@override@JsonKey() final  int cartCount;

/// Create a copy of StoreState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreStateCopyWith<_StoreState> get copyWith => __$StoreStateCopyWithImpl<_StoreState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreState&&(identical(other.selectedCategoryIndex, selectedCategoryIndex) || other.selectedCategoryIndex == selectedCategoryIndex)&&(identical(other.cartCount, cartCount) || other.cartCount == cartCount));
}


@override
int get hashCode => Object.hash(runtimeType,selectedCategoryIndex,cartCount);

@override
String toString() {
  return 'StoreState(selectedCategoryIndex: $selectedCategoryIndex, cartCount: $cartCount)';
}


}

/// @nodoc
abstract mixin class _$StoreStateCopyWith<$Res> implements $StoreStateCopyWith<$Res> {
  factory _$StoreStateCopyWith(_StoreState value, $Res Function(_StoreState) _then) = __$StoreStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedCategoryIndex, int cartCount
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
@override @pragma('vm:prefer-inline') $Res call({Object? selectedCategoryIndex = null,Object? cartCount = null,}) {
  return _then(_StoreState(
selectedCategoryIndex: null == selectedCategoryIndex ? _self.selectedCategoryIndex : selectedCategoryIndex // ignore: cast_nullable_to_non_nullable
as int,cartCount: null == cartCount ? _self.cartCount : cartCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
