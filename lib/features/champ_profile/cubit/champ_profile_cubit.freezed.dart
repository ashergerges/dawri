// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'champ_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChampProfileState {

 ChampTab get selectedTab;// ─── Details ─────────────────────────────────────────────
 ChampionshipDetailsModel? get details; ChampProfileStatus get detailsStatus; bool get isFavorite;// ─── Teams (approved participants) ───────────────────────
 List<ApprovedTeamModel> get teams; ChampProfileStatus get teamsStatus;// ─── Matches ─────────────────────────────────────────────
 List<MatchGroupModel> get matchGroups; ChampProfileStatus get matchesStatus;
/// Create a copy of ChampProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChampProfileStateCopyWith<ChampProfileState> get copyWith => _$ChampProfileStateCopyWithImpl<ChampProfileState>(this as ChampProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampProfileState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.details, details) || other.details == details)&&(identical(other.detailsStatus, detailsStatus) || other.detailsStatus == detailsStatus)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&const DeepCollectionEquality().equals(other.teams, teams)&&(identical(other.teamsStatus, teamsStatus) || other.teamsStatus == teamsStatus)&&const DeepCollectionEquality().equals(other.matchGroups, matchGroups)&&(identical(other.matchesStatus, matchesStatus) || other.matchesStatus == matchesStatus));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,details,detailsStatus,isFavorite,const DeepCollectionEquality().hash(teams),teamsStatus,const DeepCollectionEquality().hash(matchGroups),matchesStatus);

@override
String toString() {
  return 'ChampProfileState(selectedTab: $selectedTab, details: $details, detailsStatus: $detailsStatus, isFavorite: $isFavorite, teams: $teams, teamsStatus: $teamsStatus, matchGroups: $matchGroups, matchesStatus: $matchesStatus)';
}


}

