// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_challenge_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateChallengeState {

 List<SportModel> get sports; List<CityModel> get cities; List<LevelModel> get levels; List<StadiumModel> get stadiums; int? get selectedSportId; int? get selectedCityId; int? get selectedStadiumId; int? get selectedLevelId; int get playersPerTeam; String get description; DateTime? get date; TimeOfDay? get time; CreateChallengeStatus get status; bool get isSubmitting; bool get showSuccessModal;
/// Create a copy of CreateChallengeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateChallengeStateCopyWith<CreateChallengeState> get copyWith => _$CreateChallengeStateCopyWithImpl<CreateChallengeState>(this as CreateChallengeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateChallengeState&&const DeepCollectionEquality().equals(other.sports, sports)&&const DeepCollectionEquality().equals(other.cities, cities)&&const DeepCollectionEquality().equals(other.levels, levels)&&const DeepCollectionEquality().equals(other.stadiums, stadiums)&&(identical(other.selectedSportId, selectedSportId) || other.selectedSportId == selectedSportId)&&(identical(other.selectedCityId, selectedCityId) || other.selectedCityId == selectedCityId)&&(identical(other.selectedStadiumId, selectedStadiumId) || other.selectedStadiumId == selectedStadiumId)&&(identical(other.selectedLevelId, selectedLevelId) || other.selectedLevelId == selectedLevelId)&&(identical(other.playersPerTeam, playersPerTeam) || other.playersPerTeam == playersPerTeam)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.showSuccessModal, showSuccessModal) || other.showSuccessModal == showSuccessModal));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sports),const DeepCollectionEquality().hash(cities),const DeepCollectionEquality().hash(levels),const DeepCollectionEquality().hash(stadiums),selectedSportId,selectedCityId,selectedStadiumId,selectedLevelId,playersPerTeam,description,date,time,status,isSubmitting,showSuccessModal);

@override
String toString() {
  return 'CreateChallengeState(sports: $sports, cities: $cities, levels: $levels, stadiums: $stadiums, selectedSportId: $selectedSportId, selectedCityId: $selectedCityId, selectedStadiumId: $selectedStadiumId, selectedLevelId: $selectedLevelId, playersPerTeam: $playersPerTeam, description: $description, date: $date, time: $time, status: $status, isSubmitting: $isSubmitting, showSuccessModal: $showSuccessModal)';
}


}

