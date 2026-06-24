// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'championship_register_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChampionshipRegisterState {

 ParticipantRole get selectedRole; String get fullName; String get phone; String get region; bool get isLoading; bool get isSuccess;
/// Create a copy of ChampionshipRegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChampionshipRegisterStateCopyWith<ChampionshipRegisterState> get copyWith => _$ChampionshipRegisterStateCopyWithImpl<ChampionshipRegisterState>(this as ChampionshipRegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampionshipRegisterState&&(identical(other.selectedRole, selectedRole) || other.selectedRole == selectedRole)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.region, region) || other.region == region)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,selectedRole,fullName,phone,region,isLoading,isSuccess);

@override
String toString() {
  return 'ChampionshipRegisterState(selectedRole: $selectedRole, fullName: $fullName, phone: $phone, region: $region, isLoading: $isLoading, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class $ChampionshipRegisterStateCopyWith<$Res>  {
  factory $ChampionshipRegisterStateCopyWith(ChampionshipRegisterState value, $Res Function(ChampionshipRegisterState) _then) = _$ChampionshipRegisterStateCopyWithImpl;
@useResult
$Res call({
 ParticipantRole selectedRole, String fullName, String phone, String region, bool isLoading, bool isSuccess
});




}
/// @nodoc
class _$ChampionshipRegisterStateCopyWithImpl<$Res>
    implements $ChampionshipRegisterStateCopyWith<$Res> {
  _$ChampionshipRegisterStateCopyWithImpl(this._self, this._then);

  final ChampionshipRegisterState _self;
  final $Res Function(ChampionshipRegisterState) _then;

/// Create a copy of ChampionshipRegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedRole = null,Object? fullName = null,Object? phone = null,Object? region = null,Object? isLoading = null,Object? isSuccess = null,}) {
  return _then(_self.copyWith(
selectedRole: null == selectedRole ? _self.selectedRole : selectedRole // ignore: cast_nullable_to_non_nullable
as ParticipantRole,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChampionshipRegisterState].
extension ChampionshipRegisterStatePatterns on ChampionshipRegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChampionshipRegisterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChampionshipRegisterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChampionshipRegisterState value)  $default,){
final _that = this;
switch (_that) {
case _ChampionshipRegisterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChampionshipRegisterState value)?  $default,){
final _that = this;
switch (_that) {
case _ChampionshipRegisterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ParticipantRole selectedRole,  String fullName,  String phone,  String region,  bool isLoading,  bool isSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChampionshipRegisterState() when $default != null:
return $default(_that.selectedRole,_that.fullName,_that.phone,_that.region,_that.isLoading,_that.isSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ParticipantRole selectedRole,  String fullName,  String phone,  String region,  bool isLoading,  bool isSuccess)  $default,) {final _that = this;
switch (_that) {
case _ChampionshipRegisterState():
return $default(_that.selectedRole,_that.fullName,_that.phone,_that.region,_that.isLoading,_that.isSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ParticipantRole selectedRole,  String fullName,  String phone,  String region,  bool isLoading,  bool isSuccess)?  $default,) {final _that = this;
switch (_that) {
case _ChampionshipRegisterState() when $default != null:
return $default(_that.selectedRole,_that.fullName,_that.phone,_that.region,_that.isLoading,_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _ChampionshipRegisterState implements ChampionshipRegisterState {
  const _ChampionshipRegisterState({this.selectedRole = ParticipantRole.player, this.fullName = '', this.phone = '', this.region = '', this.isLoading = false, this.isSuccess = false});
  

@override@JsonKey() final  ParticipantRole selectedRole;
@override@JsonKey() final  String fullName;
@override@JsonKey() final  String phone;
@override@JsonKey() final  String region;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;

/// Create a copy of ChampionshipRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChampionshipRegisterStateCopyWith<_ChampionshipRegisterState> get copyWith => __$ChampionshipRegisterStateCopyWithImpl<_ChampionshipRegisterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChampionshipRegisterState&&(identical(other.selectedRole, selectedRole) || other.selectedRole == selectedRole)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.region, region) || other.region == region)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,selectedRole,fullName,phone,region,isLoading,isSuccess);

@override
String toString() {
  return 'ChampionshipRegisterState(selectedRole: $selectedRole, fullName: $fullName, phone: $phone, region: $region, isLoading: $isLoading, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$ChampionshipRegisterStateCopyWith<$Res> implements $ChampionshipRegisterStateCopyWith<$Res> {
  factory _$ChampionshipRegisterStateCopyWith(_ChampionshipRegisterState value, $Res Function(_ChampionshipRegisterState) _then) = __$ChampionshipRegisterStateCopyWithImpl;
@override @useResult
$Res call({
 ParticipantRole selectedRole, String fullName, String phone, String region, bool isLoading, bool isSuccess
});




}
/// @nodoc
class __$ChampionshipRegisterStateCopyWithImpl<$Res>
    implements _$ChampionshipRegisterStateCopyWith<$Res> {
  __$ChampionshipRegisterStateCopyWithImpl(this._self, this._then);

  final _ChampionshipRegisterState _self;
  final $Res Function(_ChampionshipRegisterState) _then;

/// Create a copy of ChampionshipRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedRole = null,Object? fullName = null,Object? phone = null,Object? region = null,Object? isLoading = null,Object? isSuccess = null,}) {
  return _then(_ChampionshipRegisterState(
selectedRole: null == selectedRole ? _self.selectedRole : selectedRole // ignore: cast_nullable_to_non_nullable
as ParticipantRole,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
