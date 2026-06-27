// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_contract_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateContractState {

 ContractType get selectedType; PaymentType get selectedPaymentType; String get totalHours; String get contractValue; String get notes; bool get isLoading; bool get isSuccess;
/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateContractStateCopyWith<CreateContractState> get copyWith => _$CreateContractStateCopyWithImpl<CreateContractState>(this as CreateContractState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateContractState&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.selectedPaymentType, selectedPaymentType) || other.selectedPaymentType == selectedPaymentType)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.contractValue, contractValue) || other.contractValue == contractValue)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,selectedType,selectedPaymentType,totalHours,contractValue,notes,isLoading,isSuccess);

@override
String toString() {
  return 'CreateContractState(selectedType: $selectedType, selectedPaymentType: $selectedPaymentType, totalHours: $totalHours, contractValue: $contractValue, notes: $notes, isLoading: $isLoading, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class $CreateContractStateCopyWith<$Res>  {
  factory $CreateContractStateCopyWith(CreateContractState value, $Res Function(CreateContractState) _then) = _$CreateContractStateCopyWithImpl;
@useResult
$Res call({
 ContractType selectedType, PaymentType selectedPaymentType, String totalHours, String contractValue, String notes, bool isLoading, bool isSuccess
});




}
/// @nodoc
class _$CreateContractStateCopyWithImpl<$Res>
    implements $CreateContractStateCopyWith<$Res> {
  _$CreateContractStateCopyWithImpl(this._self, this._then);

  final CreateContractState _self;
  final $Res Function(CreateContractState) _then;

/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedType = null,Object? selectedPaymentType = null,Object? totalHours = null,Object? contractValue = null,Object? notes = null,Object? isLoading = null,Object? isSuccess = null,}) {
  return _then(_self.copyWith(
selectedType: null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as ContractType,selectedPaymentType: null == selectedPaymentType ? _self.selectedPaymentType : selectedPaymentType // ignore: cast_nullable_to_non_nullable
as PaymentType,totalHours: null == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as String,contractValue: null == contractValue ? _self.contractValue : contractValue // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateContractState].
extension CreateContractStatePatterns on CreateContractState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateContractState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateContractState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateContractState value)  $default,){
final _that = this;
switch (_that) {
case _CreateContractState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateContractState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateContractState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ContractType selectedType,  PaymentType selectedPaymentType,  String totalHours,  String contractValue,  String notes,  bool isLoading,  bool isSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateContractState() when $default != null:
return $default(_that.selectedType,_that.selectedPaymentType,_that.totalHours,_that.contractValue,_that.notes,_that.isLoading,_that.isSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ContractType selectedType,  PaymentType selectedPaymentType,  String totalHours,  String contractValue,  String notes,  bool isLoading,  bool isSuccess)  $default,) {final _that = this;
switch (_that) {
case _CreateContractState():
return $default(_that.selectedType,_that.selectedPaymentType,_that.totalHours,_that.contractValue,_that.notes,_that.isLoading,_that.isSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ContractType selectedType,  PaymentType selectedPaymentType,  String totalHours,  String contractValue,  String notes,  bool isLoading,  bool isSuccess)?  $default,) {final _that = this;
switch (_that) {
case _CreateContractState() when $default != null:
return $default(_that.selectedType,_that.selectedPaymentType,_that.totalHours,_that.contractValue,_that.notes,_that.isLoading,_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _CreateContractState implements CreateContractState {
  const _CreateContractState({this.selectedType = ContractType.coaching, this.selectedPaymentType = PaymentType.oneTime, this.totalHours = '', this.contractValue = '', this.notes = '', this.isLoading = false, this.isSuccess = false});
  

@override@JsonKey() final  ContractType selectedType;
@override@JsonKey() final  PaymentType selectedPaymentType;
@override@JsonKey() final  String totalHours;
@override@JsonKey() final  String contractValue;
@override@JsonKey() final  String notes;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;

/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateContractStateCopyWith<_CreateContractState> get copyWith => __$CreateContractStateCopyWithImpl<_CreateContractState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateContractState&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.selectedPaymentType, selectedPaymentType) || other.selectedPaymentType == selectedPaymentType)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.contractValue, contractValue) || other.contractValue == contractValue)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,selectedType,selectedPaymentType,totalHours,contractValue,notes,isLoading,isSuccess);

@override
String toString() {
  return 'CreateContractState(selectedType: $selectedType, selectedPaymentType: $selectedPaymentType, totalHours: $totalHours, contractValue: $contractValue, notes: $notes, isLoading: $isLoading, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$CreateContractStateCopyWith<$Res> implements $CreateContractStateCopyWith<$Res> {
  factory _$CreateContractStateCopyWith(_CreateContractState value, $Res Function(_CreateContractState) _then) = __$CreateContractStateCopyWithImpl;
@override @useResult
$Res call({
 ContractType selectedType, PaymentType selectedPaymentType, String totalHours, String contractValue, String notes, bool isLoading, bool isSuccess
});




}
/// @nodoc
class __$CreateContractStateCopyWithImpl<$Res>
    implements _$CreateContractStateCopyWith<$Res> {
  __$CreateContractStateCopyWithImpl(this._self, this._then);

  final _CreateContractState _self;
  final $Res Function(_CreateContractState) _then;

/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedType = null,Object? selectedPaymentType = null,Object? totalHours = null,Object? contractValue = null,Object? notes = null,Object? isLoading = null,Object? isSuccess = null,}) {
  return _then(_CreateContractState(
selectedType: null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as ContractType,selectedPaymentType: null == selectedPaymentType ? _self.selectedPaymentType : selectedPaymentType // ignore: cast_nullable_to_non_nullable
as PaymentType,totalHours: null == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as String,contractValue: null == contractValue ? _self.contractValue : contractValue // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