/// @nodoc
abstract mixin class $CreateChallengeStateCopyWith<$Res>  {
  factory $CreateChallengeStateCopyWith(CreateChallengeState value, $Res Function(CreateChallengeState) _then) = _$CreateChallengeStateCopyWithImpl;
@useResult
$Res call({
 List<SportModel> sports, List<CityModel> cities, List<LevelModel> levels, List<StadiumModel> stadiums, int? selectedSportId, int? selectedCityId, int? selectedStadiumId, int? selectedLevelId, int playersPerTeam, String description, DateTime? date, TimeOfDay? time, CreateChallengeStatus status, bool isSubmitting, bool showSuccessModal
});


$CreateChallengeStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$CreateChallengeStateCopyWithImpl<$Res>
    implements $CreateChallengeStateCopyWith<$Res> {
  _$CreateChallengeStateCopyWithImpl(this._self, this._then);

  final CreateChallengeState _self;
  final $Res Function(CreateChallengeState) _then;

/// Create a copy of CreateChallengeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sports = null,Object? cities = null,Object? levels = null,Object? stadiums = null,Object? selectedSportId = freezed,Object? selectedCityId = freezed,Object? selectedStadiumId = freezed,Object? selectedLevelId = freezed,Object? playersPerTeam = null,Object? description = null,Object? date = freezed,Object? time = freezed,Object? status = null,Object? isSubmitting = null,Object? showSuccessModal = null,}) {
  return _then(_self.copyWith(
sports: null == sports ? _self.sports : sports // ignore: cast_nullable_to_non_nullable
as List<SportModel>,cities: null == cities ? _self.cities : cities // ignore: cast_nullable_to_non_nullable
as List<CityModel>,levels: null == levels ? _self.levels : levels // ignore: cast_nullable_to_non_nullable
as List<LevelModel>,stadiums: null == stadiums ? _self.stadiums : stadiums // ignore: cast_nullable_to_non_nullable
as List<StadiumModel>,selectedSportId: freezed == selectedSportId ? _self.selectedSportId : selectedSportId // ignore: cast_nullable_to_non_nullable
as int?,selectedCityId: freezed == selectedCityId ? _self.selectedCityId : selectedCityId // ignore: cast_nullable_to_non_nullable
as int?,selectedStadiumId: freezed == selectedStadiumId ? _self.selectedStadiumId : selectedStadiumId // ignore: cast_nullable_to_non_nullable
as int?,selectedLevelId: freezed == selectedLevelId ? _self.selectedLevelId : selectedLevelId // ignore: cast_nullable_to_non_nullable
as int?,playersPerTeam: null == playersPerTeam ? _self.playersPerTeam : playersPerTeam // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateChallengeStatus,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,showSuccessModal: null == showSuccessModal ? _self.showSuccessModal : showSuccessModal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CreateChallengeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateChallengeStatusCopyWith<$Res> get status {
  
  return $CreateChallengeStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateChallengeState].
extension CreateChallengeStatePatterns on CreateChallengeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateChallengeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateChallengeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateChallengeState value)  $default,){
final _that = this;
switch (_that) {
case _CreateChallengeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateChallengeState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateChallengeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SportModel> sports,  List<CityModel> cities,  List<LevelModel> levels,  List<StadiumModel> stadiums,  int? selectedSportId,  int? selectedCityId,  int? selectedStadiumId,  int? selectedLevelId,  int playersPerTeam,  String description,  DateTime? date,  TimeOfDay? time,  CreateChallengeStatus status,  bool isSubmitting,  bool showSuccessModal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateChallengeState() when $default != null:
return $default(_that.sports,_that.cities,_that.levels,_that.stadiums,_that.selectedSportId,_that.selectedCityId,_that.selectedStadiumId,_that.selectedLevelId,_that.playersPerTeam,_that.description,_that.date,_that.time,_that.status,_that.isSubmitting,_that.showSuccessModal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SportModel> sports,  List<CityModel> cities,  List<LevelModel> levels,  List<StadiumModel> stadiums,  int? selectedSportId,  int? selectedCityId,  int? selectedStadiumId,  int? selectedLevelId,  int playersPerTeam,  String description,  DateTime? date,  TimeOfDay? time,  CreateChallengeStatus status,  bool isSubmitting,  bool showSuccessModal)  $default,) {final _that = this;
switch (_that) {
case _CreateChallengeState():
return $default(_that.sports,_that.cities,_that.levels,_that.stadiums,_that.selectedSportId,_that.selectedCityId,_that.selectedStadiumId,_that.selectedLevelId,_that.playersPerTeam,_that.description,_that.date,_that.time,_that.status,_that.isSubmitting,_that.showSuccessModal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SportModel> sports,  List<CityModel> cities,  List<LevelModel> levels,  List<StadiumModel> stadiums,  int? selectedSportId,  int? selectedCityId,  int? selectedStadiumId,  int? selectedLevelId,  int playersPerTeam,  String description,  DateTime? date,  TimeOfDay? time,  CreateChallengeStatus status,  bool isSubmitting,  bool showSuccessModal)?  $default,) {final _that = this;
switch (_that) {
case _CreateChallengeState() when $default != null:
return $default(_that.sports,_that.cities,_that.levels,_that.stadiums,_that.selectedSportId,_that.selectedCityId,_that.selectedStadiumId,_that.selectedLevelId,_that.playersPerTeam,_that.description,_that.date,_that.time,_that.status,_that.isSubmitting,_that.showSuccessModal);case _:
  return null;

}
}

}

/// @nodoc


class _CreateChallengeState implements CreateChallengeState {
  const _CreateChallengeState({final  List<SportModel> sports = const [], final  List<CityModel> cities = const [], final  List<LevelModel> levels = const [], final  List<StadiumModel> stadiums = const [], this.selectedSportId, this.selectedCityId, this.selectedStadiumId, this.selectedLevelId, this.playersPerTeam = 1, this.description = '', this.date, this.time, this.status = const CreateChallengeStatus.initial(), this.isSubmitting = false, this.showSuccessModal = false}): _sports = sports,_cities = cities,_levels = levels,_stadiums = stadiums;
  

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

 final  List<LevelModel> _levels;
@override@JsonKey() List<LevelModel> get levels {
  if (_levels is EqualUnmodifiableListView) return _levels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_levels);
}

 final  List<StadiumModel> _stadiums;
@override@JsonKey() List<StadiumModel> get stadiums {
  if (_stadiums is EqualUnmodifiableListView) return _stadiums;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stadiums);
}

@override final  int? selectedSportId;
@override final  int? selectedCityId;
@override final  int? selectedStadiumId;
@override final  int? selectedLevelId;
@override@JsonKey() final  int playersPerTeam;
@override@JsonKey() final  String description;
@override final  DateTime? date;
@override final  TimeOfDay? time;
@override@JsonKey() final  CreateChallengeStatus status;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool showSuccessModal;

/// Create a copy of CreateChallengeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateChallengeStateCopyWith<_CreateChallengeState> get copyWith => __$CreateChallengeStateCopyWithImpl<_CreateChallengeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateChallengeState&&const DeepCollectionEquality().equals(other._sports, _sports)&&const DeepCollectionEquality().equals(other._cities, _cities)&&const DeepCollectionEquality().equals(other._levels, _levels)&&const DeepCollectionEquality().equals(other._stadiums, _stadiums)&&(identical(other.selectedSportId, selectedSportId) || other.selectedSportId == selectedSportId)&&(identical(other.selectedCityId, selectedCityId) || other.selectedCityId == selectedCityId)&&(identical(other.selectedStadiumId, selectedStadiumId) || other.selectedStadiumId == selectedStadiumId)&&(identical(other.selectedLevelId, selectedLevelId) || other.selectedLevelId == selectedLevelId)&&(identical(other.playersPerTeam, playersPerTeam) || other.playersPerTeam == playersPerTeam)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.showSuccessModal, showSuccessModal) || other.showSuccessModal == showSuccessModal));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sports),const DeepCollectionEquality().hash(_cities),const DeepCollectionEquality().hash(_levels),const DeepCollectionEquality().hash(_stadiums),selectedSportId,selectedCityId,selectedStadiumId,selectedLevelId,playersPerTeam,description,date,time,status,isSubmitting,showSuccessModal);

@override
String toString() {
  return 'CreateChallengeState(sports: $sports, cities: $cities, levels: $levels, stadiums: $stadiums, selectedSportId: $selectedSportId, selectedCityId: $selectedCityId, selectedStadiumId: $selectedStadiumId, selectedLevelId: $selectedLevelId, playersPerTeam: $playersPerTeam, description: $description, date: $date, time: $time, status: $status, isSubmitting: $isSubmitting, showSuccessModal: $showSuccessModal)';
}


}

