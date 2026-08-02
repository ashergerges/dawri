// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_team_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateTeamState {

 String get teamName; String get description;// ─── Options (from API) ──────────────────────────────────
 List<CityModel> get cities; List<SportModel> get sports; bool get isLoadingOptions;// ─── Selection ───────────────────────────────────────────
 int? get selectedCityId; int? get selectedSportId; XFile? get logoFile;// ─── Validation / submission ─────────────────────────────
 String? get teamNameError; String? get sportError; String? get cityError; bool get isSubmitting; bool get isSuccess;
/// Create a copy of CreateTeamState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTeamStateCopyWith<CreateTeamState> get copyWith => _$CreateTeamStateCopyWithImpl<CreateTeamState>(this as CreateTeamState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTeamState&&(identical(other.teamName, teamName) || other.teamName == teamName)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.cities, cities)&&const DeepCollectionEquality().equals(other.sports, sports)&&(identical(other.isLoadingOptions, isLoadingOptions) || other.isLoadingOptions == isLoadingOptions)&&(identical(other.selectedCityId, selectedCityId) || other.selectedCityId == selectedCityId)&&(identical(other.selectedSportId, selectedSportId) || other.selectedSportId == selectedSportId)&&(identical(other.logoFile, logoFile) || other.logoFile == logoFile)&&(identical(other.teamNameError, teamNameError) || other.teamNameError == teamNameError)&&(identical(other.sportError, sportError) || other.sportError == sportError)&&(identical(other.cityError, cityError) || other.cityError == cityError)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,teamName,description,const DeepCollectionEquality().hash(cities),const DeepCollectionEquality().hash(sports),isLoadingOptions,selectedCityId,selectedSportId,logoFile,teamNameError,sportError,cityError,isSubmitting,isSuccess);

