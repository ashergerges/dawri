// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reserve_now_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReserveNowState {

 int get selectedDurationIndex; int get selectedTimeSlotIndex; int get selectedPaymentIndex; bool get isLoading; bool get isSuccess;
/// Create a copy of ReserveNowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReserveNowStateCopyWith<ReserveNowState> get copyWith => _$ReserveNowStateCopyWithImpl<ReserveNowState>(this as ReserveNowState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReserveNowState&&(identical(other.selectedDurationIndex, selectedDurationIndex) || other.selectedDurationIndex == selectedDurationIndex)&&(identical(other.selectedTimeSlotIndex, selectedTimeSlotIndex) || other.selectedTimeSlotIndex == selectedTimeSlotIndex)&&(identical(other.selectedPaymentIndex, selectedPaymentIndex) || other.selectedPaymentIndex == selectedPaymentIndex)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDurationIndex,selectedTimeSlotIndex,selectedPaymentIndex,isLoading,isSuccess);

@override
String toString() {
  return 'ReserveNowState(selectedDurationIndex: $selectedDurationIndex, selectedTimeSlotIndex: $selectedTimeSlotIndex, selectedPaymentIndex: $selectedPaymentIndex, isLoading: $isLoading, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class $ReserveNowStateCopyWith<$Res>  {
  factory $ReserveNowStateCopyWith(ReserveNowState value, $Res Function(ReserveNowState) _then) = _$ReserveNowStateCopyWithImpl;
@useResult
$Res call({
 int selectedDurationIndex, int selectedTimeSlotIndex, int selectedPaymentIndex, bool isLoading, bool isSuccess
});




}
/// @nodoc
class _$ReserveNowStateCopyWithImpl<$Res>
    implements $ReserveNowStateCopyWith<$Res> {
  _$ReserveNowStateCopyWithImpl(this._self, this._then);

  final ReserveNowState _self;
  final $Res Function(ReserveNowState) _then;

/// Create a copy of ReserveNowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedDurationIndex = null,Object? selectedTimeSlotIndex = null,Object? selectedPaymentIndex = null,Object? isLoading = null,Object? isSuccess = null,}) {
  return _then(_self.copyWith(
selectedDurationIndex: null == selectedDurationIndex ? _self.selectedDurationIndex : selectedDurationIndex // ignore: cast_nullable_to_non_nullable
as int,selectedTimeSlotIndex: null == selectedTimeSlotIndex ? _self.selectedTimeSlotIndex : selectedTimeSlotIndex // ignore: cast_nullable_to_non_nullable
as int,selectedPaymentIndex: null == selectedPaymentIndex ? _self.selectedPaymentIndex : selectedPaymentIndex // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ReserveNowState].
extension ReserveNowStatePatterns on ReserveNowState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReserveNowState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReserveNowState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReserveNowState value)  $default,){
final _that = this;
switch (_that) {
case _ReserveNowState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReserveNowState value)?  $default,){
final _that = this;
switch (_that) {
case _ReserveNowState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int selectedDurationIndex,  int selectedTimeSlotIndex,  int selectedPaymentIndex,  bool isLoading,  bool isSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReserveNowState() when $default != null:
return $default(_that.selectedDurationIndex,_that.selectedTimeSlotIndex,_that.selectedPaymentIndex,_that.isLoading,_that.isSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int selectedDurationIndex,  int selectedTimeSlotIndex,  int selectedPaymentIndex,  bool isLoading,  bool isSuccess)  $default,) {final _that = this;
switch (_that) {
case _ReserveNowState():
return $default(_that.selectedDurationIndex,_that.selectedTimeSlotIndex,_that.selectedPaymentIndex,_that.isLoading,_that.isSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int selectedDurationIndex,  int selectedTimeSlotIndex,  int selectedPaymentIndex,  bool isLoading,  bool isSuccess)?  $default,) {final _that = this;
switch (_that) {
case _ReserveNowState() when $default != null:
return $default(_that.selectedDurationIndex,_that.selectedTimeSlotIndex,_that.selectedPaymentIndex,_that.isLoading,_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _ReserveNowState implements ReserveNowState {
  const _ReserveNowState({this.selectedDurationIndex = 1, this.selectedTimeSlotIndex = 3, this.selectedPaymentIndex = 0, this.isLoading = false, this.isSuccess = false});
  

@override@JsonKey() final  int selectedDurationIndex;
@override@JsonKey() final  int selectedTimeSlotIndex;
@override@JsonKey() final  int selectedPaymentIndex;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;

/// Create a copy of ReserveNowState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReserveNowStateCopyWith<_ReserveNowState> get copyWith => __$ReserveNowStateCopyWithImpl<_ReserveNowState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReserveNowState&&(identical(other.selectedDurationIndex, selectedDurationIndex) || other.selectedDurationIndex == selectedDurationIndex)&&(identical(other.selectedTimeSlotIndex, selectedTimeSlotIndex) || other.selectedTimeSlotIndex == selectedTimeSlotIndex)&&(identical(other.selectedPaymentIndex, selectedPaymentIndex) || other.selectedPaymentIndex == selectedPaymentIndex)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDurationIndex,selectedTimeSlotIndex,selectedPaymentIndex,isLoading,isSuccess);

@override
String toString() {
  return 'ReserveNowState(selectedDurationIndex: $selectedDurationIndex, selectedTimeSlotIndex: $selectedTimeSlotIndex, selectedPaymentIndex: $selectedPaymentIndex, isLoading: $isLoading, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$ReserveNowStateCopyWith<$Res> implements $ReserveNowStateCopyWith<$Res> {
  factory _$ReserveNowStateCopyWith(_ReserveNowState value, $Res Function(_ReserveNowState) _then) = __$ReserveNowStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedDurationIndex, int selectedTimeSlotIndex, int selectedPaymentIndex, bool isLoading, bool isSuccess
});




}
/// @nodoc
class __$ReserveNowStateCopyWithImpl<$Res>
    implements _$ReserveNowStateCopyWith<$Res> {
  __$ReserveNowStateCopyWithImpl(this._self, this._then);

  final _ReserveNowState _self;
  final $Res Function(_ReserveNowState) _then;

/// Create a copy of ReserveNowState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedDurationIndex = null,Object? selectedTimeSlotIndex = null,Object? selectedPaymentIndex = null,Object? isLoading = null,Object? isSuccess = null,}) {
  return _then(_ReserveNowState(
selectedDurationIndex: null == selectedDurationIndex ? _self.selectedDurationIndex : selectedDurationIndex // ignore: cast_nullable_to_non_nullable
as int,selectedTimeSlotIndex: null == selectedTimeSlotIndex ? _self.selectedTimeSlotIndex : selectedTimeSlotIndex // ignore: cast_nullable_to_non_nullable
as int,selectedPaymentIndex: null == selectedPaymentIndex ? _self.selectedPaymentIndex : selectedPaymentIndex // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
