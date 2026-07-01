// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charge_wallet_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChargeWalletState {

 double get selectedAmount; double? get selectedChip; String get customInput; PaymentMethod get selectedMethod; bool get isPaying; bool get showSuccessModal;
/// Create a copy of ChargeWalletState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChargeWalletStateCopyWith<ChargeWalletState> get copyWith => _$ChargeWalletStateCopyWithImpl<ChargeWalletState>(this as ChargeWalletState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChargeWalletState&&(identical(other.selectedAmount, selectedAmount) || other.selectedAmount == selectedAmount)&&(identical(other.selectedChip, selectedChip) || other.selectedChip == selectedChip)&&(identical(other.customInput, customInput) || other.customInput == customInput)&&(identical(other.selectedMethod, selectedMethod) || other.selectedMethod == selectedMethod)&&(identical(other.isPaying, isPaying) || other.isPaying == isPaying)&&(identical(other.showSuccessModal, showSuccessModal) || other.showSuccessModal == showSuccessModal));
}


@override
int get hashCode => Object.hash(runtimeType,selectedAmount,selectedChip,customInput,selectedMethod,isPaying,showSuccessModal);

@override
String toString() {
  return 'ChargeWalletState(selectedAmount: $selectedAmount, selectedChip: $selectedChip, customInput: $customInput, selectedMethod: $selectedMethod, isPaying: $isPaying, showSuccessModal: $showSuccessModal)';
}


}

/// @nodoc
abstract mixin class $ChargeWalletStateCopyWith<$Res>  {
  factory $ChargeWalletStateCopyWith(ChargeWalletState value, $Res Function(ChargeWalletState) _then) = _$ChargeWalletStateCopyWithImpl;
@useResult
$Res call({
 double selectedAmount, double? selectedChip, String customInput, PaymentMethod selectedMethod, bool isPaying, bool showSuccessModal
});




}
/// @nodoc
class _$ChargeWalletStateCopyWithImpl<$Res>
    implements $ChargeWalletStateCopyWith<$Res> {
  _$ChargeWalletStateCopyWithImpl(this._self, this._then);

  final ChargeWalletState _self;
  final $Res Function(ChargeWalletState) _then;

/// Create a copy of ChargeWalletState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedAmount = null,Object? selectedChip = freezed,Object? customInput = null,Object? selectedMethod = null,Object? isPaying = null,Object? showSuccessModal = null,}) {
  return _then(_self.copyWith(
selectedAmount: null == selectedAmount ? _self.selectedAmount : selectedAmount // ignore: cast_nullable_to_non_nullable
as double,selectedChip: freezed == selectedChip ? _self.selectedChip : selectedChip // ignore: cast_nullable_to_non_nullable
as double?,customInput: null == customInput ? _self.customInput : customInput // ignore: cast_nullable_to_non_nullable
as String,selectedMethod: null == selectedMethod ? _self.selectedMethod : selectedMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,isPaying: null == isPaying ? _self.isPaying : isPaying // ignore: cast_nullable_to_non_nullable
as bool,showSuccessModal: null == showSuccessModal ? _self.showSuccessModal : showSuccessModal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChargeWalletState].
extension ChargeWalletStatePatterns on ChargeWalletState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChargeWalletState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChargeWalletState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChargeWalletState value)  $default,){
final _that = this;
switch (_that) {
case _ChargeWalletState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChargeWalletState value)?  $default,){
final _that = this;
switch (_that) {
case _ChargeWalletState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double selectedAmount,  double? selectedChip,  String customInput,  PaymentMethod selectedMethod,  bool isPaying,  bool showSuccessModal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChargeWalletState() when $default != null:
return $default(_that.selectedAmount,_that.selectedChip,_that.customInput,_that.selectedMethod,_that.isPaying,_that.showSuccessModal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double selectedAmount,  double? selectedChip,  String customInput,  PaymentMethod selectedMethod,  bool isPaying,  bool showSuccessModal)  $default,) {final _that = this;
switch (_that) {
case _ChargeWalletState():
return $default(_that.selectedAmount,_that.selectedChip,_that.customInput,_that.selectedMethod,_that.isPaying,_that.showSuccessModal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double selectedAmount,  double? selectedChip,  String customInput,  PaymentMethod selectedMethod,  bool isPaying,  bool showSuccessModal)?  $default,) {final _that = this;
switch (_that) {
case _ChargeWalletState() when $default != null:
return $default(_that.selectedAmount,_that.selectedChip,_that.customInput,_that.selectedMethod,_that.isPaying,_that.showSuccessModal);case _:
  return null;

}
}

}

/// @nodoc


class _ChargeWalletState implements ChargeWalletState {
  const _ChargeWalletState({this.selectedAmount = 0.0, this.selectedChip, this.customInput = '', this.selectedMethod = PaymentMethod.applePay, this.isPaying = false, this.showSuccessModal = false});
  

@override@JsonKey() final  double selectedAmount;
@override final  double? selectedChip;
@override@JsonKey() final  String customInput;
@override@JsonKey() final  PaymentMethod selectedMethod;
@override@JsonKey() final  bool isPaying;
@override@JsonKey() final  bool showSuccessModal;

/// Create a copy of ChargeWalletState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChargeWalletStateCopyWith<_ChargeWalletState> get copyWith => __$ChargeWalletStateCopyWithImpl<_ChargeWalletState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChargeWalletState&&(identical(other.selectedAmount, selectedAmount) || other.selectedAmount == selectedAmount)&&(identical(other.selectedChip, selectedChip) || other.selectedChip == selectedChip)&&(identical(other.customInput, customInput) || other.customInput == customInput)&&(identical(other.selectedMethod, selectedMethod) || other.selectedMethod == selectedMethod)&&(identical(other.isPaying, isPaying) || other.isPaying == isPaying)&&(identical(other.showSuccessModal, showSuccessModal) || other.showSuccessModal == showSuccessModal));
}


@override
int get hashCode => Object.hash(runtimeType,selectedAmount,selectedChip,customInput,selectedMethod,isPaying,showSuccessModal);

@override
String toString() {
  return 'ChargeWalletState(selectedAmount: $selectedAmount, selectedChip: $selectedChip, customInput: $customInput, selectedMethod: $selectedMethod, isPaying: $isPaying, showSuccessModal: $showSuccessModal)';
}


}

