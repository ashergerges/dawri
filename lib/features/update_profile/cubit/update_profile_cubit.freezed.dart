// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateProfileState {

// ─── Editable fields (mirror the multipart body) ─────────
 String get name; String get email; String get birthDate; String get bio; int? get cityId; int? get dynamicId;// sport_position_id
// ─── Read-only context ───────────────────────────────────
 String get phone; String get avatarPath; bool get isLocalAvatar; XFile? get avatarFile;/// Participant type — decides which list the role dropdown shows.
 int? get typeId;/// Needed to scope player positions to the user's sport.
 int? get sportId;// ─── Lookups ─────────────────────────────────────────────
 List<CityModel> get cities; List<PlayerPositionModel> get positions; List<RefereeRoleModel> get refereeRoles; List<CoachSpecializationModel> get coachSpecs; UpdateProfileStatus get loadStatus; UpdateProfileStatus get dynamicStatus;// ─── Validation / submit ─────────────────────────────────
 String? get nameError; String? get emailError; String? get birthDateError; String? get cityError; String? get dynamicError; String? get bioError; String? get avatarError; bool get isPickingAvatar; bool get isUpdating; bool get isSuccess;
/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileStateCopyWith<UpdateProfileState> get copyWith => _$UpdateProfileStateCopyWithImpl<UpdateProfileState>(this as UpdateProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileState&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.dynamicId, dynamicId) || other.dynamicId == dynamicId)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.isLocalAvatar, isLocalAvatar) || other.isLocalAvatar == isLocalAvatar)&&(identical(other.avatarFile, avatarFile) || other.avatarFile == avatarFile)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&const DeepCollectionEquality().equals(other.cities, cities)&&const DeepCollectionEquality().equals(other.positions, positions)&&const DeepCollectionEquality().equals(other.refereeRoles, refereeRoles)&&const DeepCollectionEquality().equals(other.coachSpecs, coachSpecs)&&(identical(other.loadStatus, loadStatus) || other.loadStatus == loadStatus)&&(identical(other.dynamicStatus, dynamicStatus) || other.dynamicStatus == dynamicStatus)&&(identical(other.nameError, nameError) || other.nameError == nameError)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.birthDateError, birthDateError) || other.birthDateError == birthDateError)&&(identical(other.cityError, cityError) || other.cityError == cityError)&&(identical(other.dynamicError, dynamicError) || other.dynamicError == dynamicError)&&(identical(other.bioError, bioError) || other.bioError == bioError)&&(identical(other.avatarError, avatarError) || other.avatarError == avatarError)&&(identical(other.isPickingAvatar, isPickingAvatar) || other.isPickingAvatar == isPickingAvatar)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hashAll([runtimeType,name,email,birthDate,bio,cityId,dynamicId,phone,avatarPath,isLocalAvatar,avatarFile,typeId,sportId,const DeepCollectionEquality().hash(cities),const DeepCollectionEquality().hash(positions),const DeepCollectionEquality().hash(refereeRoles),const DeepCollectionEquality().hash(coachSpecs),loadStatus,dynamicStatus,nameError,emailError,birthDateError,cityError,dynamicError,bioError,avatarError,isPickingAvatar,isUpdating,isSuccess]);

