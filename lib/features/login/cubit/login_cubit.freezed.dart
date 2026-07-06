// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {

 LoginStep get step; String get phone; bool get hasPhoneError; String? get phoneErrorKey; bool get isSendingOtp; List<String> get otpDigits; bool get hasOtpError; String? get otpErrorKey; int get secondsLeft; bool get isVerifying; bool get isVerified; String? get generalErrorKey;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.step, step) || other.step == step)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.hasPhoneError, hasPhoneError) || other.hasPhoneError == hasPhoneError)&&(identical(other.phoneErrorKey, phoneErrorKey) || other.phoneErrorKey == phoneErrorKey)&&(identical(other.isSendingOtp, isSendingOtp) || other.isSendingOtp == isSendingOtp)&&const DeepCollectionEquality().equals(other.otpDigits, otpDigits)&&(identical(other.hasOtpError, hasOtpError) || other.hasOtpError == hasOtpError)&&(identical(other.otpErrorKey, otpErrorKey) || other.otpErrorKey == otpErrorKey)&&(identical(other.secondsLeft, secondsLeft) || other.secondsLeft == secondsLeft)&&(identical(other.isVerifying, isVerifying) || other.isVerifying == isVerifying)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.generalErrorKey, generalErrorKey) || other.generalErrorKey == generalErrorKey));
}


@override
int get hashCode => Object.hash(runtimeType,step,phone,hasPhoneError,phoneErrorKey,isSendingOtp,const DeepCollectionEquality().hash(otpDigits),hasOtpError,otpErrorKey,secondsLeft,isVerifying,isVerified,generalErrorKey);

@override
String toString() {
  return 'LoginState(step: $step, phone: $phone, hasPhoneError: $hasPhoneError, phoneErrorKey: $phoneErrorKey, isSendingOtp: $isSendingOtp, otpDigits: $otpDigits, hasOtpError: $hasOtpError, otpErrorKey: $otpErrorKey, secondsLeft: $secondsLeft, isVerifying: $isVerifying, isVerified: $isVerified, generalErrorKey: $generalErrorKey)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 LoginStep step, String phone, bool hasPhoneError, String? phoneErrorKey, bool isSendingOtp, List<String> otpDigits, bool hasOtpError, String? otpErrorKey, int secondsLeft, bool isVerifying, bool isVerified, String? generalErrorKey
});




}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? phone = null,Object? hasPhoneError = null,Object? phoneErrorKey = freezed,Object? isSendingOtp = null,Object? otpDigits = null,Object? hasOtpError = null,Object? otpErrorKey = freezed,Object? secondsLeft = null,Object? isVerifying = null,Object? isVerified = null,Object? generalErrorKey = freezed,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as LoginStep,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,hasPhoneError: null == hasPhoneError ? _self.hasPhoneError : hasPhoneError // ignore: cast_nullable_to_non_nullable
as bool,phoneErrorKey: freezed == phoneErrorKey ? _self.phoneErrorKey : phoneErrorKey // ignore: cast_nullable_to_non_nullable
as String?,isSendingOtp: null == isSendingOtp ? _self.isSendingOtp : isSendingOtp // ignore: cast_nullable_to_non_nullable
as bool,otpDigits: null == otpDigits ? _self.otpDigits : otpDigits // ignore: cast_nullable_to_non_nullable
as List<String>,hasOtpError: null == hasOtpError ? _self.hasOtpError : hasOtpError // ignore: cast_nullable_to_non_nullable
as bool,otpErrorKey: freezed == otpErrorKey ? _self.otpErrorKey : otpErrorKey // ignore: cast_nullable_to_non_nullable
as String?,secondsLeft: null == secondsLeft ? _self.secondsLeft : secondsLeft // ignore: cast_nullable_to_non_nullable
as int,isVerifying: null == isVerifying ? _self.isVerifying : isVerifying // ignore: cast_nullable_to_non_nullable
as bool,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,generalErrorKey: freezed == generalErrorKey ? _self.generalErrorKey : generalErrorKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginState value)  $default,){
final _that = this;
switch (_that) {
case _LoginState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginState value)?  $default,){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoginStep step,  String phone,  bool hasPhoneError,  String? phoneErrorKey,  bool isSendingOtp,  List<String> otpDigits,  bool hasOtpError,  String? otpErrorKey,  int secondsLeft,  bool isVerifying,  bool isVerified,  String? generalErrorKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.step,_that.phone,_that.hasPhoneError,_that.phoneErrorKey,_that.isSendingOtp,_that.otpDigits,_that.hasOtpError,_that.otpErrorKey,_that.secondsLeft,_that.isVerifying,_that.isVerified,_that.generalErrorKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoginStep step,  String phone,  bool hasPhoneError,  String? phoneErrorKey,  bool isSendingOtp,  List<String> otpDigits,  bool hasOtpError,  String? otpErrorKey,  int secondsLeft,  bool isVerifying,  bool isVerified,  String? generalErrorKey)  $default,) {final _that = this;
switch (_that) {
case _LoginState():
return $default(_that.step,_that.phone,_that.hasPhoneError,_that.phoneErrorKey,_that.isSendingOtp,_that.otpDigits,_that.hasOtpError,_that.otpErrorKey,_that.secondsLeft,_that.isVerifying,_that.isVerified,_that.generalErrorKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoginStep step,  String phone,  bool hasPhoneError,  String? phoneErrorKey,  bool isSendingOtp,  List<String> otpDigits,  bool hasOtpError,  String? otpErrorKey,  int secondsLeft,  bool isVerifying,  bool isVerified,  String? generalErrorKey)?  $default,) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.step,_that.phone,_that.hasPhoneError,_that.phoneErrorKey,_that.isSendingOtp,_that.otpDigits,_that.hasOtpError,_that.otpErrorKey,_that.secondsLeft,_that.isVerifying,_that.isVerified,_that.generalErrorKey);case _:
  return null;

}
}

}