@override
String toString() {
  return 'CreateTeamState(teamName: $teamName, description: $description, cities: $cities, sports: $sports, isLoadingOptions: $isLoadingOptions, selectedCityId: $selectedCityId, selectedSportId: $selectedSportId, logoFile: $logoFile, teamNameError: $teamNameError, sportError: $sportError, cityError: $cityError, isSubmitting: $isSubmitting, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class $CreateTeamStateCopyWith<$Res>  {
  factory $CreateTeamStateCopyWith(CreateTeamState value, $Res Function(CreateTeamState) _then) = _$CreateTeamStateCopyWithImpl;
@useResult
$Res call({
 String teamName, String description, List<CityModel> cities, List<SportModel> sports, bool isLoadingOptions, int? selectedCityId, int? selectedSportId, XFile? logoFile, String? teamNameError, String? sportError, String? cityError, bool isSubmitting, bool isSuccess
});




}
/// @nodoc
class _$CreateTeamStateCopyWithImpl<$Res>
    implements $CreateTeamStateCopyWith<$Res> {
  _$CreateTeamStateCopyWithImpl(this._self, this._then);

  final CreateTeamState _self;
  final $Res Function(CreateTeamState) _then;

/// Create a copy of CreateTeamState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? teamName = null,Object? description = null,Object? cities = null,Object? sports = null,Object? isLoadingOptions = null,Object? selectedCityId = freezed,Object? selectedSportId = freezed,Object? logoFile = freezed,Object? teamNameError = freezed,Object? sportError = freezed,Object? cityError = freezed,Object? isSubmitting = null,Object? isSuccess = null,}) {
  return _then(_self.copyWith(
teamName: null == teamName ? _self.teamName : teamName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cities: null == cities ? _self.cities : cities // ignore: cast_nullable_to_non_nullable
as List<CityModel>,sports: null == sports ? _self.sports : sports // ignore: cast_nullable_to_non_nullable
as List<SportModel>,isLoadingOptions: null == isLoadingOptions ? _self.isLoadingOptions : isLoadingOptions // ignore: cast_nullable_to_non_nullable
as bool,selectedCityId: freezed == selectedCityId ? _self.selectedCityId : selectedCityId // ignore: cast_nullable_to_non_nullable
as int?,selectedSportId: freezed == selectedSportId ? _self.selectedSportId : selectedSportId // ignore: cast_nullable_to_non_nullable
as int?,logoFile: freezed == logoFile ? _self.logoFile : logoFile // ignore: cast_nullable_to_non_nullable
as XFile?,teamNameError: freezed == teamNameError ? _self.teamNameError : teamNameError // ignore: cast_nullable_to_non_nullable
as String?,sportError: freezed == sportError ? _self.sportError : sportError // ignore: cast_nullable_to_non_nullable
as String?,cityError: freezed == cityError ? _self.cityError : cityError // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTeamState].
extension CreateTeamStatePatterns on CreateTeamState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTeamState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTeamState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTeamState value)  $default,){
final _that = this;
switch (_that) {
case _CreateTeamState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTeamState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTeamState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String teamName,  String description,  List<CityModel> cities,  List<SportModel> sports,  bool isLoadingOptions,  int? selectedCityId,  int? selectedSportId,  XFile? logoFile,  String? teamNameError,  String? sportError,  String? cityError,  bool isSubmitting,  bool isSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTeamState() when $default != null:
return $default(_that.teamName,_that.description,_that.cities,_that.sports,_that.isLoadingOptions,_that.selectedCityId,_that.selectedSportId,_that.logoFile,_that.teamNameError,_that.sportError,_that.cityError,_that.isSubmitting,_that.isSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String teamName,  String description,  List<CityModel> cities,  List<SportModel> sports,  bool isLoadingOptions,  int? selectedCityId,  int? selectedSportId,  XFile? logoFile,  String? teamNameError,  String? sportError,  String? cityError,  bool isSubmitting,  bool isSuccess)  $default,) {final _that = this;
switch (_that) {
case _CreateTeamState():
return $default(_that.teamName,_that.description,_that.cities,_that.sports,_that.isLoadingOptions,_that.selectedCityId,_that.selectedSportId,_that.logoFile,_that.teamNameError,_that.sportError,_that.cityError,_that.isSubmitting,_that.isSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String teamName,  String description,  List<CityModel> cities,  List<SportModel> sports,  bool isLoadingOptions,  int? selectedCityId,  int? selectedSportId,  XFile? logoFile,  String? teamNameError,  String? sportError,  String? cityError,  bool isSubmitting,  bool isSuccess)?  $default,) {final _that = this;
switch (_that) {
case _CreateTeamState() when $default != null:
return $default(_that.teamName,_that.description,_that.cities,_that.sports,_that.isLoadingOptions,_that.selectedCityId,_that.selectedSportId,_that.logoFile,_that.teamNameError,_that.sportError,_that.cityError,_that.isSubmitting,_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _CreateTeamState implements CreateTeamState {
  const _CreateTeamState({this.teamName = '', this.description = '', final  List<CityModel> cities = const [], final  List<SportModel> sports = const [], this.isLoadingOptions = false, this.selectedCityId, this.selectedSportId, this.logoFile, this.teamNameError, this.sportError, this.cityError, this.isSubmitting = false, this.isSuccess = false}): _cities = cities,_sports = sports;
  

@override@JsonKey() final  String teamName;
@override@JsonKey() final  String description;
// ─── Options (from API) ──────────────────────────────────
 final  List<CityModel> _cities;
// ─── Options (from API) ──────────────────────────────────
@override@JsonKey() List<CityModel> get cities {
  if (_cities is EqualUnmodifiableListView) return _cities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cities);
}

 final  List<SportModel> _sports;
@override@JsonKey() List<SportModel> get sports {
  if (_sports is EqualUnmodifiableListView) return _sports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sports);
}

@override@JsonKey() final  bool isLoadingOptions;
// ─── Selection ───────────────────────────────────────────
@override final  int? selectedCityId;
@override final  int? selectedSportId;
@override final  XFile? logoFile;
// ─── Validation / submission ─────────────────────────────
@override final  String? teamNameError;
@override final  String? sportError;
@override final  String? cityError;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isSuccess;

/// Create a copy of CreateTeamState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTeamStateCopyWith<_CreateTeamState> get copyWith => __$CreateTeamStateCopyWithImpl<_CreateTeamState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTeamState&&(identical(other.teamName, teamName) || other.teamName == teamName)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._cities, _cities)&&const DeepCollectionEquality().equals(other._sports, _sports)&&(identical(other.isLoadingOptions, isLoadingOptions) || other.isLoadingOptions == isLoadingOptions)&&(identical(other.selectedCityId, selectedCityId) || other.selectedCityId == selectedCityId)&&(identical(other.selectedSportId, selectedSportId) || other.selectedSportId == selectedSportId)&&(identical(other.logoFile, logoFile) || other.logoFile == logoFile)&&(identical(other.teamNameError, teamNameError) || other.teamNameError == teamNameError)&&(identical(other.sportError, sportError) || other.sportError == sportError)&&(identical(other.cityError, cityError) || other.cityError == cityError)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,teamName,description,const DeepCollectionEquality().hash(_cities),const DeepCollectionEquality().hash(_sports),isLoadingOptions,selectedCityId,selectedSportId,logoFile,teamNameError,sportError,cityError,isSubmitting,isSuccess);

@override
String toString() {
  return 'CreateTeamState(teamName: $teamName, description: $description, cities: $cities, sports: $sports, isLoadingOptions: $isLoadingOptions, selectedCityId: $selectedCityId, selectedSportId: $selectedSportId, logoFile: $logoFile, teamNameError: $teamNameError, sportError: $sportError, cityError: $cityError, isSubmitting: $isSubmitting, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$CreateTeamStateCopyWith<$Res> implements $CreateTeamStateCopyWith<$Res> {
  factory _$CreateTeamStateCopyWith(_CreateTeamState value, $Res Function(_CreateTeamState) _then) = __$CreateTeamStateCopyWithImpl;
@override @useResult
$Res call({
 String teamName, String description, List<CityModel> cities, List<SportModel> sports, bool isLoadingOptions, int? selectedCityId, int? selectedSportId, XFile? logoFile, String? teamNameError, String? sportError, String? cityError, bool isSubmitting, bool isSuccess
});




}
/// @nodoc
class __$CreateTeamStateCopyWithImpl<$Res>
    implements _$CreateTeamStateCopyWith<$Res> {
  __$CreateTeamStateCopyWithImpl(this._self, this._then);

  final _CreateTeamState _self;
  final $Res Function(_CreateTeamState) _then;

/// Create a copy of CreateTeamState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teamName = null,Object? description = null,Object? cities = null,Object? sports = null,Object? isLoadingOptions = null,Object? selectedCityId = freezed,Object? selectedSportId = freezed,Object? logoFile = freezed,Object? teamNameError = freezed,Object? sportError = freezed,Object? cityError = freezed,Object? isSubmitting = null,Object? isSuccess = null,}) {
  return _then(_CreateTeamState(
teamName: null == teamName ? _self.teamName : teamName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<CityModel>,sports: null == sports ? _self._sports : sports // ignore: cast_nullable_to_non_nullable
as List<SportModel>,isLoadingOptions: null == isLoadingOptions ? _self.isLoadingOptions : isLoadingOptions // ignore: cast_nullable_to_non_nullable
as bool,selectedCityId: freezed == selectedCityId ? _self.selectedCityId : selectedCityId // ignore: cast_nullable_to_non_nullable
as int?,selectedSportId: freezed == selectedSportId ? _self.selectedSportId : selectedSportId // ignore: cast_nullable_to_non_nullable
as int?,logoFile: freezed == logoFile ? _self.logoFile : logoFile // ignore: cast_nullable_to_non_nullable
as XFile?,teamNameError: freezed == teamNameError ? _self.teamNameError : teamNameError // ignore: cast_nullable_to_non_nullable
as String?,sportError: freezed == sportError ? _self.sportError : sportError // ignore: cast_nullable_to_non_nullable
as String?,cityError: freezed == cityError ? _self.cityError : cityError // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
