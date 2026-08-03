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

// ─── Lookups ─────────────────────────────────────────────
 List<ContractTypeModel> get contractTypes; List<SalaryTypeModel> get salaryTypes; CreateContractStatus get optionsStatus;// ─── Form fields (all required) ──────────────────────────
 int? get selectedContractTypeId; int? get selectedSalaryTypeId; String get amount; String get startDate; String get endDate; String get totalHours; String get notes;// ─── Submit ──────────────────────────────────────────────
 CreateContractStatus get submitStatus; bool get isSuccess;
/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateContractStateCopyWith<CreateContractState> get copyWith => _$CreateContractStateCopyWithImpl<CreateContractState>(this as CreateContractState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateContractState&&const DeepCollectionEquality().equals(other.contractTypes, contractTypes)&&const DeepCollectionEquality().equals(other.salaryTypes, salaryTypes)&&(identical(other.optionsStatus, optionsStatus) || other.optionsStatus == optionsStatus)&&(identical(other.selectedContractTypeId, selectedContractTypeId) || other.selectedContractTypeId == selectedContractTypeId)&&(identical(other.selectedSalaryTypeId, selectedSalaryTypeId) || other.selectedSalaryTypeId == selectedSalaryTypeId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(contractTypes),const DeepCollectionEquality().hash(salaryTypes),optionsStatus,selectedContractTypeId,selectedSalaryTypeId,amount,startDate,endDate,totalHours,notes,submitStatus,isSuccess);

@override
String toString() {
  return 'CreateContractState(contractTypes: $contractTypes, salaryTypes: $salaryTypes, optionsStatus: $optionsStatus, selectedContractTypeId: $selectedContractTypeId, selectedSalaryTypeId: $selectedSalaryTypeId, amount: $amount, startDate: $startDate, endDate: $endDate, totalHours: $totalHours, notes: $notes, submitStatus: $submitStatus, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class $CreateContractStateCopyWith<$Res>  {
  factory $CreateContractStateCopyWith(CreateContractState value, $Res Function(CreateContractState) _then) = _$CreateContractStateCopyWithImpl;
@useResult
$Res call({
 List<ContractTypeModel> contractTypes, List<SalaryTypeModel> salaryTypes, CreateContractStatus optionsStatus, int? selectedContractTypeId, int? selectedSalaryTypeId, String amount, String startDate, String endDate, String totalHours, String notes, CreateContractStatus submitStatus, bool isSuccess
});


$CreateContractStatusCopyWith<$Res> get optionsStatus;$CreateContractStatusCopyWith<$Res> get submitStatus;

}
/// @nodoc
class _$CreateContractStateCopyWithImpl<$Res>
    implements $CreateContractStateCopyWith<$Res> {
  _$CreateContractStateCopyWithImpl(this._self, this._then);

  final CreateContractState _self;
  final $Res Function(CreateContractState) _then;

/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contractTypes = null,Object? salaryTypes = null,Object? optionsStatus = null,Object? selectedContractTypeId = freezed,Object? selectedSalaryTypeId = freezed,Object? amount = null,Object? startDate = null,Object? endDate = null,Object? totalHours = null,Object? notes = null,Object? submitStatus = null,Object? isSuccess = null,}) {
  return _then(_self.copyWith(
contractTypes: null == contractTypes ? _self.contractTypes : contractTypes // ignore: cast_nullable_to_non_nullable
as List<ContractTypeModel>,salaryTypes: null == salaryTypes ? _self.salaryTypes : salaryTypes // ignore: cast_nullable_to_non_nullable
as List<SalaryTypeModel>,optionsStatus: null == optionsStatus ? _self.optionsStatus : optionsStatus // ignore: cast_nullable_to_non_nullable
as CreateContractStatus,selectedContractTypeId: freezed == selectedContractTypeId ? _self.selectedContractTypeId : selectedContractTypeId // ignore: cast_nullable_to_non_nullable
as int?,selectedSalaryTypeId: freezed == selectedSalaryTypeId ? _self.selectedSalaryTypeId : selectedSalaryTypeId // ignore: cast_nullable_to_non_nullable
as int?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalHours: null == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as CreateContractStatus,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateContractStatusCopyWith<$Res> get optionsStatus {
  
  return $CreateContractStatusCopyWith<$Res>(_self.optionsStatus, (value) {
    return _then(_self.copyWith(optionsStatus: value));
  });
}/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateContractStatusCopyWith<$Res> get submitStatus {
  
  return $CreateContractStatusCopyWith<$Res>(_self.submitStatus, (value) {
    return _then(_self.copyWith(submitStatus: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ContractTypeModel> contractTypes,  List<SalaryTypeModel> salaryTypes,  CreateContractStatus optionsStatus,  int? selectedContractTypeId,  int? selectedSalaryTypeId,  String amount,  String startDate,  String endDate,  String totalHours,  String notes,  CreateContractStatus submitStatus,  bool isSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateContractState() when $default != null:
return $default(_that.contractTypes,_that.salaryTypes,_that.optionsStatus,_that.selectedContractTypeId,_that.selectedSalaryTypeId,_that.amount,_that.startDate,_that.endDate,_that.totalHours,_that.notes,_that.submitStatus,_that.isSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ContractTypeModel> contractTypes,  List<SalaryTypeModel> salaryTypes,  CreateContractStatus optionsStatus,  int? selectedContractTypeId,  int? selectedSalaryTypeId,  String amount,  String startDate,  String endDate,  String totalHours,  String notes,  CreateContractStatus submitStatus,  bool isSuccess)  $default,) {final _that = this;
switch (_that) {
case _CreateContractState():
return $default(_that.contractTypes,_that.salaryTypes,_that.optionsStatus,_that.selectedContractTypeId,_that.selectedSalaryTypeId,_that.amount,_that.startDate,_that.endDate,_that.totalHours,_that.notes,_that.submitStatus,_that.isSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ContractTypeModel> contractTypes,  List<SalaryTypeModel> salaryTypes,  CreateContractStatus optionsStatus,  int? selectedContractTypeId,  int? selectedSalaryTypeId,  String amount,  String startDate,  String endDate,  String totalHours,  String notes,  CreateContractStatus submitStatus,  bool isSuccess)?  $default,) {final _that = this;
switch (_that) {
case _CreateContractState() when $default != null:
return $default(_that.contractTypes,_that.salaryTypes,_that.optionsStatus,_that.selectedContractTypeId,_that.selectedSalaryTypeId,_that.amount,_that.startDate,_that.endDate,_that.totalHours,_that.notes,_that.submitStatus,_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _CreateContractState extends CreateContractState {
  const _CreateContractState({final  List<ContractTypeModel> contractTypes = const [], final  List<SalaryTypeModel> salaryTypes = const [], this.optionsStatus = const CreateContractStatus.initial(), this.selectedContractTypeId, this.selectedSalaryTypeId, this.amount = '', this.startDate = '', this.endDate = '', this.totalHours = '', this.notes = '', this.submitStatus = const CreateContractStatus.initial(), this.isSuccess = false}): _contractTypes = contractTypes,_salaryTypes = salaryTypes,super._();
  

// ─── Lookups ─────────────────────────────────────────────
 final  List<ContractTypeModel> _contractTypes;
// ─── Lookups ─────────────────────────────────────────────
@override@JsonKey() List<ContractTypeModel> get contractTypes {
  if (_contractTypes is EqualUnmodifiableListView) return _contractTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contractTypes);
}

 final  List<SalaryTypeModel> _salaryTypes;
@override@JsonKey() List<SalaryTypeModel> get salaryTypes {
  if (_salaryTypes is EqualUnmodifiableListView) return _salaryTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_salaryTypes);
}

@override@JsonKey() final  CreateContractStatus optionsStatus;
// ─── Form fields (all required) ──────────────────────────
@override final  int? selectedContractTypeId;
@override final  int? selectedSalaryTypeId;
@override@JsonKey() final  String amount;
@override@JsonKey() final  String startDate;
@override@JsonKey() final  String endDate;
@override@JsonKey() final  String totalHours;
@override@JsonKey() final  String notes;
// ─── Submit ──────────────────────────────────────────────
@override@JsonKey() final  CreateContractStatus submitStatus;
@override@JsonKey() final  bool isSuccess;

/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateContractStateCopyWith<_CreateContractState> get copyWith => __$CreateContractStateCopyWithImpl<_CreateContractState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateContractState&&const DeepCollectionEquality().equals(other._contractTypes, _contractTypes)&&const DeepCollectionEquality().equals(other._salaryTypes, _salaryTypes)&&(identical(other.optionsStatus, optionsStatus) || other.optionsStatus == optionsStatus)&&(identical(other.selectedContractTypeId, selectedContractTypeId) || other.selectedContractTypeId == selectedContractTypeId)&&(identical(other.selectedSalaryTypeId, selectedSalaryTypeId) || other.selectedSalaryTypeId == selectedSalaryTypeId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_contractTypes),const DeepCollectionEquality().hash(_salaryTypes),optionsStatus,selectedContractTypeId,selectedSalaryTypeId,amount,startDate,endDate,totalHours,notes,submitStatus,isSuccess);

@override
String toString() {
  return 'CreateContractState(contractTypes: $contractTypes, salaryTypes: $salaryTypes, optionsStatus: $optionsStatus, selectedContractTypeId: $selectedContractTypeId, selectedSalaryTypeId: $selectedSalaryTypeId, amount: $amount, startDate: $startDate, endDate: $endDate, totalHours: $totalHours, notes: $notes, submitStatus: $submitStatus, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$CreateContractStateCopyWith<$Res> implements $CreateContractStateCopyWith<$Res> {
  factory _$CreateContractStateCopyWith(_CreateContractState value, $Res Function(_CreateContractState) _then) = __$CreateContractStateCopyWithImpl;
@override @useResult
$Res call({
 List<ContractTypeModel> contractTypes, List<SalaryTypeModel> salaryTypes, CreateContractStatus optionsStatus, int? selectedContractTypeId, int? selectedSalaryTypeId, String amount, String startDate, String endDate, String totalHours, String notes, CreateContractStatus submitStatus, bool isSuccess
});


@override $CreateContractStatusCopyWith<$Res> get optionsStatus;@override $CreateContractStatusCopyWith<$Res> get submitStatus;

}
/// @nodoc
class __$CreateContractStateCopyWithImpl<$Res>
    implements _$CreateContractStateCopyWith<$Res> {
  __$CreateContractStateCopyWithImpl(this._self, this._then);

  final _CreateContractState _self;
  final $Res Function(_CreateContractState) _then;

/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contractTypes = null,Object? salaryTypes = null,Object? optionsStatus = null,Object? selectedContractTypeId = freezed,Object? selectedSalaryTypeId = freezed,Object? amount = null,Object? startDate = null,Object? endDate = null,Object? totalHours = null,Object? notes = null,Object? submitStatus = null,Object? isSuccess = null,}) {
  return _then(_CreateContractState(
contractTypes: null == contractTypes ? _self._contractTypes : contractTypes // ignore: cast_nullable_to_non_nullable
as List<ContractTypeModel>,salaryTypes: null == salaryTypes ? _self._salaryTypes : salaryTypes // ignore: cast_nullable_to_non_nullable
as List<SalaryTypeModel>,optionsStatus: null == optionsStatus ? _self.optionsStatus : optionsStatus // ignore: cast_nullable_to_non_nullable
as CreateContractStatus,selectedContractTypeId: freezed == selectedContractTypeId ? _self.selectedContractTypeId : selectedContractTypeId // ignore: cast_nullable_to_non_nullable
as int?,selectedSalaryTypeId: freezed == selectedSalaryTypeId ? _self.selectedSalaryTypeId : selectedSalaryTypeId // ignore: cast_nullable_to_non_nullable
as int?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalHours: null == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as CreateContractStatus,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateContractStatusCopyWith<$Res> get optionsStatus {
  
  return $CreateContractStatusCopyWith<$Res>(_self.optionsStatus, (value) {
    return _then(_self.copyWith(optionsStatus: value));
  });
}/// Create a copy of CreateContractState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateContractStatusCopyWith<$Res> get submitStatus {
  
  return $CreateContractStatusCopyWith<$Res>(_self.submitStatus, (value) {
    return _then(_self.copyWith(submitStatus: value));
  });
}
}

/// @nodoc
mixin _$CreateContractStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateContractStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateContractStatus()';
}


}

/// @nodoc
class $CreateContractStatusCopyWith<$Res>  {
$CreateContractStatusCopyWith(CreateContractStatus _, $Res Function(CreateContractStatus) __);
}


/// Adds pattern-matching-related methods to [CreateContractStatus].
extension CreateContractStatusPatterns on CreateContractStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateContractStatusInitial value)?  initial,TResult Function( CreateContractStatusLoading value)?  loading,TResult Function( CreateContractStatusError value)?  error,TResult Function( CreateContractStatusSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateContractStatusInitial() when initial != null:
return initial(_that);case CreateContractStatusLoading() when loading != null:
return loading(_that);case CreateContractStatusError() when error != null:
return error(_that);case CreateContractStatusSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateContractStatusInitial value)  initial,required TResult Function( CreateContractStatusLoading value)  loading,required TResult Function( CreateContractStatusError value)  error,required TResult Function( CreateContractStatusSuccess value)  success,}){
final _that = this;
switch (_that) {
case CreateContractStatusInitial():
return initial(_that);case CreateContractStatusLoading():
return loading(_that);case CreateContractStatusError():
return error(_that);case CreateContractStatusSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateContractStatusInitial value)?  initial,TResult? Function( CreateContractStatusLoading value)?  loading,TResult? Function( CreateContractStatusError value)?  error,TResult? Function( CreateContractStatusSuccess value)?  success,}){
final _that = this;
switch (_that) {
case CreateContractStatusInitial() when initial != null:
return initial(_that);case CreateContractStatusLoading() when loading != null:
return loading(_that);case CreateContractStatusError() when error != null:
return error(_that);case CreateContractStatusSuccess() when success != null:
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
case CreateContractStatusInitial() when initial != null:
return initial();case CreateContractStatusLoading() when loading != null:
return loading();case CreateContractStatusError() when error != null:
return error();case CreateContractStatusSuccess() when success != null:
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
case CreateContractStatusInitial():
return initial();case CreateContractStatusLoading():
return loading();case CreateContractStatusError():
return error();case CreateContractStatusSuccess():
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
case CreateContractStatusInitial() when initial != null:
return initial();case CreateContractStatusLoading() when loading != null:
return loading();case CreateContractStatusError() when error != null:
return error();case CreateContractStatusSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class CreateContractStatusInitial implements CreateContractStatus {
  const CreateContractStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateContractStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateContractStatus.initial()';
}


}




/// @nodoc


class CreateContractStatusLoading implements CreateContractStatus {
  const CreateContractStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateContractStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateContractStatus.loading()';
}


}




/// @nodoc


class CreateContractStatusError implements CreateContractStatus {
  const CreateContractStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateContractStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateContractStatus.error()';
}


}




/// @nodoc


class CreateContractStatusSuccess implements CreateContractStatus {
  const CreateContractStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateContractStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateContractStatus.success()';
}


}




// dart format on
