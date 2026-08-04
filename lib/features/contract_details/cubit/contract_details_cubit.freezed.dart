// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractDetailsState {

 ContractDetailsModel? get contract; ContractDetailsStatus get detailsStatus;/// Kept apart so only the accept / reject buttons react to it.
 ContractDetailsStatus get respondStatus;/// True once this screen accepted or rejected the contract.
 bool get didChangeStatus;
/// Create a copy of ContractDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractDetailsStateCopyWith<ContractDetailsState> get copyWith => _$ContractDetailsStateCopyWithImpl<ContractDetailsState>(this as ContractDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractDetailsState&&(identical(other.contract, contract) || other.contract == contract)&&(identical(other.detailsStatus, detailsStatus) || other.detailsStatus == detailsStatus)&&(identical(other.respondStatus, respondStatus) || other.respondStatus == respondStatus)&&(identical(other.didChangeStatus, didChangeStatus) || other.didChangeStatus == didChangeStatus));
}


@override
int get hashCode => Object.hash(runtimeType,contract,detailsStatus,respondStatus,didChangeStatus);

@override
String toString() {
  return 'ContractDetailsState(contract: $contract, detailsStatus: $detailsStatus, respondStatus: $respondStatus, didChangeStatus: $didChangeStatus)';
}


}

/// @nodoc
abstract mixin class $ContractDetailsStateCopyWith<$Res>  {
  factory $ContractDetailsStateCopyWith(ContractDetailsState value, $Res Function(ContractDetailsState) _then) = _$ContractDetailsStateCopyWithImpl;
@useResult
$Res call({
 ContractDetailsModel? contract, ContractDetailsStatus detailsStatus, ContractDetailsStatus respondStatus, bool didChangeStatus
});


$ContractDetailsStatusCopyWith<$Res> get detailsStatus;$ContractDetailsStatusCopyWith<$Res> get respondStatus;

}
/// @nodoc
class _$ContractDetailsStateCopyWithImpl<$Res>
    implements $ContractDetailsStateCopyWith<$Res> {
  _$ContractDetailsStateCopyWithImpl(this._self, this._then);

  final ContractDetailsState _self;
  final $Res Function(ContractDetailsState) _then;

/// Create a copy of ContractDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contract = freezed,Object? detailsStatus = null,Object? respondStatus = null,Object? didChangeStatus = null,}) {
  return _then(_self.copyWith(
contract: freezed == contract ? _self.contract : contract // ignore: cast_nullable_to_non_nullable
as ContractDetailsModel?,detailsStatus: null == detailsStatus ? _self.detailsStatus : detailsStatus // ignore: cast_nullable_to_non_nullable
as ContractDetailsStatus,respondStatus: null == respondStatus ? _self.respondStatus : respondStatus // ignore: cast_nullable_to_non_nullable
as ContractDetailsStatus,didChangeStatus: null == didChangeStatus ? _self.didChangeStatus : didChangeStatus // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ContractDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractDetailsStatusCopyWith<$Res> get detailsStatus {
  
  return $ContractDetailsStatusCopyWith<$Res>(_self.detailsStatus, (value) {
    return _then(_self.copyWith(detailsStatus: value));
  });
}/// Create a copy of ContractDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractDetailsStatusCopyWith<$Res> get respondStatus {
  
  return $ContractDetailsStatusCopyWith<$Res>(_self.respondStatus, (value) {
    return _then(_self.copyWith(respondStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContractDetailsState].
extension ContractDetailsStatePatterns on ContractDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _ContractDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _ContractDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ContractDetailsModel? contract,  ContractDetailsStatus detailsStatus,  ContractDetailsStatus respondStatus,  bool didChangeStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractDetailsState() when $default != null:
return $default(_that.contract,_that.detailsStatus,_that.respondStatus,_that.didChangeStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ContractDetailsModel? contract,  ContractDetailsStatus detailsStatus,  ContractDetailsStatus respondStatus,  bool didChangeStatus)  $default,) {final _that = this;
switch (_that) {
case _ContractDetailsState():
return $default(_that.contract,_that.detailsStatus,_that.respondStatus,_that.didChangeStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ContractDetailsModel? contract,  ContractDetailsStatus detailsStatus,  ContractDetailsStatus respondStatus,  bool didChangeStatus)?  $default,) {final _that = this;
switch (_that) {
case _ContractDetailsState() when $default != null:
return $default(_that.contract,_that.detailsStatus,_that.respondStatus,_that.didChangeStatus);case _:
  return null;

}
}

}

/// @nodoc


class _ContractDetailsState extends ContractDetailsState {
  const _ContractDetailsState({this.contract, this.detailsStatus = const ContractDetailsStatus.initial(), this.respondStatus = const ContractDetailsStatus.initial(), this.didChangeStatus = false}): super._();
  

@override final  ContractDetailsModel? contract;
@override@JsonKey() final  ContractDetailsStatus detailsStatus;
/// Kept apart so only the accept / reject buttons react to it.
@override@JsonKey() final  ContractDetailsStatus respondStatus;
/// True once this screen accepted or rejected the contract.
@override@JsonKey() final  bool didChangeStatus;

/// Create a copy of ContractDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractDetailsStateCopyWith<_ContractDetailsState> get copyWith => __$ContractDetailsStateCopyWithImpl<_ContractDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractDetailsState&&(identical(other.contract, contract) || other.contract == contract)&&(identical(other.detailsStatus, detailsStatus) || other.detailsStatus == detailsStatus)&&(identical(other.respondStatus, respondStatus) || other.respondStatus == respondStatus)&&(identical(other.didChangeStatus, didChangeStatus) || other.didChangeStatus == didChangeStatus));
}


@override
int get hashCode => Object.hash(runtimeType,contract,detailsStatus,respondStatus,didChangeStatus);

@override
String toString() {
  return 'ContractDetailsState(contract: $contract, detailsStatus: $detailsStatus, respondStatus: $respondStatus, didChangeStatus: $didChangeStatus)';
}


}

/// @nodoc
abstract mixin class _$ContractDetailsStateCopyWith<$Res> implements $ContractDetailsStateCopyWith<$Res> {
  factory _$ContractDetailsStateCopyWith(_ContractDetailsState value, $Res Function(_ContractDetailsState) _then) = __$ContractDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 ContractDetailsModel? contract, ContractDetailsStatus detailsStatus, ContractDetailsStatus respondStatus, bool didChangeStatus
});


@override $ContractDetailsStatusCopyWith<$Res> get detailsStatus;@override $ContractDetailsStatusCopyWith<$Res> get respondStatus;

}
/// @nodoc
class __$ContractDetailsStateCopyWithImpl<$Res>
    implements _$ContractDetailsStateCopyWith<$Res> {
  __$ContractDetailsStateCopyWithImpl(this._self, this._then);

  final _ContractDetailsState _self;
  final $Res Function(_ContractDetailsState) _then;

/// Create a copy of ContractDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contract = freezed,Object? detailsStatus = null,Object? respondStatus = null,Object? didChangeStatus = null,}) {
  return _then(_ContractDetailsState(
contract: freezed == contract ? _self.contract : contract // ignore: cast_nullable_to_non_nullable
as ContractDetailsModel?,detailsStatus: null == detailsStatus ? _self.detailsStatus : detailsStatus // ignore: cast_nullable_to_non_nullable
as ContractDetailsStatus,respondStatus: null == respondStatus ? _self.respondStatus : respondStatus // ignore: cast_nullable_to_non_nullable
as ContractDetailsStatus,didChangeStatus: null == didChangeStatus ? _self.didChangeStatus : didChangeStatus // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ContractDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractDetailsStatusCopyWith<$Res> get detailsStatus {
  
  return $ContractDetailsStatusCopyWith<$Res>(_self.detailsStatus, (value) {
    return _then(_self.copyWith(detailsStatus: value));
  });
}/// Create a copy of ContractDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractDetailsStatusCopyWith<$Res> get respondStatus {
  
  return $ContractDetailsStatusCopyWith<$Res>(_self.respondStatus, (value) {
    return _then(_self.copyWith(respondStatus: value));
  });
}
}

/// @nodoc
mixin _$ContractDetailsStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractDetailsStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractDetailsStatus()';
}


}