@override
String toString() {
  return 'UpdateProfileState(name: $name, email: $email, birthDate: $birthDate, bio: $bio, cityId: $cityId, dynamicId: $dynamicId, phone: $phone, avatarPath: $avatarPath, isLocalAvatar: $isLocalAvatar, avatarFile: $avatarFile, typeId: $typeId, sportId: $sportId, cities: $cities, positions: $positions, refereeRoles: $refereeRoles, coachSpecs: $coachSpecs, loadStatus: $loadStatus, dynamicStatus: $dynamicStatus, nameError: $nameError, emailError: $emailError, birthDateError: $birthDateError, cityError: $cityError, dynamicError: $dynamicError, bioError: $bioError, avatarError: $avatarError, isPickingAvatar: $isPickingAvatar, isUpdating: $isUpdating, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileStateCopyWith<$Res>  {
  factory $UpdateProfileStateCopyWith(UpdateProfileState value, $Res Function(UpdateProfileState) _then) = _$UpdateProfileStateCopyWithImpl;
@useResult
$Res call({
 String name, String email, String birthDate, String bio, int? cityId, int? dynamicId, String phone, String avatarPath, bool isLocalAvatar, XFile? avatarFile, int? typeId, int? sportId, List<CityModel> cities, List<PlayerPositionModel> positions, List<RefereeRoleModel> refereeRoles, List<CoachSpecializationModel> coachSpecs, UpdateProfileStatus loadStatus, UpdateProfileStatus dynamicStatus, String? nameError, String? emailError, String? birthDateError, String? cityError, String? dynamicError, String? bioError, String? avatarError, bool isPickingAvatar, bool isUpdating, bool isSuccess
});


$UpdateProfileStatusCopyWith<$Res> get loadStatus;$UpdateProfileStatusCopyWith<$Res> get dynamicStatus;

}
/// @nodoc
class _$UpdateProfileStateCopyWithImpl<$Res>
    implements $UpdateProfileStateCopyWith<$Res> {
  _$UpdateProfileStateCopyWithImpl(this._self, this._then);

  final UpdateProfileState _self;
  final $Res Function(UpdateProfileState) _then;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? birthDate = null,Object? bio = null,Object? cityId = freezed,Object? dynamicId = freezed,Object? phone = null,Object? avatarPath = null,Object? isLocalAvatar = null,Object? avatarFile = freezed,Object? typeId = freezed,Object? sportId = freezed,Object? cities = null,Object? positions = null,Object? refereeRoles = null,Object? coachSpecs = null,Object? loadStatus = null,Object? dynamicStatus = null,Object? nameError = freezed,Object? emailError = freezed,Object? birthDateError = freezed,Object? cityError = freezed,Object? dynamicError = freezed,Object? bioError = freezed,Object? avatarError = freezed,Object? isPickingAvatar = null,Object? isUpdating = null,Object? isSuccess = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,dynamicId: freezed == dynamicId ? _self.dynamicId : dynamicId // ignore: cast_nullable_to_non_nullable
as int?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,avatarPath: null == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String,isLocalAvatar: null == isLocalAvatar ? _self.isLocalAvatar : isLocalAvatar // ignore: cast_nullable_to_non_nullable
as bool,avatarFile: freezed == avatarFile ? _self.avatarFile : avatarFile // ignore: cast_nullable_to_non_nullable
as XFile?,typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int?,sportId: freezed == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int?,cities: null == cities ? _self.cities : cities // ignore: cast_nullable_to_non_nullable
as List<CityModel>,positions: null == positions ? _self.positions : positions // ignore: cast_nullable_to_non_nullable
as List<PlayerPositionModel>,refereeRoles: null == refereeRoles ? _self.refereeRoles : refereeRoles // ignore: cast_nullable_to_non_nullable
as List<RefereeRoleModel>,coachSpecs: null == coachSpecs ? _self.coachSpecs : coachSpecs // ignore: cast_nullable_to_non_nullable
as List<CoachSpecializationModel>,loadStatus: null == loadStatus ? _self.loadStatus : loadStatus // ignore: cast_nullable_to_non_nullable
as UpdateProfileStatus,dynamicStatus: null == dynamicStatus ? _self.dynamicStatus : dynamicStatus // ignore: cast_nullable_to_non_nullable
as UpdateProfileStatus,nameError: freezed == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,birthDateError: freezed == birthDateError ? _self.birthDateError : birthDateError // ignore: cast_nullable_to_non_nullable
as String?,cityError: freezed == cityError ? _self.cityError : cityError // ignore: cast_nullable_to_non_nullable
as String?,dynamicError: freezed == dynamicError ? _self.dynamicError : dynamicError // ignore: cast_nullable_to_non_nullable
as String?,bioError: freezed == bioError ? _self.bioError : bioError // ignore: cast_nullable_to_non_nullable
as String?,avatarError: freezed == avatarError ? _self.avatarError : avatarError // ignore: cast_nullable_to_non_nullable
as String?,isPickingAvatar: null == isPickingAvatar ? _self.isPickingAvatar : isPickingAvatar // ignore: cast_nullable_to_non_nullable
as bool,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateProfileStatusCopyWith<$Res> get loadStatus {
  
  return $UpdateProfileStatusCopyWith<$Res>(_self.loadStatus, (value) {
    return _then(_self.copyWith(loadStatus: value));
  });
}/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateProfileStatusCopyWith<$Res> get dynamicStatus {
  
  return $UpdateProfileStatusCopyWith<$Res>(_self.dynamicStatus, (value) {
    return _then(_self.copyWith(dynamicStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateProfileState].
extension UpdateProfileStatePatterns on UpdateProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateProfileState value)  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String birthDate,  String bio,  int? cityId,  int? dynamicId,  String phone,  String avatarPath,  bool isLocalAvatar,  XFile? avatarFile,  int? typeId,  int? sportId,  List<CityModel> cities,  List<PlayerPositionModel> positions,  List<RefereeRoleModel> refereeRoles,  List<CoachSpecializationModel> coachSpecs,  UpdateProfileStatus loadStatus,  UpdateProfileStatus dynamicStatus,  String? nameError,  String? emailError,  String? birthDateError,  String? cityError,  String? dynamicError,  String? bioError,  String? avatarError,  bool isPickingAvatar,  bool isUpdating,  bool isSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProfileState() when $default != null:
return $default(_that.name,_that.email,_that.birthDate,_that.bio,_that.cityId,_that.dynamicId,_that.phone,_that.avatarPath,_that.isLocalAvatar,_that.avatarFile,_that.typeId,_that.sportId,_that.cities,_that.positions,_that.refereeRoles,_that.coachSpecs,_that.loadStatus,_that.dynamicStatus,_that.nameError,_that.emailError,_that.birthDateError,_that.cityError,_that.dynamicError,_that.bioError,_that.avatarError,_that.isPickingAvatar,_that.isUpdating,_that.isSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String birthDate,  String bio,  int? cityId,  int? dynamicId,  String phone,  String avatarPath,  bool isLocalAvatar,  XFile? avatarFile,  int? typeId,  int? sportId,  List<CityModel> cities,  List<PlayerPositionModel> positions,  List<RefereeRoleModel> refereeRoles,  List<CoachSpecializationModel> coachSpecs,  UpdateProfileStatus loadStatus,  UpdateProfileStatus dynamicStatus,  String? nameError,  String? emailError,  String? birthDateError,  String? cityError,  String? dynamicError,  String? bioError,  String? avatarError,  bool isPickingAvatar,  bool isUpdating,  bool isSuccess)  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileState():
return $default(_that.name,_that.email,_that.birthDate,_that.bio,_that.cityId,_that.dynamicId,_that.phone,_that.avatarPath,_that.isLocalAvatar,_that.avatarFile,_that.typeId,_that.sportId,_that.cities,_that.positions,_that.refereeRoles,_that.coachSpecs,_that.loadStatus,_that.dynamicStatus,_that.nameError,_that.emailError,_that.birthDateError,_that.cityError,_that.dynamicError,_that.bioError,_that.avatarError,_that.isPickingAvatar,_that.isUpdating,_that.isSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String birthDate,  String bio,  int? cityId,  int? dynamicId,  String phone,  String avatarPath,  bool isLocalAvatar,  XFile? avatarFile,  int? typeId,  int? sportId,  List<CityModel> cities,  List<PlayerPositionModel> positions,  List<RefereeRoleModel> refereeRoles,  List<CoachSpecializationModel> coachSpecs,  UpdateProfileStatus loadStatus,  UpdateProfileStatus dynamicStatus,  String? nameError,  String? emailError,  String? birthDateError,  String? cityError,  String? dynamicError,  String? bioError,  String? avatarError,  bool isPickingAvatar,  bool isUpdating,  bool isSuccess)?  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileState() when $default != null:
return $default(_that.name,_that.email,_that.birthDate,_that.bio,_that.cityId,_that.dynamicId,_that.phone,_that.avatarPath,_that.isLocalAvatar,_that.avatarFile,_that.typeId,_that.sportId,_that.cities,_that.positions,_that.refereeRoles,_that.coachSpecs,_that.loadStatus,_that.dynamicStatus,_that.nameError,_that.emailError,_that.birthDateError,_that.cityError,_that.dynamicError,_that.bioError,_that.avatarError,_that.isPickingAvatar,_that.isUpdating,_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _UpdateProfileState extends UpdateProfileState {
  const _UpdateProfileState({this.name = '', this.email = '', this.birthDate = '', this.bio = '', this.cityId, this.dynamicId, this.phone = '', this.avatarPath = '', this.isLocalAvatar = false, this.avatarFile, this.typeId, this.sportId, final  List<CityModel> cities = const [], final  List<PlayerPositionModel> positions = const [], final  List<RefereeRoleModel> refereeRoles = const [], final  List<CoachSpecializationModel> coachSpecs = const [], this.loadStatus = const UpdateProfileStatus.initial(), this.dynamicStatus = const UpdateProfileStatus.initial(), this.nameError, this.emailError, this.birthDateError, this.cityError, this.dynamicError, this.bioError, this.avatarError, this.isPickingAvatar = false, this.isUpdating = false, this.isSuccess = false}): _cities = cities,_positions = positions,_refereeRoles = refereeRoles,_coachSpecs = coachSpecs,super._();
  

// ─── Editable fields (mirror the multipart body) ─────────
@override@JsonKey() final  String name;
@override@JsonKey() final  String email;
@override@JsonKey() final  String birthDate;
@override@JsonKey() final  String bio;
@override final  int? cityId;
@override final  int? dynamicId;
// sport_position_id
// ─── Read-only context ───────────────────────────────────
@override@JsonKey() final  String phone;
@override@JsonKey() final  String avatarPath;
@override@JsonKey() final  bool isLocalAvatar;
@override final  XFile? avatarFile;
/// Participant type — decides which list the role dropdown shows.
@override final  int? typeId;
/// Needed to scope player positions to the user's sport.
@override final  int? sportId;
// ─── Lookups ─────────────────────────────────────────────
 final  List<CityModel> _cities;
// ─── Lookups ─────────────────────────────────────────────
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

@override@JsonKey() final  UpdateProfileStatus loadStatus;
@override@JsonKey() final  UpdateProfileStatus dynamicStatus;
// ─── Validation / submit ─────────────────────────────────
@override final  String? nameError;
@override final  String? emailError;
@override final  String? birthDateError;
@override final  String? cityError;
@override final  String? dynamicError;
@override final  String? bioError;
@override final  String? avatarError;
@override@JsonKey() final  bool isPickingAvatar;
@override@JsonKey() final  bool isUpdating;
@override@JsonKey() final  bool isSuccess;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileStateCopyWith<_UpdateProfileState> get copyWith => __$UpdateProfileStateCopyWithImpl<_UpdateProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileState&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.dynamicId, dynamicId) || other.dynamicId == dynamicId)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.isLocalAvatar, isLocalAvatar) || other.isLocalAvatar == isLocalAvatar)&&(identical(other.avatarFile, avatarFile) || other.avatarFile == avatarFile)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&const DeepCollectionEquality().equals(other._cities, _cities)&&const DeepCollectionEquality().equals(other._positions, _positions)&&const DeepCollectionEquality().equals(other._refereeRoles, _refereeRoles)&&const DeepCollectionEquality().equals(other._coachSpecs, _coachSpecs)&&(identical(other.loadStatus, loadStatus) || other.loadStatus == loadStatus)&&(identical(other.dynamicStatus, dynamicStatus) || other.dynamicStatus == dynamicStatus)&&(identical(other.nameError, nameError) || other.nameError == nameError)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.birthDateError, birthDateError) || other.birthDateError == birthDateError)&&(identical(other.cityError, cityError) || other.cityError == cityError)&&(identical(other.dynamicError, dynamicError) || other.dynamicError == dynamicError)&&(identical(other.bioError, bioError) || other.bioError == bioError)&&(identical(other.avatarError, avatarError) || other.avatarError == avatarError)&&(identical(other.isPickingAvatar, isPickingAvatar) || other.isPickingAvatar == isPickingAvatar)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hashAll([runtimeType,name,email,birthDate,bio,cityId,dynamicId,phone,avatarPath,isLocalAvatar,avatarFile,typeId,sportId,const DeepCollectionEquality().hash(_cities),const DeepCollectionEquality().hash(_positions),const DeepCollectionEquality().hash(_refereeRoles),const DeepCollectionEquality().hash(_coachSpecs),loadStatus,dynamicStatus,nameError,emailError,birthDateError,cityError,dynamicError,bioError,avatarError,isPickingAvatar,isUpdating,isSuccess]);

