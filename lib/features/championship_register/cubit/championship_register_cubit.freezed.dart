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

// ─── Options ─────────────────────────────────────────────
 List<ParticipantTypeModel> get participantTypes; List<CityModel> get cities; int? get selectedParticipantTypeId; int? get selectedCityId; ChampionshipRegisterOptionsStatus get optionsStatus;// ─── Form ────────────────────────────────────────────────
 String get fullName; String get phone;// ─── Submit ──────────────────────────────────────────────
 bool get isLoading; bool get isSuccess;
/// Create a copy of ChampionshipRegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChampionshipRegisterStateCopyWith<ChampionshipRegisterState> get copyWith => _$ChampionshipRegisterStateCopyWithImpl<ChampionshipRegisterState>(this as ChampionshipRegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampionshipRegisterState&&const DeepCollectionEquality().equals(other.participantTypes, participantTypes)&&const DeepCollectionEquality().equals(other.cities, cities)&&(identical(other.selectedParticipantTypeId, selectedParticipantTypeId) || other.selectedParticipantTypeId == selectedParticipantTypeId)&&(identical(other.selectedCityId, selectedCityId) || other.selectedCityId == selectedCityId)&&(identical(other.optionsStatus, optionsStatus) || other.optionsStatus == optionsStatus)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(participantTypes),const DeepCollectionEquality().hash(cities),selectedParticipantTypeId,selectedCityId,optionsStatus,fullName,phone,isLoading,isSuccess);