/// @nodoc
abstract mixin class $ChampProfileStateCopyWith<$Res>  {
  factory $ChampProfileStateCopyWith(ChampProfileState value, $Res Function(ChampProfileState) _then) = _$ChampProfileStateCopyWithImpl;
@useResult
$Res call({
 ChampTab selectedTab, ChampionshipDetailsModel? details, ChampProfileStatus detailsStatus, bool isFavorite, List<ApprovedTeamModel> teams, ChampProfileStatus teamsStatus, List<MatchGroupModel> matchGroups, ChampProfileStatus matchesStatus
});


$ChampProfileStatusCopyWith<$Res> get detailsStatus;$ChampProfileStatusCopyWith<$Res> get teamsStatus;$ChampProfileStatusCopyWith<$Res> get matchesStatus;

}
/// @nodoc
class _$ChampProfileStateCopyWithImpl<$Res>
    implements $ChampProfileStateCopyWith<$Res> {
  _$ChampProfileStateCopyWithImpl(this._self, this._then);

  final ChampProfileState _self;
  final $Res Function(ChampProfileState) _then;

/// Create a copy of ChampProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTab = null,Object? details = freezed,Object? detailsStatus = null,Object? isFavorite = null,Object? teams = null,Object? teamsStatus = null,Object? matchGroups = null,Object? matchesStatus = null,}) {
  return _then(_self.copyWith(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as ChampTab,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as ChampionshipDetailsModel?,detailsStatus: null == detailsStatus ? _self.detailsStatus : detailsStatus // ignore: cast_nullable_to_non_nullable
as ChampProfileStatus,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,teams: null == teams ? _self.teams : teams // ignore: cast_nullable_to_non_nullable
as List<ApprovedTeamModel>,teamsStatus: null == teamsStatus ? _self.teamsStatus : teamsStatus // ignore: cast_nullable_to_non_nullable
as ChampProfileStatus,matchGroups: null == matchGroups ? _self.matchGroups : matchGroups // ignore: cast_nullable_to_non_nullable
as List<MatchGroupModel>,matchesStatus: null == matchesStatus ? _self.matchesStatus : matchesStatus // ignore: cast_nullable_to_non_nullable
as ChampProfileStatus,
  ));
}
/// Create a copy of ChampProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChampProfileStatusCopyWith<$Res> get detailsStatus {
  
  return $ChampProfileStatusCopyWith<$Res>(_self.detailsStatus, (value) {
    return _then(_self.copyWith(detailsStatus: value));
  });
}/// Create a copy of ChampProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChampProfileStatusCopyWith<$Res> get teamsStatus {
  
  return $ChampProfileStatusCopyWith<$Res>(_self.teamsStatus, (value) {
    return _then(_self.copyWith(teamsStatus: value));
  });
}/// Create a copy of ChampProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChampProfileStatusCopyWith<$Res> get matchesStatus {
  
  return $ChampProfileStatusCopyWith<$Res>(_self.matchesStatus, (value) {
    return _then(_self.copyWith(matchesStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChampProfileState].
extension ChampProfileStatePatterns on ChampProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChampProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChampProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChampProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ChampProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChampProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ChampProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChampTab selectedTab,  ChampionshipDetailsModel? details,  ChampProfileStatus detailsStatus,  bool isFavorite,  List<ApprovedTeamModel> teams,  ChampProfileStatus teamsStatus,  List<MatchGroupModel> matchGroups,  ChampProfileStatus matchesStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChampProfileState() when $default != null:
return $default(_that.selectedTab,_that.details,_that.detailsStatus,_that.isFavorite,_that.teams,_that.teamsStatus,_that.matchGroups,_that.matchesStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChampTab selectedTab,  ChampionshipDetailsModel? details,  ChampProfileStatus detailsStatus,  bool isFavorite,  List<ApprovedTeamModel> teams,  ChampProfileStatus teamsStatus,  List<MatchGroupModel> matchGroups,  ChampProfileStatus matchesStatus)  $default,) {final _that = this;
switch (_that) {
case _ChampProfileState():
return $default(_that.selectedTab,_that.details,_that.detailsStatus,_that.isFavorite,_that.teams,_that.teamsStatus,_that.matchGroups,_that.matchesStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChampTab selectedTab,  ChampionshipDetailsModel? details,  ChampProfileStatus detailsStatus,  bool isFavorite,  List<ApprovedTeamModel> teams,  ChampProfileStatus teamsStatus,  List<MatchGroupModel> matchGroups,  ChampProfileStatus matchesStatus)?  $default,) {final _that = this;
switch (_that) {
case _ChampProfileState() when $default != null:
return $default(_that.selectedTab,_that.details,_that.detailsStatus,_that.isFavorite,_that.teams,_that.teamsStatus,_that.matchGroups,_that.matchesStatus);case _:
  return null;

}
}

}

/// @nodoc


class _ChampProfileState implements ChampProfileState {
  const _ChampProfileState({this.selectedTab = ChampTab.info, this.details, this.detailsStatus = const ChampProfileStatus.initial(), this.isFavorite = false, final  List<ApprovedTeamModel> teams = const [], this.teamsStatus = const ChampProfileStatus.initial(), final  List<MatchGroupModel> matchGroups = const [], this.matchesStatus = const ChampProfileStatus.initial()}): _teams = teams,_matchGroups = matchGroups;
  

@override@JsonKey() final  ChampTab selectedTab;
// ─── Details ─────────────────────────────────────────────
@override final  ChampionshipDetailsModel? details;
@override@JsonKey() final  ChampProfileStatus detailsStatus;
@override@JsonKey() final  bool isFavorite;
// ─── Teams (approved participants) ───────────────────────
 final  List<ApprovedTeamModel> _teams;
// ─── Teams (approved participants) ───────────────────────
@override@JsonKey() List<ApprovedTeamModel> get teams {
  if (_teams is EqualUnmodifiableListView) return _teams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teams);
}

@override@JsonKey() final  ChampProfileStatus teamsStatus;
// ─── Matches ─────────────────────────────────────────────
 final  List<MatchGroupModel> _matchGroups;
// ─── Matches ─────────────────────────────────────────────
@override@JsonKey() List<MatchGroupModel> get matchGroups {
  if (_matchGroups is EqualUnmodifiableListView) return _matchGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_matchGroups);
}

@override@JsonKey() final  ChampProfileStatus matchesStatus;

/// Create a copy of ChampProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChampProfileStateCopyWith<_ChampProfileState> get copyWith => __$ChampProfileStateCopyWithImpl<_ChampProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChampProfileState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.details, details) || other.details == details)&&(identical(other.detailsStatus, detailsStatus) || other.detailsStatus == detailsStatus)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&const DeepCollectionEquality().equals(other._teams, _teams)&&(identical(other.teamsStatus, teamsStatus) || other.teamsStatus == teamsStatus)&&const DeepCollectionEquality().equals(other._matchGroups, _matchGroups)&&(identical(other.matchesStatus, matchesStatus) || other.matchesStatus == matchesStatus));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,details,detailsStatus,isFavorite,const DeepCollectionEquality().hash(_teams),teamsStatus,const DeepCollectionEquality().hash(_matchGroups),matchesStatus);

@override
String toString() {
  return 'ChampProfileState(selectedTab: $selectedTab, details: $details, detailsStatus: $detailsStatus, isFavorite: $isFavorite, teams: $teams, teamsStatus: $teamsStatus, matchGroups: $matchGroups, matchesStatus: $matchesStatus)';
}


}

