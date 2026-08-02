// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterState {

 String get name; String get bio; String get birthDate; int? get cityId; int? get typeId; int? get sportId; int? get dynamicId;// player position / referee role / coach specialization
 XFile? get avatarFile;// ─── Lookups ─────────────────────────────────────────────
 List<ParticipantTypeModel> get types; List<SportModel> get sports; List<CityModel> get cities; List<PlayerPositionModel> get positions; List<RefereeRoleModel> get refereeRoles; List<CoachSpecializationModel> get coachSpecs; RegisterStatus get optionsStatus; RegisterStatus get dynamicStatus;// ─── Validation / submit ─────────────────────────────────
 String? get nameError; String? get bioError; String? get avatarError; String? get birthDateError; String? get cityError; String? get sportError; String? get dynamicError; bool get isSubmitting; bool get isSuccess;
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterStateCopyWith<RegisterState> get copyWith => _$RegisterStateCopyWithImpl<RegisterState>(this as RegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState&&(identical(other.name, name) || other.name == name)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.dynamicId, dynamicId) || other.dynamicId == dynamicId)&&(identical(other.avatarFile, avatarFile) || other.avatarFile == avatarFile)&&const DeepCollectionEquality().equals(other.types, types)&&const DeepCollectionEquality().equals(other.sports, sports)&&const DeepCollectionEquality().equals(other.cities, cities)&&const DeepCollectionEquality().equals(other.positions, positions)&&const DeepCollectionEquality().equals(other.refereeRoles, refereeRoles)&&const DeepCollectionEquality().equals(other.coachSpecs, coachSpecs)&&(identical(other.optionsStatus, optionsStatus) || other.optionsStatus == optionsStatus)&&(identical(other.dynamicStatus, dynamicStatus) || other.dynamicStatus == dynamicStatus)&&(identical(other.nameError, nameError) || other.nameError == nameError)&&(identical(other.bioError, bioError) || other.bioError == bioError)&&(identical(other.avatarError, avatarError) || other.avatarError == avatarError)&&(identical(other.birthDateError, birthDateError) || other.birthDateError == birthDateError)&&(identical(other.cityError, cityError) || other.cityError == cityError)&&(identical(other.sportError, sportError) || other.sportError == sportError)&&(identical(other.dynamicError, dynamicError) || other.dynamicError == dynamicError)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hashAll([runtimeType,name,bio,birthDate,cityId,typeId,sportId,dynamicId,avatarFile,const DeepCollectionEquality().hash(types),const DeepCollectionEquality().hash(sports),const DeepCollectionEquality().hash(cities),const DeepCollectionEquality().hash(positions),const DeepCollectionEquality().hash(refereeRoles),const DeepCollectionEquality().hash(coachSpecs),optionsStatus,dynamicStatus,nameError,bioError,avatarError,birthDateError,cityError,sportError,dynamicError,isSubmitting,isSuccess]);