/// @nodoc


class _LoginState implements LoginState {
  const _LoginState({this.step = LoginStep.phone, this.phone = '', this.hasPhoneError = false, this.phoneErrorKey = null, this.isSendingOtp = false, final  List<String> otpDigits = const ['', '', '', ''], this.hasOtpError = false, this.otpErrorKey = null, this.secondsLeft = 0, this.isVerifying = false, this.isVerified = false, this.generalErrorKey = null}): _otpDigits = otpDigits;
  

@override@JsonKey() final  LoginStep step;
@override@JsonKey() final  String phone;
@override@JsonKey() final  bool hasPhoneError;
@override@JsonKey() final  String? phoneErrorKey;
@override@JsonKey() final  bool isSendingOtp;
 final  List<String> _otpDigits;
@override@JsonKey() List<String> get otpDigits {
  if (_otpDigits is EqualUnmodifiableListView) return _otpDigits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_otpDigits);
}

@override@JsonKey() final  bool hasOtpError;
@override@JsonKey() final  String? otpErrorKey;
@override@JsonKey() final  int secondsLeft;
@override@JsonKey() final  bool isVerifying;
@override@JsonKey() final  bool isVerified;
@override@JsonKey() final  String? generalErrorKey;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.step, step) || other.step == step)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.hasPhoneError, hasPhoneError) || other.hasPhoneError == hasPhoneError)&&(identical(other.phoneErrorKey, phoneErrorKey) || other.phoneErrorKey == phoneErrorKey)&&(identical(other.isSendingOtp, isSendingOtp) || other.isSendingOtp == isSendingOtp)&&const DeepCollectionEquality().equals(other._otpDigits, _otpDigits)&&(identical(other.hasOtpError, hasOtpError) || other.hasOtpError == hasOtpError)&&(identical(other.otpErrorKey, otpErrorKey) || other.otpErrorKey == otpErrorKey)&&(identical(other.secondsLeft, secondsLeft) || other.secondsLeft == secondsLeft)&&(identical(other.isVerifying, isVerifying) || other.isVerifying == isVerifying)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.generalErrorKey, generalErrorKey) || other.generalErrorKey == generalErrorKey));
}


@override
int get hashCode => Object.hash(runtimeType,step,phone,hasPhoneError,phoneErrorKey,isSendingOtp,const DeepCollectionEquality().hash(_otpDigits),hasOtpError,otpErrorKey,secondsLeft,isVerifying,isVerified,generalErrorKey);

@override
String toString() {
  return 'LoginState(step: $step, phone: $phone, hasPhoneError: $hasPhoneError, phoneErrorKey: $phoneErrorKey, isSendingOtp: $isSendingOtp, otpDigits: $otpDigits, hasOtpError: $hasOtpError, otpErrorKey: $otpErrorKey, secondsLeft: $secondsLeft, isVerifying: $isVerifying, isVerified: $isVerified, generalErrorKey: $generalErrorKey)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@override @useResult
$Res call({
 LoginStep step, String phone, bool hasPhoneError, String? phoneErrorKey, bool isSendingOtp, List<String> otpDigits, bool hasOtpError, String? otpErrorKey, int secondsLeft, bool isVerifying, bool isVerified, String? generalErrorKey
});




}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? phone = null,Object? hasPhoneError = null,Object? phoneErrorKey = freezed,Object? isSendingOtp = null,Object? otpDigits = null,Object? hasOtpError = null,Object? otpErrorKey = freezed,Object? secondsLeft = null,Object? isVerifying = null,Object? isVerified = null,Object? generalErrorKey = freezed,}) {
  return _then(_LoginState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as LoginStep,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,hasPhoneError: null == hasPhoneError ? _self.hasPhoneError : hasPhoneError // ignore: cast_nullable_to_non_nullable
as bool,phoneErrorKey: freezed == phoneErrorKey ? _self.phoneErrorKey : phoneErrorKey // ignore: cast_nullable_to_non_nullable
as String?,isSendingOtp: null == isSendingOtp ? _self.isSendingOtp : isSendingOtp // ignore: cast_nullable_to_non_nullable
as bool,otpDigits: null == otpDigits ? _self._otpDigits : otpDigits // ignore: cast_nullable_to_non_nullable
as List<String>,hasOtpError: null == hasOtpError ? _self.hasOtpError : hasOtpError // ignore: cast_nullable_to_non_nullable
as bool,otpErrorKey: freezed == otpErrorKey ? _self.otpErrorKey : otpErrorKey // ignore: cast_nullable_to_non_nullable
as String?,secondsLeft: null == secondsLeft ? _self.secondsLeft : secondsLeft // ignore: cast_nullable_to_non_nullable
as int,isVerifying: null == isVerifying ? _self.isVerifying : isVerifying // ignore: cast_nullable_to_non_nullable
as bool,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,generalErrorKey: freezed == generalErrorKey ? _self.generalErrorKey : generalErrorKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