/// @nodoc
abstract mixin class _$ChampProfileStateCopyWith<$Res> implements $ChampProfileStateCopyWith<$Res> {
  factory _$ChampProfileStateCopyWith(_ChampProfileState value, $Res Function(_ChampProfileState) _then) = __$ChampProfileStateCopyWithImpl;
@override @useResult
$Res call({
 ChampTab selectedTab, ChampionshipDetailsModel? details, ChampProfileStatus detailsStatus, bool isFavorite, List<ApprovedTeamModel> teams, ChampProfileStatus teamsStatus, List<MatchGroupModel> matchGroups, ChampProfileStatus matchesStatus
});


@override $ChampProfileStatusCopyWith<$Res> get detailsStatus;@override $ChampProfileStatusCopyWith<$Res> get teamsStatus;@override $ChampProfileStatusCopyWith<$Res> get matchesStatus;

}
/// @nodoc
class __$ChampProfileStateCopyWithImpl<$Res>
    implements _$ChampProfileStateCopyWith<$Res> {
  __$ChampProfileStateCopyWithImpl(this._self, this._then);

  final _ChampProfileState _self;
  final $Res Function(_ChampProfileState) _then;

/// Create a copy of ChampProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,Object? details = freezed,Object? detailsStatus = null,Object? isFavorite = null,Object? teams = null,Object? teamsStatus = null,Object? matchGroups = null,Object? matchesStatus = null,}) {
  return _then(_ChampProfileState(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as ChampTab,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as ChampionshipDetailsModel?,detailsStatus: null == detailsStatus ? _self.detailsStatus : detailsStatus // ignore: cast_nullable_to_non_nullable
as ChampProfileStatus,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,teams: null == teams ? _self._teams : teams // ignore: cast_nullable_to_non_nullable
as List<ApprovedTeamModel>,teamsStatus: null == teamsStatus ? _self.teamsStatus : teamsStatus // ignore: cast_nullable_to_non_nullable
as ChampProfileStatus,matchGroups: null == matchGroups ? _self._matchGroups : matchGroups // ignore: cast_nullable_to_non_nullable
as List<MatchGroupModel>,matchesStatus: null == matchesStatus ? _self.matchesStatus : matchesStatus // ignore: cast_nullable_to_non_nullable
as ChampProfileStatus,
  ));
}