@override
String toString() {
  return 'RegisterState(name: $name, bio: $bio, birthDate: $birthDate, cityId: $cityId, typeId: $typeId, sportId: $sportId, dynamicId: $dynamicId, avatarFile: $avatarFile, types: $types, sports: $sports, cities: $cities, positions: $positions, refereeRoles: $refereeRoles, coachSpecs: $coachSpecs, optionsStatus: $optionsStatus, dynamicStatus: $dynamicStatus, nameError: $nameError, bioError: $bioError, avatarError: $avatarError, birthDateError: $birthDateError, cityError: $cityError, sportError: $sportError, dynamicError: $dynamicError, isSubmitting: $isSubmitting, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<$Res>  {
  factory $RegisterStateCopyWith(RegisterState value, $Res Function(RegisterState) _then) = _$RegisterStateCopyWithImpl;
@useResult
$Res call({
 String name, String bio, String birthDate, int? cityId, int? typeId, int? sportId, int? dynamicId, XFile? avatarFile, List<ParticipantTypeModel> types, List<SportModel> sports, List<CityModel> cities, List<PlayerPositionModel> positions, List<RefereeRoleModel> refereeRoles, List<CoachSpecializationModel> coachSpecs, RegisterStatus optionsStatus, RegisterStatus dynamicStatus, String? nameError, String? bioError, String? avatarError, String? birthDateError, String? cityError, String? sportError, String? dynamicError, bool isSubmitting, bool isSuccess
});


$RegisterStatusCopyWith<$Res> get optionsStatus;$RegisterStatusCopyWith<$Res> get dynamicStatus;

}
/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._self, this._then);

  final RegisterState _self;
  final $Res Function(RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? bio = null,Object? birthDate = null,Object? cityId = freezed,Object? typeId = freezed,Object? sportId = freezed,Object? dynamicId = freezed,Object? avatarFile = freezed,Object? types = null,Object? sports = null,Object? cities = null,Object? positions = null,Object? refereeRoles = null,Object? coachSpecs = null,Object? optionsStatus = null,Object? dynamicStatus = null,Object? nameError = freezed,Object? bioError = freezed,Object? avatarError = freezed,Object? birthDateError = freezed,Object? cityError = freezed,Object? sportError = freezed,Object? dynamicError = freezed,Object? isSubmitting = null,Object? isSuccess = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int?,sportId: freezed == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int?,dynamicId: freezed == dynamicId ? _self.dynamicId : dynamicId // ignore: cast_nullable_to_non_nullable
as int?,avatarFile: freezed == avatarFile ? _self.avatarFile : avatarFile // ignore: cast_nullable_to_non_nullable
as XFile?,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<ParticipantTypeModel>,sports: null == sports ? _self.sports : sports // ignore: cast_nullable_to_non_nullable
as List<SportModel>,cities: null == cities ? _self.cities : cities // ignore: cast_nullable_to_non_nullable
as List<CityModel>,positions: null == positions ? _self.positions : positions // ignore: cast_nullable_to_non_nullable
as List<PlayerPositionModel>,refereeRoles: null == refereeRoles ? _self.refereeRoles : refereeRoles // ignore: cast_nullable_to_non_nullable
as List<RefereeRoleModel>,coachSpecs: null == coachSpecs ? _self.coachSpecs : coachSpecs // ignore: cast_nullable_to_non_nullable
as List<CoachSpecializationModel>,optionsStatus: null == optionsStatus ? _self.optionsStatus : optionsStatus // ignore: cast_nullable_to_non_nullable
as RegisterStatus,dynamicStatus: null == dynamicStatus ? _self.dynamicStatus : dynamicStatus // ignore: cast_nullable_to_non_nullable
as RegisterStatus,nameError: freezed == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String?,bioError: freezed == bioError ? _self.bioError : bioError // ignore: cast_nullable_to_non_nullable
as String?,avatarError: freezed == avatarError ? _self.avatarError : avatarError // ignore: cast_nullable_to_non_nullable
as String?,birthDateError: freezed == birthDateError ? _self.birthDateError : birthDateError // ignore: cast_nullable_to_non_nullable
as String?,cityError: freezed == cityError ? _self.cityError : cityError // ignore: cast_nullable_to_non_nullable
as String?,sportError: freezed == sportError ? _self.sportError : sportError // ignore: cast_nullable_to_non_nullable
as String?,dynamicError: freezed == dynamicError ? _self.dynamicError : dynamicError // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterStatusCopyWith<$Res> get optionsStatus {
  
  return $RegisterStatusCopyWith<$Res>(_self.optionsStatus, (value) {
    return _then(_self.copyWith(optionsStatus: value));
  });
}/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterStatusCopyWith<$Res> get dynamicStatus {
  
  return $RegisterStatusCopyWith<$Res>(_self.dynamicStatus, (value) {
    return _then(_self.copyWith(dynamicStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns on RegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterState value)  $default,){
final _that = this;
switch (_that) {
case _RegisterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterState value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String bio,  String birthDate,  int? cityId,  int? typeId,  int? sportId,  int? dynamicId,  XFile? avatarFile,  List<ParticipantTypeModel> types,  List<SportModel> sports,  List<CityModel> cities,  List<PlayerPositionModel> positions,  List<RefereeRoleModel> refereeRoles,  List<CoachSpecializationModel> coachSpecs,  RegisterStatus optionsStatus,  RegisterStatus dynamicStatus,  String? nameError,  String? bioError,  String? avatarError,  String? birthDateError,  String? cityError,  String? sportError,  String? dynamicError,  bool isSubmitting,  bool isSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
return $default(_that.name,_that.bio,_that.birthDate,_that.cityId,_that.typeId,_that.sportId,_that.dynamicId,_that.avatarFile,_that.types,_that.sports,_that.cities,_that.positions,_that.refereeRoles,_that.coachSpecs,_that.optionsStatus,_that.dynamicStatus,_that.nameError,_that.bioError,_that.avatarError,_that.birthDateError,_that.cityError,_that.sportError,_that.dynamicError,_that.isSubmitting,_that.isSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String bio,  String birthDate,  int? cityId,  int? typeId,  int? sportId,  int? dynamicId,  XFile? avatarFile,  List<ParticipantTypeModel> types,  List<SportModel> sports,  List<CityModel> cities,  List<PlayerPositionModel> positions,  List<RefereeRoleModel> refereeRoles,  List<CoachSpecializationModel> coachSpecs,  RegisterStatus optionsStatus,  RegisterStatus dynamicStatus,  String? nameError,  String? bioError,  String? avatarError,  String? birthDateError,  String? cityError,  String? sportError,  String? dynamicError,  bool isSubmitting,  bool isSuccess)  $default,) {final _that = this;
switch (_that) {
case _RegisterState():
return $default(_that.name,_that.bio,_that.birthDate,_that.cityId,_that.typeId,_that.sportId,_that.dynamicId,_that.avatarFile,_that.types,_that.sports,_that.cities,_that.positions,_that.refereeRoles,_that.coachSpecs,_that.optionsStatus,_that.dynamicStatus,_that.nameError,_that.bioError,_that.avatarError,_that.birthDateError,_that.cityError,_that.sportError,_that.dynamicError,_that.isSubmitting,_that.isSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String bio,  String birthDate,  int? cityId,  int? typeId,  int? sportId,  int? dynamicId,  XFile? avatarFile,  List<ParticipantTypeModel> types,  List<SportModel> sports,  List<CityModel> cities,  List<PlayerPositionModel> positions,  List<RefereeRoleModel> refereeRoles,  List<CoachSpecializationModel> coachSpecs,  RegisterStatus optionsStatus,  RegisterStatus dynamicStatus,  String? nameError,  String? bioError,  String? avatarError,  String? birthDateError,  String? cityError,  String? sportError,  String? dynamicError,  bool isSubmitting,  bool isSuccess)?  $default,) {final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
return $default(_that.name,_that.bio,_that.birthDate,_that.cityId,_that.typeId,_that.sportId,_that.dynamicId,_that.avatarFile,_that.types,_that.sports,_that.cities,_that.positions,_that.refereeRoles,_that.coachSpecs,_that.optionsStatus,_that.dynamicStatus,_that.nameError,_that.bioError,_that.avatarError,_that.birthDateError,_that.cityError,_that.sportError,_that.dynamicError,_that.isSubmitting,_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterState extends RegisterState {
  const _RegisterState({this.name = '', this.bio = '', this.birthDate = '', this.cityId, this.typeId, this.sportId, this.dynamicId, this.avatarFile, final  List<ParticipantTypeModel> types = const [], final  List<SportModel> sports = const [], final  List<CityModel> cities = const [], final  List<PlayerPositionModel> positions = const [], final  List<RefereeRoleModel> refereeRoles = const [], final  List<CoachSpecializationModel> coachSpecs = const [], this.optionsStatus = const RegisterStatus.initial(), this.dynamicStatus = const RegisterStatus.initial(), this.nameError, this.bioError, this.avatarError, this.birthDateError, this.cityError, this.sportError, this.dynamicError, this.isSubmitting = false, this.isSuccess = false}): _types = types,_sports = sports,_cities = cities,_positions = positions,_refereeRoles = refereeRoles,_coachSpecs = coachSpecs,super._();
  

@override@JsonKey() final  String name;
@override@JsonKey() final  String bio;
@override@JsonKey() final  String birthDate;
@override final  int? cityId;
@override final  int? typeId;
@override final  int? sportId;
@override final  int? dynamicId;
// player position / referee role / coach specialization
@override final  XFile? avatarFile;
// ─── Lookups ─────────────────────────────────────────────
 final  List<ParticipantTypeModel> _types;
// ─── Lookups ─────────────────────────────────────────────
@override@JsonKey() List<ParticipantTypeModel> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}

 final  List<SportModel> _sports;
@override@JsonKey() List<SportModel> get sports {
  if (_sports is EqualUnmodifiableListView) return _sports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sports);
}

 final  List<CityModel> _cities;
@override@JsonKey() List<CityModel> get cities {
  if (_cities is EqualUnmodifiableListView) return _cities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cities);
}

 final  List<PlayerPositionModel> _positions;
@override@JsonKey() List<PlayerPositionModel> get positions {
  if (_positions is EqualUnmodifiableListView) return _positions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_positions);
}

 final  List<RefereeRoleModel> _refereeRoles;
@override@JsonKey() List<RefereeRoleModel> get refereeRoles {
  if (_refereeRoles is EqualUnmodifiableListView) return _refereeRoles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_refereeRoles);
}

 final  List<CoachSpecializationModel> _coachSpecs;
@override@JsonKey() List<CoachSpecializationModel> get coachSpecs {
  if (_coachSpecs is EqualUnmodifiableListView) return _coachSpecs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coachSpecs);
}

@override@JsonKey() final  RegisterStatus optionsStatus;
@override@JsonKey() final  RegisterStatus dynamicStatus;
// ─── Validation / submit ─────────────────────────────────
@override final  String? nameError;
@override final  String? bioError;
@override final  String? avatarError;
@override final  String? birthDateError;
@override final  String? cityError;
@override final  String? sportError;
@override final  String? dynamicError;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isSuccess;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterStateCopyWith<_RegisterState> get copyWith => __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterState&&(identical(other.name, name) || other.name == name)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.dynamicId, dynamicId) || other.dynamicId == dynamicId)&&(identical(other.avatarFile, avatarFile) || other.avatarFile == avatarFile)&&const DeepCollectionEquality().equals(other._types, _types)&&const DeepCollectionEquality().equals(other._sports, _sports)&&const DeepCollectionEquality().equals(other._cities, _cities)&&const DeepCollectionEquality().equals(other._positions, _positions)&&const DeepCollectionEquality().equals(other._refereeRoles, _refereeRoles)&&const DeepCollectionEquality().equals(other._coachSpecs, _coachSpecs)&&(identical(other.optionsStatus, optionsStatus) || other.optionsStatus == optionsStatus)&&(identical(other.dynamicStatus, dynamicStatus) || other.dynamicStatus == dynamicStatus)&&(identical(other.nameError, nameError) || other.nameError == nameError)&&(identical(other.bioError, bioError) || other.bioError == bioError)&&(identical(other.avatarError, avatarError) || other.avatarError == avatarError)&&(identical(other.birthDateError, birthDateError) || other.birthDateError == birthDateError)&&(identical(other.cityError, cityError) || other.cityError == cityError)&&(identical(other.sportError, sportError) || other.sportError == sportError)&&(identical(other.dynamicError, dynamicError) || other.dynamicError == dynamicError)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hashAll([runtimeType,name,bio,birthDate,cityId,typeId,sportId,dynamicId,avatarFile,const DeepCollectionEquality().hash(_types),const DeepCollectionEquality().hash(_sports),const DeepCollectionEquality().hash(_cities),const DeepCollectionEquality().hash(_positions),const DeepCollectionEquality().hash(_refereeRoles),const DeepCollectionEquality().hash(_coachSpecs),optionsStatus,dynamicStatus,nameError,bioError,avatarError,birthDateError,cityError,sportError,dynamicError,isSubmitting,isSuccess]);