/// @nodoc
abstract mixin class _$ChargeWalletStateCopyWith<$Res> implements $ChargeWalletStateCopyWith<$Res> {
  factory _$ChargeWalletStateCopyWith(_ChargeWalletState value, $Res Function(_ChargeWalletState) _then) = __$ChargeWalletStateCopyWithImpl;
@override @useResult
$Res call({
 double selectedAmount, double? selectedChip, String customInput, PaymentMethod selectedMethod, bool isPaying, bool showSuccessModal
});




}
/// @nodoc
class __$ChargeWalletStateCopyWithImpl<$Res>
    implements _$ChargeWalletStateCopyWith<$Res> {
  __$ChargeWalletStateCopyWithImpl(this._self, this._then);

  final _ChargeWalletState _self;
  final $Res Function(_ChargeWalletState) _then;

/// Create a copy of ChargeWalletState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedAmount = null,Object? selectedChip = freezed,Object? customInput = null,Object? selectedMethod = null,Object? isPaying = null,Object? showSuccessModal = null,}) {
  return _then(_ChargeWalletState(
selectedAmount: null == selectedAmount ? _self.selectedAmount : selectedAmount // ignore: cast_nullable_to_non_nullable
as double,selectedChip: freezed == selectedChip ? _self.selectedChip : selectedChip // ignore: cast_nullable_to_non_nullable
as double?,customInput: null == customInput ? _self.customInput : customInput // ignore: cast_nullable_to_non_nullable
as String,selectedMethod: null == selectedMethod ? _self.selectedMethod : selectedMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethod,isPaying: null == isPaying ? _self.isPaying : isPaying // ignore: cast_nullable_to_non_nullable
as bool,showSuccessModal: null == showSuccessModal ? _self.showSuccessModal : showSuccessModal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