@override
String toString() {
  return 'ChampionshipRegisterState(participantTypes: $participantTypes, cities: $cities, selectedParticipantTypeId: $selectedParticipantTypeId, selectedCityId: $selectedCityId, optionsStatus: $optionsStatus, fullName: $fullName, phone: $phone, isLoading: $isLoading, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class $ChampionshipRegisterStateCopyWith<$Res>  {
  factory $ChampionshipRegisterStateCopyWith(ChampionshipRegisterState value, $Res Function(ChampionshipRegisterState) _then) = _$ChampionshipRegisterStateCopyWithImpl;
@useResult
$Res call({
 List<ParticipantTypeModel> participantTypes, List<CityModel> cities, int? selectedParticipantTypeId, int? selectedCityId, ChampionshipRegisterOptionsStatus optionsStatus, String fullName, String phone, bool isLoading, bool isSuccess
});


$ChampionshipRegisterOptionsStatusCopyWith<$Res> get optionsStatus;

}
/// @nodoc
class _$ChampionshipRegisterStateCopyWithImpl<$Res>
    implements $ChampionshipRegisterStateCopyWith<$Res> {
  _$ChampionshipRegisterStateCopyWithImpl(this._self, this._then);

  final ChampionshipRegisterState _self;
  final $Res Function(ChampionshipRegisterState) _then;

/// Create a copy of ChampionshipRegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? participantTypes = null,Object? cities = null,Object? selectedParticipantTypeId = freezed,Object? selectedCityId = freezed,Object? optionsStatus = null,Object? fullName = null,Object? phone = null,Object? isLoading = null,Object? isSuccess = null,}) {
  return _then(_self.copyWith(
participantTypes: null == participantTypes ? _self.participantTypes : participantTypes // ignore: cast_nullable_to_non_nullable
as List<ParticipantTypeModel>,cities: null == cities ? _self.cities : cities // ignore: cast_nullable_to_non_nullable
as List<CityModel>,selectedParticipantTypeId: freezed == selectedParticipantTypeId ? _self.selectedParticipantTypeId : selectedParticipantTypeId // ignore: cast_nullable_to_non_nullable
as int?,selectedCityId: freezed == selectedCityId ? _self.selectedCityId : selectedCityId // ignore: cast_nullable_to_non_nullable
as int?,optionsStatus: null == optionsStatus ? _self.optionsStatus : optionsStatus // ignore: cast_nullable_to_non_nullable
as ChampionshipRegisterOptionsStatus,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ChampionshipRegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChampionshipRegisterOptionsStatusCopyWith<$Res> get optionsStatus {
  
  return $ChampionshipRegisterOptionsStatusCopyWith<$Res>(_self.optionsStatus, (value) {
    return _then(_self.copyWith(optionsStatus: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ParticipantTypeModel> participantTypes,  List<CityModel> cities,  int? selectedParticipantTypeId,  int? selectedCityId,  ChampionshipRegisterOptionsStatus optionsStatus,  String fullName,  String phone,  bool isLoading,  bool isSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChampionshipRegisterState() when $default != null:
return $default(_that.participantTypes,_that.cities,_that.selectedParticipantTypeId,_that.selectedCityId,_that.optionsStatus,_that.fullName,_that.phone,_that.isLoading,_that.isSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ParticipantTypeModel> participantTypes,  List<CityModel> cities,  int? selectedParticipantTypeId,  int? selectedCityId,  ChampionshipRegisterOptionsStatus optionsStatus,  String fullName,  String phone,  bool isLoading,  bool isSuccess)  $default,) {final _that = this;
switch (_that) {
case _ChampionshipRegisterState():
return $default(_that.participantTypes,_that.cities,_that.selectedParticipantTypeId,_that.selectedCityId,_that.optionsStatus,_that.fullName,_that.phone,_that.isLoading,_that.isSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ParticipantTypeModel> participantTypes,  List<CityModel> cities,  int? selectedParticipantTypeId,  int? selectedCityId,  ChampionshipRegisterOptionsStatus optionsStatus,  String fullName,  String phone,  bool isLoading,  bool isSuccess)?  $default,) {final _that = this;
switch (_that) {
case _ChampionshipRegisterState() when $default != null:
return $default(_that.participantTypes,_that.cities,_that.selectedParticipantTypeId,_that.selectedCityId,_that.optionsStatus,_that.fullName,_that.phone,_that.isLoading,_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _ChampionshipRegisterState implements ChampionshipRegisterState {
  const _ChampionshipRegisterState({final  List<ParticipantTypeModel> participantTypes = const [], final  List<CityModel> cities = const [], this.selectedParticipantTypeId, this.selectedCityId, this.optionsStatus = const ChampionshipRegisterOptionsStatus.initial(), this.fullName = '', this.phone = '', this.isLoading = false, this.isSuccess = false}): _participantTypes = participantTypes,_cities = cities;
  

// ─── Options ─────────────────────────────────────────────
 final  List<ParticipantTypeModel> _participantTypes;
// ─── Options ─────────────────────────────────────────────
@override@JsonKey() List<ParticipantTypeModel> get participantTypes {
  if (_participantTypes is EqualUnmodifiableListView) return _participantTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participantTypes);
}

 final  List<CityModel> _cities;
@override@JsonKey() List<CityModel> get cities {
  if (_cities is EqualUnmodifiableListView) return _cities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cities);
}

@override final  int? selectedParticipantTypeId;
@override final  int? selectedCityId;
@override@JsonKey() final  ChampionshipRegisterOptionsStatus optionsStatus;
// ─── Form ────────────────────────────────────────────────
@override@JsonKey() final  String fullName;
@override@JsonKey() final  String phone;
// ─── Submit ──────────────────────────────────────────────
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;

/// Create a copy of ChampionshipRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChampionshipRegisterStateCopyWith<_ChampionshipRegisterState> get copyWith => __$ChampionshipRegisterStateCopyWithImpl<_ChampionshipRegisterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChampionshipRegisterState&&const DeepCollectionEquality().equals(other._participantTypes, _participantTypes)&&const DeepCollectionEquality().equals(other._cities, _cities)&&(identical(other.selectedParticipantTypeId, selectedParticipantTypeId) || other.selectedParticipantTypeId == selectedParticipantTypeId)&&(identical(other.selectedCityId, selectedCityId) || other.selectedCityId == selectedCityId)&&(identical(other.optionsStatus, optionsStatus) || other.optionsStatus == optionsStatus)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_participantTypes),const DeepCollectionEquality().hash(_cities),selectedParticipantTypeId,selectedCityId,optionsStatus,fullName,phone,isLoading,isSuccess);

@override
String toString() {
  return 'ChampionshipRegisterState(participantTypes: $participantTypes, cities: $cities, selectedParticipantTypeId: $selectedParticipantTypeId, selectedCityId: $selectedCityId, optionsStatus: $optionsStatus, fullName: $fullName, phone: $phone, isLoading: $isLoading, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$ChampionshipRegisterStateCopyWith<$Res> implements $ChampionshipRegisterStateCopyWith<$Res> {
  factory _$ChampionshipRegisterStateCopyWith(_ChampionshipRegisterState value, $Res Function(_ChampionshipRegisterState) _then) = __$ChampionshipRegisterStateCopyWithImpl;
@override @useResult
$Res call({
 List<ParticipantTypeModel> participantTypes, List<CityModel> cities, int? selectedParticipantTypeId, int? selectedCityId, ChampionshipRegisterOptionsStatus optionsStatus, String fullName, String phone, bool isLoading, bool isSuccess
});


@override $ChampionshipRegisterOptionsStatusCopyWith<$Res> get optionsStatus;

}
/// @nodoc
class __$ChampionshipRegisterStateCopyWithImpl<$Res>
    implements _$ChampionshipRegisterStateCopyWith<$Res> {
  __$ChampionshipRegisterStateCopyWithImpl(this._self, this._then);

  final _ChampionshipRegisterState _self;
  final $Res Function(_ChampionshipRegisterState) _then;

/// Create a copy of ChampionshipRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? participantTypes = null,Object? cities = null,Object? selectedParticipantTypeId = freezed,Object? selectedCityId = freezed,Object? optionsStatus = null,Object? fullName = null,Object? phone = null,Object? isLoading = null,Object? isSuccess = null,}) {
  return _then(_ChampionshipRegisterState(
participantTypes: null == participantTypes ? _self._participantTypes : participantTypes // ignore: cast_nullable_to_non_nullable
as List<ParticipantTypeModel>,cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<CityModel>,selectedParticipantTypeId: freezed == selectedParticipantTypeId ? _self.selectedParticipantTypeId : selectedParticipantTypeId // ignore: cast_nullable_to_non_nullable
as int?,selectedCityId: freezed == selectedCityId ? _self.selectedCityId : selectedCityId // ignore: cast_nullable_to_non_nullable
as int?,optionsStatus: null == optionsStatus ? _self.optionsStatus : optionsStatus // ignore: cast_nullable_to_non_nullable
as ChampionshipRegisterOptionsStatus,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ChampionshipRegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChampionshipRegisterOptionsStatusCopyWith<$Res> get optionsStatus {
  
  return $ChampionshipRegisterOptionsStatusCopyWith<$Res>(_self.optionsStatus, (value) {
    return _then(_self.copyWith(optionsStatus: value));
  });
}
}

/// @nodoc
mixin _$ChampionshipRegisterOptionsStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampionshipRegisterOptionsStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampionshipRegisterOptionsStatus()';
}


}

/// @nodoc
class $ChampionshipRegisterOptionsStatusCopyWith<$Res>  {
$ChampionshipRegisterOptionsStatusCopyWith(ChampionshipRegisterOptionsStatus _, $Res Function(ChampionshipRegisterOptionsStatus) __);
}


/// Adds pattern-matching-related methods to [ChampionshipRegisterOptionsStatus].
extension ChampionshipRegisterOptionsStatusPatterns on ChampionshipRegisterOptionsStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Error value)?  error,TResult Function( Success value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Error() when error != null:
return error(_that);case Success() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Error value)  error,required TResult Function( Success value)  success,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Error():
return error(_that);case Success():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Error value)?  error,TResult? Function( Success value)?  success,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Error() when error != null:
return error(_that);case Success() when success != null:
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
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Error() when error != null:
return error();case Success() when success != null:
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
case Initial():
return initial();case Loading():
return loading();case Error():
return error();case Success():
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
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Error() when error != null:
return error();case Success() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class Initial implements ChampionshipRegisterOptionsStatus {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampionshipRegisterOptionsStatus.initial()';
}


}




/// @nodoc


class Loading implements ChampionshipRegisterOptionsStatus {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampionshipRegisterOptionsStatus.loading()';
}


}




/// @nodoc


class Error implements ChampionshipRegisterOptionsStatus {
  const Error();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampionshipRegisterOptionsStatus.error()';
}


}




/// @nodoc


class Success implements ChampionshipRegisterOptionsStatus {
  const Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampionshipRegisterOptionsStatus.success()';
}


}




// dart format on