/// @nodoc
class $ContractDetailsStatusCopyWith<$Res>  {
$ContractDetailsStatusCopyWith(ContractDetailsStatus _, $Res Function(ContractDetailsStatus) __);
}


/// Adds pattern-matching-related methods to [ContractDetailsStatus].
extension ContractDetailsStatusPatterns on ContractDetailsStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ContractDetailsStatusInitial value)?  initial,TResult Function( ContractDetailsStatusLoading value)?  loading,TResult Function( ContractDetailsStatusError value)?  error,TResult Function( ContractDetailsStatusSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ContractDetailsStatusInitial() when initial != null:
return initial(_that);case ContractDetailsStatusLoading() when loading != null:
return loading(_that);case ContractDetailsStatusError() when error != null:
return error(_that);case ContractDetailsStatusSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ContractDetailsStatusInitial value)  initial,required TResult Function( ContractDetailsStatusLoading value)  loading,required TResult Function( ContractDetailsStatusError value)  error,required TResult Function( ContractDetailsStatusSuccess value)  success,}){
final _that = this;
switch (_that) {
case ContractDetailsStatusInitial():
return initial(_that);case ContractDetailsStatusLoading():
return loading(_that);case ContractDetailsStatusError():
return error(_that);case ContractDetailsStatusSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ContractDetailsStatusInitial value)?  initial,TResult? Function( ContractDetailsStatusLoading value)?  loading,TResult? Function( ContractDetailsStatusError value)?  error,TResult? Function( ContractDetailsStatusSuccess value)?  success,}){
final _that = this;
switch (_that) {
case ContractDetailsStatusInitial() when initial != null:
return initial(_that);case ContractDetailsStatusLoading() when loading != null:
return loading(_that);case ContractDetailsStatusError() when error != null:
return error(_that);case ContractDetailsStatusSuccess() when success != null:
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
case ContractDetailsStatusInitial() when initial != null:
return initial();case ContractDetailsStatusLoading() when loading != null:
return loading();case ContractDetailsStatusError() when error != null:
return error();case ContractDetailsStatusSuccess() when success != null:
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
case ContractDetailsStatusInitial():
return initial();case ContractDetailsStatusLoading():
return loading();case ContractDetailsStatusError():
return error();case ContractDetailsStatusSuccess():
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
case ContractDetailsStatusInitial() when initial != null:
return initial();case ContractDetailsStatusLoading() when loading != null:
return loading();case ContractDetailsStatusError() when error != null:
return error();case ContractDetailsStatusSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class ContractDetailsStatusInitial implements ContractDetailsStatus {
  const ContractDetailsStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractDetailsStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractDetailsStatus.initial()';
}


}




/// @nodoc


class ContractDetailsStatusLoading implements ContractDetailsStatus {
  const ContractDetailsStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractDetailsStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractDetailsStatus.loading()';
}


}




/// @nodoc


class ContractDetailsStatusError implements ContractDetailsStatus {
  const ContractDetailsStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractDetailsStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractDetailsStatus.error()';
}


}




/// @nodoc


class ContractDetailsStatusSuccess implements ContractDetailsStatus {
  const ContractDetailsStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractDetailsStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractDetailsStatus.success()';
}


}




// dart format on
