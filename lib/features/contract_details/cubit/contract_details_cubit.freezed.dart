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

 ContractStatus get status; bool get isSigning; bool get showSuccessModal;
/// Create a copy of ContractDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractDetailsStateCopyWith<ContractDetailsState> get copyWith => _$ContractDetailsStateCopyWithImpl<ContractDetailsState>(this as ContractDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractDetailsState&&(identical(other.status, status) || other.status == status)&&(identical(other.isSigning, isSigning) || other.isSigning == isSigning)&&(identical(other.showSuccessModal, showSuccessModal) || other.showSuccessModal == showSuccessModal));
}


@override
int get hashCode => Object.hash(runtimeType,status,isSigning,showSuccessModal);

@override
String toString() {
  return 'ContractDetailsState(status: $status, isSigning: $isSigning, showSuccessModal: $showSuccessModal)';
}


}

/// @nodoc
abstract mixin class $ContractDetailsStateCopyWith<$Res>  {
  factory $ContractDetailsStateCopyWith(ContractDetailsState value, $Res Function(ContractDetailsState) _then) = _$ContractDetailsStateCopyWithImpl;
@useResult
$Res call({
 ContractStatus status, bool isSigning, bool showSuccessModal
});




}
/// @nodoc
class _$ContractDetailsStateCopyWithImpl<$Res>
    implements $ContractDetailsStateCopyWith<$Res> {
  _$ContractDetailsStateCopyWithImpl(this._self, this._then);

  final ContractDetailsState _self;
  final $Res Function(ContractDetailsState) _then;

/// Create a copy of ContractDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? isSigning = null,Object? showSuccessModal = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,isSigning: null == isSigning ? _self.isSigning : isSigning // ignore: cast_nullable_to_non_nullable
as bool,showSuccessModal: null == showSuccessModal ? _self.showSuccessModal : showSuccessModal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ContractStatus status,  bool isSigning,  bool showSuccessModal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractDetailsState() when $default != null:
return $default(_that.status,_that.isSigning,_that.showSuccessModal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ContractStatus status,  bool isSigning,  bool showSuccessModal)  $default,) {final _that = this;
switch (_that) {
case _ContractDetailsState():
return $default(_that.status,_that.isSigning,_that.showSuccessModal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ContractStatus status,  bool isSigning,  bool showSuccessModal)?  $default,) {final _that = this;
switch (_that) {
case _ContractDetailsState() when $default != null:
return $default(_that.status,_that.isSigning,_that.showSuccessModal);case _:
  return null;

}
}

}

/// @nodoc


class _ContractDetailsState implements ContractDetailsState {
  const _ContractDetailsState({this.status = ContractStatus.pending, this.isSigning = false, this.showSuccessModal = false});
  

@override@JsonKey() final  ContractStatus status;
@override@JsonKey() final  bool isSigning;
@override@JsonKey() final  bool showSuccessModal;

/// Create a copy of ContractDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractDetailsStateCopyWith<_ContractDetailsState> get copyWith => __$ContractDetailsStateCopyWithImpl<_ContractDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractDetailsState&&(identical(other.status, status) || other.status == status)&&(identical(other.isSigning, isSigning) || other.isSigning == isSigning)&&(identical(other.showSuccessModal, showSuccessModal) || other.showSuccessModal == showSuccessModal));
}


@override
int get hashCode => Object.hash(runtimeType,status,isSigning,showSuccessModal);

@override
String toString() {
  return 'ContractDetailsState(status: $status, isSigning: $isSigning, showSuccessModal: $showSuccessModal)';
}


}

/// @nodoc
abstract mixin class _$ContractDetailsStateCopyWith<$Res> implements $ContractDetailsStateCopyWith<$Res> {
  factory _$ContractDetailsStateCopyWith(_ContractDetailsState value, $Res Function(_ContractDetailsState) _then) = __$ContractDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 ContractStatus status, bool isSigning, bool showSuccessModal
});




}
/// @nodoc
class __$ContractDetailsStateCopyWithImpl<$Res>
    implements _$ContractDetailsStateCopyWith<$Res> {
  __$ContractDetailsStateCopyWithImpl(this._self, this._then);

  final _ContractDetailsState _self;
  final $Res Function(_ContractDetailsState) _then;

/// Create a copy of ContractDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? isSigning = null,Object? showSuccessModal = null,}) {
  return _then(_ContractDetailsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContractStatus,isSigning: null == isSigning ? _self.isSigning : isSigning // ignore: cast_nullable_to_non_nullable
as bool,showSuccessModal: null == showSuccessModal ? _self.showSuccessModal : showSuccessModal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