@override
String toString() {
  return 'RegisterState(name: $name, bio: $bio, birthDate: $birthDate, cityId: $cityId, typeId: $typeId, sportId: $sportId, dynamicId: $dynamicId, avatarFile: $avatarFile, types: $types, sports: $sports, cities: $cities, positions: $positions, refereeRoles: $refereeRoles, coachSpecs: $coachSpecs, optionsStatus: $optionsStatus, dynamicStatus: $dynamicStatus, nameError: $nameError, bioError: $bioError, avatarError: $avatarError, birthDateError: $birthDateError, cityError: $cityError, sportError: $sportError, dynamicError: $dynamicError, isSubmitting: $isSubmitting, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$RegisterStateCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(_RegisterState value, $Res Function(_RegisterState) _then) = __$RegisterStateCopyWithImpl;
@override @useResult
$Res call({
 String name, String bio, String birthDate, int? cityId, int? typeId, int? sportId, int? dynamicId, XFile? avatarFile, List<ParticipantTypeModel> types, List<SportModel> sports, List<CityModel> cities, List<PlayerPositionModel> positions, List<RefereeRoleModel> refereeRoles, List<CoachSpecializationModel> coachSpecs, RegisterStatus optionsStatus, RegisterStatus dynamicStatus, String? nameError, String? bioError, String? avatarError, String? birthDateError, String? cityError, String? sportError, String? dynamicError, bool isSubmitting, bool isSuccess
});


@override $RegisterStatusCopyWith<$Res> get optionsStatus;@override $RegisterStatusCopyWith<$Res> get dynamicStatus;

}
/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(this._self, this._then);

  final _RegisterState _self;
  final $Res Function(_RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? bio = null,Object? birthDate = null,Object? cityId = freezed,Object? typeId = freezed,Object? sportId = freezed,Object? dynamicId = freezed,Object? avatarFile = freezed,Object? types = null,Object? sports = null,Object? cities = null,Object? positions = null,Object? refereeRoles = null,Object? coachSpecs = null,Object? optionsStatus = null,Object? dynamicStatus = null,Object? nameError = freezed,Object? bioError = freezed,Object? avatarError = freezed,Object? birthDateError = freezed,Object? cityError = freezed,Object? sportError = freezed,Object? dynamicError = freezed,Object? isSubmitting = null,Object? isSuccess = null,}) {
  return _then(_RegisterState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int?,sportId: freezed == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int?,dynamicId: freezed == dynamicId ? _self.dynamicId : dynamicId // ignore: cast_nullable_to_non_nullable
as int?,avatarFile: freezed == avatarFile ? _self.avatarFile : avatarFile // ignore: cast_nullable_to_non_nullable
as XFile?,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<ParticipantTypeModel>,sports: null == sports ? _self._sports : sports // ignore: cast_nullable_to_non_nullable
as List<SportModel>,cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<CityModel>,positions: null == positions ? _self._positions : positions // ignore: cast_nullable_to_non_nullable
as List<PlayerPositionModel>,refereeRoles: null == refereeRoles ? _self._refereeRoles : refereeRoles // ignore: cast_nullable_to_non_nullable
as List<RefereeRoleModel>,coachSpecs: null == coachSpecs ? _self._coachSpecs : coachSpecs // ignore: cast_nullable_to_non_nullable
as List<CoachSpecializationModel>,optionsStatus: null == optionsStatus ? _self.optionsStatus : optionsStatus // ignore: cast_nullable_to_non_nullable
as RegisterStatus,dynamicStatus: null == dynamicStatus ? _self.dynamicStatus : dynamicStatus // ignore: cast_nullable_to_non_nullable
as RegisterStatus,nameError: freezed == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String?,bioError: freezed == bioError ? _self.bioError : bioError // ignore: cast_nullable_to_non_nullable
as String?,avatarError: freezed == avatarError ? _self.avatarError : avatarError // ignore: cast_nullable_to_non_nullable
as String?,birthDateError: freezed == birthDateError ? _self.birthDateError : birthDateError // ignore: cast_nullable_to_non_nullable
as String?,cityError: freezed == cityError ? _self.cityError : cityError // ignore: cast_nullable_to_non_nullable
as String?,sportError: freezed == sportError ? _self.sportError : sportError // ignore: cast_nullable_to_non_nullable
as String?,dynamicError: freezed == dynamicError ? _self.dynamicError : dynamicError // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterStatusCopyWith<$Res> get optionsStatus {
  
  return $RegisterStatusCopyWith<$Res>(_self.optionsStatus, (value) {
    return _then(_self.copyWith(optionsStatus: value));
  });
}/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterStatusCopyWith<$Res> get dynamicStatus {
  
  return $RegisterStatusCopyWith<$Res>(_self.dynamicStatus, (value) {
    return _then(_self.copyWith(dynamicStatus: value));
  });
}
}

