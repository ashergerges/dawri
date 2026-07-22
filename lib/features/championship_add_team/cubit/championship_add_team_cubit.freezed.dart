// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'championship_add_team_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChampionshipAddTeamState {

// ─── Teams ───────────────────────────────────────────────
 List<TeamModel> get teams; int? get selectedTeamId; ChampionshipAddTeamStatus get teamsStatus;// ─── Players selection ───────────────────────────────────
 Set<int> get selectedPlayerIndexes;// ─── Submit ──────────────────────────────────────────────
 bool get isLoading; bool get isSuccess;
/// Create a copy of ChampionshipAddTeamState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChampionshipAddTeamStateCopyWith<ChampionshipAddTeamState> get copyWith => _$ChampionshipAddTeamStateCopyWithImpl<ChampionshipAddTeamState>(this as ChampionshipAddTeamState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampionshipAddTeamState&&const DeepCollectionEquality().equals(other.teams, teams)&&(identical(other.selectedTeamId, selectedTeamId) || other.selectedTeamId == selectedTeamId)&&(identical(other.teamsStatus, teamsStatus) || other.teamsStatus == teamsStatus)&&const DeepCollectionEquality().equals(other.selectedPlayerIndexes, selectedPlayerIndexes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(teams),selectedTeamId,teamsStatus,const DeepCollectionEquality().hash(selectedPlayerIndexes),isLoading,isSuccess);