@override
String toString() {
  return 'UpdateProfileState(name: $name, email: $email, birthDate: $birthDate, bio: $bio, cityId: $cityId, dynamicId: $dynamicId, phone: $phone, avatarPath: $avatarPath, isLocalAvatar: $isLocalAvatar, avatarFile: $avatarFile, typeId: $typeId, sportId: $sportId, cities: $cities, positions: $positions, refereeRoles: $refereeRoles, coachSpecs: $coachSpecs, loadStatus: $loadStatus, dynamicStatus: $dynamicStatus, nameError: $nameError, emailError: $emailError, birthDateError: $birthDateError, cityError: $cityError, dynamicError: $dynamicError, bioError: $bioError, avatarError: $avatarError, isPickingAvatar: $isPickingAvatar, isUpdating: $isUpdating, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileStateCopyWith<$Res> implements $UpdateProfileStateCopyWith<$Res> {
  factory _$UpdateProfileStateCopyWith(_UpdateProfileState value, $Res Function(_UpdateProfileState) _then) = __$UpdateProfileStateCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String birthDate, String bio, int? cityId, int? dynamicId, String phone, String avatarPath, bool isLocalAvatar, XFile? avatarFile, int? typeId, int? sportId, List<CityModel> cities, List<PlayerPositionModel> positions, List<RefereeRoleModel> refereeRoles, List<CoachSpecializationModel> coachSpecs, UpdateProfileStatus loadStatus, UpdateProfileStatus dynamicStatus, String? nameError, String? emailError, String? birthDateError, String? cityError, String? dynamicError, String? bioError, String? avatarError, bool isPickingAvatar, bool isUpdating, bool isSuccess
});