/// @nodoc
mixin _$RegisterStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterStatus()';
}


}

/// @nodoc
class $RegisterStatusCopyWith<$Res>  {
$RegisterStatusCopyWith(RegisterStatus _, $Res Function(RegisterStatus) __);
}


/// Adds pattern-matching-related methods to [RegisterStatus].
extension RegisterStatusPatterns on RegisterStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RegisterStatusInitial value)?  initial,TResult Function( RegisterStatusLoading value)?  loading,TResult Function( RegisterStatusSuccess value)?  success,TResult Function( RegisterStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RegisterStatusInitial() when initial != null:
return initial(_that);case RegisterStatusLoading() when loading != null:
return loading(_that);case RegisterStatusSuccess() when success != null:
return success(_that);case RegisterStatusError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RegisterStatusInitial value)  initial,required TResult Function( RegisterStatusLoading value)  loading,required TResult Function( RegisterStatusSuccess value)  success,required TResult Function( RegisterStatusError value)  error,}){
final _that = this;
switch (_that) {
case RegisterStatusInitial():
return initial(_that);case RegisterStatusLoading():
return loading(_that);case RegisterStatusSuccess():
return success(_that);case RegisterStatusError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RegisterStatusInitial value)?  initial,TResult? Function( RegisterStatusLoading value)?  loading,TResult? Function( RegisterStatusSuccess value)?  success,TResult? Function( RegisterStatusError value)?  error,}){
final _that = this;
switch (_that) {
case RegisterStatusInitial() when initial != null:
return initial(_that);case RegisterStatusLoading() when loading != null:
return loading(_that);case RegisterStatusSuccess() when success != null:
return success(_that);case RegisterStatusError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RegisterStatusInitial() when initial != null:
return initial();case RegisterStatusLoading() when loading != null:
return loading();case RegisterStatusSuccess() when success != null:
return success();case RegisterStatusError() when error != null:
return error();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case RegisterStatusInitial():
return initial();case RegisterStatusLoading():
return loading();case RegisterStatusSuccess():
return success();case RegisterStatusError():
return error();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case RegisterStatusInitial() when initial != null:
return initial();case RegisterStatusLoading() when loading != null:
return loading();case RegisterStatusSuccess() when success != null:
return success();case RegisterStatusError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class RegisterStatusInitial implements RegisterStatus {
  const RegisterStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterStatus.initial()';
}


}




/// @nodoc


class RegisterStatusLoading implements RegisterStatus {
  const RegisterStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterStatus.loading()';
}


}




/// @nodoc


class RegisterStatusSuccess implements RegisterStatus {
  const RegisterStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterStatus.success()';
}


}




/// @nodoc


class RegisterStatusError implements RegisterStatus {
  const RegisterStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterStatus.error()';
}


}




// dart format on