@override
String toString() {
  return 'ChampionshipAddTeamState(teams: $teams, selectedTeamId: $selectedTeamId, teamsStatus: $teamsStatus, selectedPlayerIndexes: $selectedPlayerIndexes, isLoading: $isLoading, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class $ChampionshipAddTeamStateCopyWith<$Res>  {
  factory $ChampionshipAddTeamStateCopyWith(ChampionshipAddTeamState value, $Res Function(ChampionshipAddTeamState) _then) = _$ChampionshipAddTeamStateCopyWithImpl;
@useResult
$Res call({
 List<TeamModel> teams, int? selectedTeamId, ChampionshipAddTeamStatus teamsStatus, Set<int> selectedPlayerIndexes, bool isLoading, bool isSuccess
});


$ChampionshipAddTeamStatusCopyWith<$Res> get teamsStatus;

}
/// @nodoc
class _$ChampionshipAddTeamStateCopyWithImpl<$Res>
    implements $ChampionshipAddTeamStateCopyWith<$Res> {
  _$ChampionshipAddTeamStateCopyWithImpl(this._self, this._then);

  final ChampionshipAddTeamState _self;
  final $Res Function(ChampionshipAddTeamState) _then;

/// Create a copy of ChampionshipAddTeamState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? teams = null,Object? selectedTeamId = freezed,Object? teamsStatus = null,Object? selectedPlayerIndexes = null,Object? isLoading = null,Object? isSuccess = null,}) {
  return _then(_self.copyWith(
teams: null == teams ? _self.teams : teams // ignore: cast_nullable_to_non_nullable
as List<TeamModel>,selectedTeamId: freezed == selectedTeamId ? _self.selectedTeamId : selectedTeamId // ignore: cast_nullable_to_non_nullable
as int?,teamsStatus: null == teamsStatus ? _self.teamsStatus : teamsStatus // ignore: cast_nullable_to_non_nullable
as ChampionshipAddTeamStatus,selectedPlayerIndexes: null == selectedPlayerIndexes ? _self.selectedPlayerIndexes : selectedPlayerIndexes // ignore: cast_nullable_to_non_nullable
as Set<int>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ChampionshipAddTeamState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChampionshipAddTeamStatusCopyWith<$Res> get teamsStatus {
  
  return $ChampionshipAddTeamStatusCopyWith<$Res>(_self.teamsStatus, (value) {
    return _then(_self.copyWith(teamsStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChampionshipAddTeamState].
extension ChampionshipAddTeamStatePatterns on ChampionshipAddTeamState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChampionshipAddTeamState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChampionshipAddTeamState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChampionshipAddTeamState value)  $default,){
final _that = this;
switch (_that) {
case _ChampionshipAddTeamState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChampionshipAddTeamState value)?  $default,){
final _that = this;
switch (_that) {
case _ChampionshipAddTeamState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TeamModel> teams,  int? selectedTeamId,  ChampionshipAddTeamStatus teamsStatus,  Set<int> selectedPlayerIndexes,  bool isLoading,  bool isSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChampionshipAddTeamState() when $default != null:
return $default(_that.teams,_that.selectedTeamId,_that.teamsStatus,_that.selectedPlayerIndexes,_that.isLoading,_that.isSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TeamModel> teams,  int? selectedTeamId,  ChampionshipAddTeamStatus teamsStatus,  Set<int> selectedPlayerIndexes,  bool isLoading,  bool isSuccess)  $default,) {final _that = this;
switch (_that) {
case _ChampionshipAddTeamState():
return $default(_that.teams,_that.selectedTeamId,_that.teamsStatus,_that.selectedPlayerIndexes,_that.isLoading,_that.isSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TeamModel> teams,  int? selectedTeamId,  ChampionshipAddTeamStatus teamsStatus,  Set<int> selectedPlayerIndexes,  bool isLoading,  bool isSuccess)?  $default,) {final _that = this;
switch (_that) {
case _ChampionshipAddTeamState() when $default != null:
return $default(_that.teams,_that.selectedTeamId,_that.teamsStatus,_that.selectedPlayerIndexes,_that.isLoading,_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _ChampionshipAddTeamState implements ChampionshipAddTeamState {
  const _ChampionshipAddTeamState({final  List<TeamModel> teams = const [], this.selectedTeamId, this.teamsStatus = const ChampionshipAddTeamStatus.initial(), final  Set<int> selectedPlayerIndexes = const {}, this.isLoading = false, this.isSuccess = false}): _teams = teams,_selectedPlayerIndexes = selectedPlayerIndexes;
  

// ─── Teams ───────────────────────────────────────────────
 final  List<TeamModel> _teams;
// ─── Teams ───────────────────────────────────────────────
@override@JsonKey() List<TeamModel> get teams {
  if (_teams is EqualUnmodifiableListView) return _teams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teams);
}

@override final  int? selectedTeamId;
@override@JsonKey() final  ChampionshipAddTeamStatus teamsStatus;
// ─── Players selection ───────────────────────────────────
 final  Set<int> _selectedPlayerIndexes;
// ─── Players selection ───────────────────────────────────
@override@JsonKey() Set<int> get selectedPlayerIndexes {
  if (_selectedPlayerIndexes is EqualUnmodifiableSetView) return _selectedPlayerIndexes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedPlayerIndexes);
}

// ─── Submit ──────────────────────────────────────────────
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;

/// Create a copy of ChampionshipAddTeamState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChampionshipAddTeamStateCopyWith<_ChampionshipAddTeamState> get copyWith => __$ChampionshipAddTeamStateCopyWithImpl<_ChampionshipAddTeamState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChampionshipAddTeamState&&const DeepCollectionEquality().equals(other._teams, _teams)&&(identical(other.selectedTeamId, selectedTeamId) || other.selectedTeamId == selectedTeamId)&&(identical(other.teamsStatus, teamsStatus) || other.teamsStatus == teamsStatus)&&const DeepCollectionEquality().equals(other._selectedPlayerIndexes, _selectedPlayerIndexes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_teams),selectedTeamId,teamsStatus,const DeepCollectionEquality().hash(_selectedPlayerIndexes),isLoading,isSuccess);

@override
String toString() {
  return 'ChampionshipAddTeamState(teams: $teams, selectedTeamId: $selectedTeamId, teamsStatus: $teamsStatus, selectedPlayerIndexes: $selectedPlayerIndexes, isLoading: $isLoading, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$ChampionshipAddTeamStateCopyWith<$Res> implements $ChampionshipAddTeamStateCopyWith<$Res> {
  factory _$ChampionshipAddTeamStateCopyWith(_ChampionshipAddTeamState value, $Res Function(_ChampionshipAddTeamState) _then) = __$ChampionshipAddTeamStateCopyWithImpl;
@override @useResult
$Res call({
 List<TeamModel> teams, int? selectedTeamId, ChampionshipAddTeamStatus teamsStatus, Set<int> selectedPlayerIndexes, bool isLoading, bool isSuccess
});


@override $ChampionshipAddTeamStatusCopyWith<$Res> get teamsStatus;

}
/// @nodoc
class __$ChampionshipAddTeamStateCopyWithImpl<$Res>
    implements _$ChampionshipAddTeamStateCopyWith<$Res> {
  __$ChampionshipAddTeamStateCopyWithImpl(this._self, this._then);

  final _ChampionshipAddTeamState _self;
  final $Res Function(_ChampionshipAddTeamState) _then;

/// Create a copy of ChampionshipAddTeamState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teams = null,Object? selectedTeamId = freezed,Object? teamsStatus = null,Object? selectedPlayerIndexes = null,Object? isLoading = null,Object? isSuccess = null,}) {
  return _then(_ChampionshipAddTeamState(
teams: null == teams ? _self._teams : teams // ignore: cast_nullable_to_non_nullable
as List<TeamModel>,selectedTeamId: freezed == selectedTeamId ? _self.selectedTeamId : selectedTeamId // ignore: cast_nullable_to_non_nullable
as int?,teamsStatus: null == teamsStatus ? _self.teamsStatus : teamsStatus // ignore: cast_nullable_to_non_nullable
as ChampionshipAddTeamStatus,selectedPlayerIndexes: null == selectedPlayerIndexes ? _self._selectedPlayerIndexes : selectedPlayerIndexes // ignore: cast_nullable_to_non_nullable
as Set<int>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ChampionshipAddTeamState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChampionshipAddTeamStatusCopyWith<$Res> get teamsStatus {
  
  return $ChampionshipAddTeamStatusCopyWith<$Res>(_self.teamsStatus, (value) {
    return _then(_self.copyWith(teamsStatus: value));
  });
}
}

/// @nodoc
mixin _$ChampionshipAddTeamStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampionshipAddTeamStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampionshipAddTeamStatus()';
}


}

/// @nodoc
class $ChampionshipAddTeamStatusCopyWith<$Res>  {
$ChampionshipAddTeamStatusCopyWith(ChampionshipAddTeamStatus _, $Res Function(ChampionshipAddTeamStatus) __);
}


/// Adds pattern-matching-related methods to [ChampionshipAddTeamStatus].
extension ChampionshipAddTeamStatusPatterns on ChampionshipAddTeamStatus {
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


class Initial implements ChampionshipAddTeamStatus {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampionshipAddTeamStatus.initial()';
}


}




/// @nodoc


class Loading implements ChampionshipAddTeamStatus {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampionshipAddTeamStatus.loading()';
}


}




/// @nodoc


class Error implements ChampionshipAddTeamStatus {
  const Error();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampionshipAddTeamStatus.error()';
}


}




/// @nodoc


class Success implements ChampionshipAddTeamStatus {
  const Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampionshipAddTeamStatus.success()';
}


}




// dart format on