@override $UpdateProfileStatusCopyWith<$Res> get loadStatus;@override $UpdateProfileStatusCopyWith<$Res> get dynamicStatus;

}
/// @nodoc
class __$UpdateProfileStateCopyWithImpl<$Res>
    implements _$UpdateProfileStateCopyWith<$Res> {
  __$UpdateProfileStateCopyWithImpl(this._self, this._then);

  final _UpdateProfileState _self;
  final $Res Function(_UpdateProfileState) _then;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? birthDate = null,Object? bio = null,Object? cityId = freezed,Object? dynamicId = freezed,Object? phone = null,Object? avatarPath = null,Object? isLocalAvatar = null,Object? avatarFile = freezed,Object? typeId = freezed,Object? sportId = freezed,Object? cities = null,Object? positions = null,Object? refereeRoles = null,Object? coachSpecs = null,Object? loadStatus = null,Object? dynamicStatus = null,Object? nameError = freezed,Object? emailError = freezed,Object? birthDateError = freezed,Object? cityError = freezed,Object? dynamicError = freezed,Object? bioError = freezed,Object? avatarError = freezed,Object? isPickingAvatar = null,Object? isUpdating = null,Object? isSuccess = null,}) {
  return _then(_UpdateProfileState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,dynamicId: freezed == dynamicId ? _self.dynamicId : dynamicId // ignore: cast_nullable_to_non_nullable
as int?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,avatarPath: null == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String,isLocalAvatar: null == isLocalAvatar ? _self.isLocalAvatar : isLocalAvatar // ignore: cast_nullable_to_non_nullable
as bool,avatarFile: freezed == avatarFile ? _self.avatarFile : avatarFile // ignore: cast_nullable_to_non_nullable
as XFile?,typeId: freezed == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int?,sportId: freezed == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as int?,cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<CityModel>,positions: null == positions ? _self._positions : positions // ignore: cast_nullable_to_non_nullable
as List<PlayerPositionModel>,refereeRoles: null == refereeRoles ? _self._refereeRoles : refereeRoles // ignore: cast_nullable_to_non_nullable
as List<RefereeRoleModel>,coachSpecs: null == coachSpecs ? _self._coachSpecs : coachSpecs // ignore: cast_nullable_to_non_nullable
as List<CoachSpecializationModel>,loadStatus: null == loadStatus ? _self.loadStatus : loadStatus // ignore: cast_nullable_to_non_nullable
as UpdateProfileStatus,dynamicStatus: null == dynamicStatus ? _self.dynamicStatus : dynamicStatus // ignore: cast_nullable_to_non_nullable
as UpdateProfileStatus,nameError: freezed == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,birthDateError: freezed == birthDateError ? _self.birthDateError : birthDateError // ignore: cast_nullable_to_non_nullable
as String?,cityError: freezed == cityError ? _self.cityError : cityError // ignore: cast_nullable_to_non_nullable
as String?,dynamicError: freezed == dynamicError ? _self.dynamicError : dynamicError // ignore: cast_nullable_to_non_nullable
as String?,bioError: freezed == bioError ? _self.bioError : bioError // ignore: cast_nullable_to_non_nullable
as String?,avatarError: freezed == avatarError ? _self.avatarError : avatarError // ignore: cast_nullable_to_non_nullable
as String?,isPickingAvatar: null == isPickingAvatar ? _self.isPickingAvatar : isPickingAvatar // ignore: cast_nullable_to_non_nullable
as bool,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateProfileStatusCopyWith<$Res> get loadStatus {
  
  return $UpdateProfileStatusCopyWith<$Res>(_self.loadStatus, (value) {
    return _then(_self.copyWith(loadStatus: value));
  });
}/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateProfileStatusCopyWith<$Res> get dynamicStatus {
  
  return $UpdateProfileStatusCopyWith<$Res>(_self.dynamicStatus, (value) {
    return _then(_self.copyWith(dynamicStatus: value));
  });
}
}

/// @nodoc
mixin _$UpdateProfileStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileStatus()';
}


}