/// Create a copy of ChampProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChampProfileStatusCopyWith<$Res> get detailsStatus {
  
  return $ChampProfileStatusCopyWith<$Res>(_self.detailsStatus, (value) {
    return _then(_self.copyWith(detailsStatus: value));
  });
}/// Create a copy of ChampProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChampProfileStatusCopyWith<$Res> get teamsStatus {
  
  return $ChampProfileStatusCopyWith<$Res>(_self.teamsStatus, (value) {
    return _then(_self.copyWith(teamsStatus: value));
  });
}/// Create a copy of ChampProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChampProfileStatusCopyWith<$Res> get matchesStatus {
  
  return $ChampProfileStatusCopyWith<$Res>(_self.matchesStatus, (value) {
    return _then(_self.copyWith(matchesStatus: value));
  });
}
}

/// @nodoc
mixin _$ChampProfileStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampProfileStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampProfileStatus()';
}


}

/// @nodoc
class $ChampProfileStatusCopyWith<$Res>  {
$ChampProfileStatusCopyWith(ChampProfileStatus _, $Res Function(ChampProfileStatus) __);
}


/// Adds pattern-matching-related methods to [ChampProfileStatus].
extension ChampProfileStatusPatterns on ChampProfileStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChampProfileStatusInitial value)?  initial,TResult Function( ChampProfileStatusLoading value)?  loading,TResult Function( ChampProfileStatusSuccess value)?  success,TResult Function( ChampProfileStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChampProfileStatusInitial() when initial != null:
return initial(_that);case ChampProfileStatusLoading() when loading != null:
return loading(_that);case ChampProfileStatusSuccess() when success != null:
return success(_that);case ChampProfileStatusError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChampProfileStatusInitial value)  initial,required TResult Function( ChampProfileStatusLoading value)  loading,required TResult Function( ChampProfileStatusSuccess value)  success,required TResult Function( ChampProfileStatusError value)  error,}){
final _that = this;
switch (_that) {
case ChampProfileStatusInitial():
return initial(_that);case ChampProfileStatusLoading():
return loading(_that);case ChampProfileStatusSuccess():
return success(_that);case ChampProfileStatusError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChampProfileStatusInitial value)?  initial,TResult? Function( ChampProfileStatusLoading value)?  loading,TResult? Function( ChampProfileStatusSuccess value)?  success,TResult? Function( ChampProfileStatusError value)?  error,}){
final _that = this;
switch (_that) {
case ChampProfileStatusInitial() when initial != null:
return initial(_that);case ChampProfileStatusLoading() when loading != null:
return loading(_that);case ChampProfileStatusSuccess() when success != null:
return success(_that);case ChampProfileStatusError() when error != null:
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
case ChampProfileStatusInitial() when initial != null:
return initial();case ChampProfileStatusLoading() when loading != null:
return loading();case ChampProfileStatusSuccess() when success != null:
return success();case ChampProfileStatusError() when error != null:
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
case ChampProfileStatusInitial():
return initial();case ChampProfileStatusLoading():
return loading();case ChampProfileStatusSuccess():
return success();case ChampProfileStatusError():
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
case ChampProfileStatusInitial() when initial != null:
return initial();case ChampProfileStatusLoading() when loading != null:
return loading();case ChampProfileStatusSuccess() when success != null:
return success();case ChampProfileStatusError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class ChampProfileStatusInitial implements ChampProfileStatus {
  const ChampProfileStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampProfileStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampProfileStatus.initial()';
}


}




/// @nodoc


class ChampProfileStatusLoading implements ChampProfileStatus {
  const ChampProfileStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampProfileStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampProfileStatus.loading()';
}


}




/// @nodoc


class ChampProfileStatusSuccess implements ChampProfileStatus {
  const ChampProfileStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampProfileStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampProfileStatus.success()';
}


}




/// @nodoc


class ChampProfileStatusError implements ChampProfileStatus {
  const ChampProfileStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampProfileStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampProfileStatus.error()';
}


}




// dart format on