/// @nodoc
abstract mixin class _$CreateChallengeStateCopyWith<$Res> implements $CreateChallengeStateCopyWith<$Res> {
  factory _$CreateChallengeStateCopyWith(_CreateChallengeState value, $Res Function(_CreateChallengeState) _then) = __$CreateChallengeStateCopyWithImpl;
@override @useResult
$Res call({
 List<SportModel> sports, List<CityModel> cities, List<LevelModel> levels, List<StadiumModel> stadiums, int? selectedSportId, int? selectedCityId, int? selectedStadiumId, int? selectedLevelId, int playersPerTeam, String description, DateTime? date, TimeOfDay? time, CreateChallengeStatus status, bool isSubmitting, bool showSuccessModal
});


@override $CreateChallengeStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$CreateChallengeStateCopyWithImpl<$Res>
    implements _$CreateChallengeStateCopyWith<$Res> {
  __$CreateChallengeStateCopyWithImpl(this._self, this._then);

  final _CreateChallengeState _self;
  final $Res Function(_CreateChallengeState) _then;

/// Create a copy of CreateChallengeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sports = null,Object? cities = null,Object? levels = null,Object? stadiums = null,Object? selectedSportId = freezed,Object? selectedCityId = freezed,Object? selectedStadiumId = freezed,Object? selectedLevelId = freezed,Object? playersPerTeam = null,Object? description = null,Object? date = freezed,Object? time = freezed,Object? status = null,Object? isSubmitting = null,Object? showSuccessModal = null,}) {
  return _then(_CreateChallengeState(
sports: null == sports ? _self._sports : sports // ignore: cast_nullable_to_non_nullable
as List<SportModel>,cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<CityModel>,levels: null == levels ? _self._levels : levels // ignore: cast_nullable_to_non_nullable
as List<LevelModel>,stadiums: null == stadiums ? _self._stadiums : stadiums // ignore: cast_nullable_to_non_nullable
as List<StadiumModel>,selectedSportId: freezed == selectedSportId ? _self.selectedSportId : selectedSportId // ignore: cast_nullable_to_non_nullable
as int?,selectedCityId: freezed == selectedCityId ? _self.selectedCityId : selectedCityId // ignore: cast_nullable_to_non_nullable
as int?,selectedStadiumId: freezed == selectedStadiumId ? _self.selectedStadiumId : selectedStadiumId // ignore: cast_nullable_to_non_nullable
as int?,selectedLevelId: freezed == selectedLevelId ? _self.selectedLevelId : selectedLevelId // ignore: cast_nullable_to_non_nullable
as int?,playersPerTeam: null == playersPerTeam ? _self.playersPerTeam : playersPerTeam // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateChallengeStatus,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,showSuccessModal: null == showSuccessModal ? _self.showSuccessModal : showSuccessModal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CreateChallengeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateChallengeStatusCopyWith<$Res> get status {
  
  return $CreateChallengeStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

/// @nodoc
mixin _$CreateChallengeStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateChallengeStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateChallengeStatus()';
}


}

/// @nodoc
class $CreateChallengeStatusCopyWith<$Res>  {
$CreateChallengeStatusCopyWith(CreateChallengeStatus _, $Res Function(CreateChallengeStatus) __);
}


/// Adds pattern-matching-related methods to [CreateChallengeStatus].
extension CreateChallengeStatusPatterns on CreateChallengeStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateChallengeStatusInitial value)?  initial,TResult Function( CreateChallengeStatusLoading value)?  loading,TResult Function( CreateChallengeStatusSuccess value)?  success,TResult Function( CreateChallengeStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateChallengeStatusInitial() when initial != null:
return initial(_that);case CreateChallengeStatusLoading() when loading != null:
return loading(_that);case CreateChallengeStatusSuccess() when success != null:
return success(_that);case CreateChallengeStatusError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateChallengeStatusInitial value)  initial,required TResult Function( CreateChallengeStatusLoading value)  loading,required TResult Function( CreateChallengeStatusSuccess value)  success,required TResult Function( CreateChallengeStatusError value)  error,}){
final _that = this;
switch (_that) {
case CreateChallengeStatusInitial():
return initial(_that);case CreateChallengeStatusLoading():
return loading(_that);case CreateChallengeStatusSuccess():
return success(_that);case CreateChallengeStatusError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateChallengeStatusInitial value)?  initial,TResult? Function( CreateChallengeStatusLoading value)?  loading,TResult? Function( CreateChallengeStatusSuccess value)?  success,TResult? Function( CreateChallengeStatusError value)?  error,}){
final _that = this;
switch (_that) {
case CreateChallengeStatusInitial() when initial != null:
return initial(_that);case CreateChallengeStatusLoading() when loading != null:
return loading(_that);case CreateChallengeStatusSuccess() when success != null:
return success(_that);case CreateChallengeStatusError() when error != null:
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
case CreateChallengeStatusInitial() when initial != null:
return initial();case CreateChallengeStatusLoading() when loading != null:
return loading();case CreateChallengeStatusSuccess() when success != null:
return success();case CreateChallengeStatusError() when error != null:
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
case CreateChallengeStatusInitial():
return initial();case CreateChallengeStatusLoading():
return loading();case CreateChallengeStatusSuccess():
return success();case CreateChallengeStatusError():
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
case CreateChallengeStatusInitial() when initial != null:
return initial();case CreateChallengeStatusLoading() when loading != null:
return loading();case CreateChallengeStatusSuccess() when success != null:
return success();case CreateChallengeStatusError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class CreateChallengeStatusInitial implements CreateChallengeStatus {
  const CreateChallengeStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateChallengeStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateChallengeStatus.initial()';
}


}




/// @nodoc


class CreateChallengeStatusLoading implements CreateChallengeStatus {
  const CreateChallengeStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateChallengeStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateChallengeStatus.loading()';
}


}




/// @nodoc


class CreateChallengeStatusSuccess implements CreateChallengeStatus {
  const CreateChallengeStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateChallengeStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateChallengeStatus.success()';
}


}




/// @nodoc


class CreateChallengeStatusError implements CreateChallengeStatus {
  const CreateChallengeStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateChallengeStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateChallengeStatus.error()';
}


}




// dart format on