/// @nodoc
class $UpdateProfileStatusCopyWith<$Res>  {
$UpdateProfileStatusCopyWith(UpdateProfileStatus _, $Res Function(UpdateProfileStatus) __);
}


/// Adds pattern-matching-related methods to [UpdateProfileStatus].
extension UpdateProfileStatusPatterns on UpdateProfileStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UpdateProfileStatusInitial value)?  initial,TResult Function( UpdateProfileStatusLoading value)?  loading,TResult Function( UpdateProfileStatusSuccess value)?  success,TResult Function( UpdateProfileStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UpdateProfileStatusInitial() when initial != null:
return initial(_that);case UpdateProfileStatusLoading() when loading != null:
return loading(_that);case UpdateProfileStatusSuccess() when success != null:
return success(_that);case UpdateProfileStatusError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UpdateProfileStatusInitial value)  initial,required TResult Function( UpdateProfileStatusLoading value)  loading,required TResult Function( UpdateProfileStatusSuccess value)  success,required TResult Function( UpdateProfileStatusError value)  error,}){
final _that = this;
switch (_that) {
case UpdateProfileStatusInitial():
return initial(_that);case UpdateProfileStatusLoading():
return loading(_that);case UpdateProfileStatusSuccess():
return success(_that);case UpdateProfileStatusError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UpdateProfileStatusInitial value)?  initial,TResult? Function( UpdateProfileStatusLoading value)?  loading,TResult? Function( UpdateProfileStatusSuccess value)?  success,TResult? Function( UpdateProfileStatusError value)?  error,}){
final _that = this;
switch (_that) {
case UpdateProfileStatusInitial() when initial != null:
return initial(_that);case UpdateProfileStatusLoading() when loading != null:
return loading(_that);case UpdateProfileStatusSuccess() when success != null:
return success(_that);case UpdateProfileStatusError() when error != null:
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
case UpdateProfileStatusInitial() when initial != null:
return initial();case UpdateProfileStatusLoading() when loading != null:
return loading();case UpdateProfileStatusSuccess() when success != null:
return success();case UpdateProfileStatusError() when error != null:
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
case UpdateProfileStatusInitial():
return initial();case UpdateProfileStatusLoading():
return loading();case UpdateProfileStatusSuccess():
return success();case UpdateProfileStatusError():
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
case UpdateProfileStatusInitial() when initial != null:
return initial();case UpdateProfileStatusLoading() when loading != null:
return loading();case UpdateProfileStatusSuccess() when success != null:
return success();case UpdateProfileStatusError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class UpdateProfileStatusInitial implements UpdateProfileStatus {
  const UpdateProfileStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileStatus.initial()';
}


}




/// @nodoc


class UpdateProfileStatusLoading implements UpdateProfileStatus {
  const UpdateProfileStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileStatus.loading()';
}


}




/// @nodoc


class UpdateProfileStatusSuccess implements UpdateProfileStatus {
  const UpdateProfileStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileStatus.success()';
}


}




/// @nodoc


class UpdateProfileStatusError implements UpdateProfileStatus {
  const UpdateProfileStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileStatus.error()';
}


}




// dart format on
