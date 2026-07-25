// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_championships_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyChampionshipsState {

 int get selectedTabIndex;// ─── Stats ───────────────────────────────────────────────
 MyChampionshipsStatsModel? get stats; MyChampStatus get statsStatus;// ─── Tab 0 → API tab 1 (subscribed / participations) ─────
 List<MyChampionshipParticipationModel> get participations; int get participationsPage; MyChampStatus get participationsStatus;// ─── Tab 1 → API tab 2 (organized) ───────────────────────
 List<MyChampionshipOrganizedModel> get organized; int get organizedPage; MyChampStatus get organizedStatus;// ─── Tab 2 → API tab 3 (completed / history) ─────────────
 List<MyChampionshipParticipationModel> get history; int get historyPage; MyChampStatus get historyStatus;// ─── Bottom sheet: matches ───────────────────────────────
 List<MatchGroupModel> get sheetMatches; MyChampStatus get matchesStatus;// ─── Bottom sheet: my team ───────────────────────────────
 MyTeamModel? get sheetTeam; MyChampStatus get teamStatus;
/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyChampionshipsStateCopyWith<MyChampionshipsState> get copyWith => _$MyChampionshipsStateCopyWithImpl<MyChampionshipsState>(this as MyChampionshipsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyChampionshipsState&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.statsStatus, statsStatus) || other.statsStatus == statsStatus)&&const DeepCollectionEquality().equals(other.participations, participations)&&(identical(other.participationsPage, participationsPage) || other.participationsPage == participationsPage)&&(identical(other.participationsStatus, participationsStatus) || other.participationsStatus == participationsStatus)&&const DeepCollectionEquality().equals(other.organized, organized)&&(identical(other.organizedPage, organizedPage) || other.organizedPage == organizedPage)&&(identical(other.organizedStatus, organizedStatus) || other.organizedStatus == organizedStatus)&&const DeepCollectionEquality().equals(other.history, history)&&(identical(other.historyPage, historyPage) || other.historyPage == historyPage)&&(identical(other.historyStatus, historyStatus) || other.historyStatus == historyStatus)&&const DeepCollectionEquality().equals(other.sheetMatches, sheetMatches)&&(identical(other.matchesStatus, matchesStatus) || other.matchesStatus == matchesStatus)&&(identical(other.sheetTeam, sheetTeam) || other.sheetTeam == sheetTeam)&&(identical(other.teamStatus, teamStatus) || other.teamStatus == teamStatus));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTabIndex,stats,statsStatus,const DeepCollectionEquality().hash(participations),participationsPage,participationsStatus,const DeepCollectionEquality().hash(organized),organizedPage,organizedStatus,const DeepCollectionEquality().hash(history),historyPage,historyStatus,const DeepCollectionEquality().hash(sheetMatches),matchesStatus,sheetTeam,teamStatus);

@override
String toString() {
  return 'MyChampionshipsState(selectedTabIndex: $selectedTabIndex, stats: $stats, statsStatus: $statsStatus, participations: $participations, participationsPage: $participationsPage, participationsStatus: $participationsStatus, organized: $organized, organizedPage: $organizedPage, organizedStatus: $organizedStatus, history: $history, historyPage: $historyPage, historyStatus: $historyStatus, sheetMatches: $sheetMatches, matchesStatus: $matchesStatus, sheetTeam: $sheetTeam, teamStatus: $teamStatus)';
}


}

/// @nodoc
abstract mixin class $MyChampionshipsStateCopyWith<$Res>  {
  factory $MyChampionshipsStateCopyWith(MyChampionshipsState value, $Res Function(MyChampionshipsState) _then) = _$MyChampionshipsStateCopyWithImpl;
@useResult
$Res call({
 int selectedTabIndex, MyChampionshipsStatsModel? stats, MyChampStatus statsStatus, List<MyChampionshipParticipationModel> participations, int participationsPage, MyChampStatus participationsStatus, List<MyChampionshipOrganizedModel> organized, int organizedPage, MyChampStatus organizedStatus, List<MyChampionshipParticipationModel> history, int historyPage, MyChampStatus historyStatus, List<MatchGroupModel> sheetMatches, MyChampStatus matchesStatus, MyTeamModel? sheetTeam, MyChampStatus teamStatus
});


$MyChampStatusCopyWith<$Res> get statsStatus;$MyChampStatusCopyWith<$Res> get participationsStatus;$MyChampStatusCopyWith<$Res> get organizedStatus;$MyChampStatusCopyWith<$Res> get historyStatus;$MyChampStatusCopyWith<$Res> get matchesStatus;$MyChampStatusCopyWith<$Res> get teamStatus;

}
/// @nodoc
class _$MyChampionshipsStateCopyWithImpl<$Res>
    implements $MyChampionshipsStateCopyWith<$Res> {
  _$MyChampionshipsStateCopyWithImpl(this._self, this._then);

  final MyChampionshipsState _self;
  final $Res Function(MyChampionshipsState) _then;

/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTabIndex = null,Object? stats = freezed,Object? statsStatus = null,Object? participations = null,Object? participationsPage = null,Object? participationsStatus = null,Object? organized = null,Object? organizedPage = null,Object? organizedStatus = null,Object? history = null,Object? historyPage = null,Object? historyStatus = null,Object? sheetMatches = null,Object? matchesStatus = null,Object? sheetTeam = freezed,Object? teamStatus = null,}) {
  return _then(_self.copyWith(
selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as MyChampionshipsStatsModel?,statsStatus: null == statsStatus ? _self.statsStatus : statsStatus // ignore: cast_nullable_to_non_nullable
as MyChampStatus,participations: null == participations ? _self.participations : participations // ignore: cast_nullable_to_non_nullable
as List<MyChampionshipParticipationModel>,participationsPage: null == participationsPage ? _self.participationsPage : participationsPage // ignore: cast_nullable_to_non_nullable
as int,participationsStatus: null == participationsStatus ? _self.participationsStatus : participationsStatus // ignore: cast_nullable_to_non_nullable
as MyChampStatus,organized: null == organized ? _self.organized : organized // ignore: cast_nullable_to_non_nullable
as List<MyChampionshipOrganizedModel>,organizedPage: null == organizedPage ? _self.organizedPage : organizedPage // ignore: cast_nullable_to_non_nullable
as int,organizedStatus: null == organizedStatus ? _self.organizedStatus : organizedStatus // ignore: cast_nullable_to_non_nullable
as MyChampStatus,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<MyChampionshipParticipationModel>,historyPage: null == historyPage ? _self.historyPage : historyPage // ignore: cast_nullable_to_non_nullable
as int,historyStatus: null == historyStatus ? _self.historyStatus : historyStatus // ignore: cast_nullable_to_non_nullable
as MyChampStatus,sheetMatches: null == sheetMatches ? _self.sheetMatches : sheetMatches // ignore: cast_nullable_to_non_nullable
as List<MatchGroupModel>,matchesStatus: null == matchesStatus ? _self.matchesStatus : matchesStatus // ignore: cast_nullable_to_non_nullable
as MyChampStatus,sheetTeam: freezed == sheetTeam ? _self.sheetTeam : sheetTeam // ignore: cast_nullable_to_non_nullable
as MyTeamModel?,teamStatus: null == teamStatus ? _self.teamStatus : teamStatus // ignore: cast_nullable_to_non_nullable
as MyChampStatus,
  ));
}
/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChampStatusCopyWith<$Res> get statsStatus {
  
  return $MyChampStatusCopyWith<$Res>(_self.statsStatus, (value) {
    return _then(_self.copyWith(statsStatus: value));
  });
}/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChampStatusCopyWith<$Res> get participationsStatus {
  
  return $MyChampStatusCopyWith<$Res>(_self.participationsStatus, (value) {
    return _then(_self.copyWith(participationsStatus: value));
  });
}/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChampStatusCopyWith<$Res> get organizedStatus {
  
  return $MyChampStatusCopyWith<$Res>(_self.organizedStatus, (value) {
    return _then(_self.copyWith(organizedStatus: value));
  });
}/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChampStatusCopyWith<$Res> get historyStatus {
  
  return $MyChampStatusCopyWith<$Res>(_self.historyStatus, (value) {
    return _then(_self.copyWith(historyStatus: value));
  });
}/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChampStatusCopyWith<$Res> get matchesStatus {
  
  return $MyChampStatusCopyWith<$Res>(_self.matchesStatus, (value) {
    return _then(_self.copyWith(matchesStatus: value));
  });
}/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChampStatusCopyWith<$Res> get teamStatus {
  
  return $MyChampStatusCopyWith<$Res>(_self.teamStatus, (value) {
    return _then(_self.copyWith(teamStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyChampionshipsState].
extension MyChampionshipsStatePatterns on MyChampionshipsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyChampionshipsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyChampionshipsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyChampionshipsState value)  $default,){
final _that = this;
switch (_that) {
case _MyChampionshipsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyChampionshipsState value)?  $default,){
final _that = this;
switch (_that) {
case _MyChampionshipsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int selectedTabIndex,  MyChampionshipsStatsModel? stats,  MyChampStatus statsStatus,  List<MyChampionshipParticipationModel> participations,  int participationsPage,  MyChampStatus participationsStatus,  List<MyChampionshipOrganizedModel> organized,  int organizedPage,  MyChampStatus organizedStatus,  List<MyChampionshipParticipationModel> history,  int historyPage,  MyChampStatus historyStatus,  List<MatchGroupModel> sheetMatches,  MyChampStatus matchesStatus,  MyTeamModel? sheetTeam,  MyChampStatus teamStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyChampionshipsState() when $default != null:
return $default(_that.selectedTabIndex,_that.stats,_that.statsStatus,_that.participations,_that.participationsPage,_that.participationsStatus,_that.organized,_that.organizedPage,_that.organizedStatus,_that.history,_that.historyPage,_that.historyStatus,_that.sheetMatches,_that.matchesStatus,_that.sheetTeam,_that.teamStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int selectedTabIndex,  MyChampionshipsStatsModel? stats,  MyChampStatus statsStatus,  List<MyChampionshipParticipationModel> participations,  int participationsPage,  MyChampStatus participationsStatus,  List<MyChampionshipOrganizedModel> organized,  int organizedPage,  MyChampStatus organizedStatus,  List<MyChampionshipParticipationModel> history,  int historyPage,  MyChampStatus historyStatus,  List<MatchGroupModel> sheetMatches,  MyChampStatus matchesStatus,  MyTeamModel? sheetTeam,  MyChampStatus teamStatus)  $default,) {final _that = this;
switch (_that) {
case _MyChampionshipsState():
return $default(_that.selectedTabIndex,_that.stats,_that.statsStatus,_that.participations,_that.participationsPage,_that.participationsStatus,_that.organized,_that.organizedPage,_that.organizedStatus,_that.history,_that.historyPage,_that.historyStatus,_that.sheetMatches,_that.matchesStatus,_that.sheetTeam,_that.teamStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int selectedTabIndex,  MyChampionshipsStatsModel? stats,  MyChampStatus statsStatus,  List<MyChampionshipParticipationModel> participations,  int participationsPage,  MyChampStatus participationsStatus,  List<MyChampionshipOrganizedModel> organized,  int organizedPage,  MyChampStatus organizedStatus,  List<MyChampionshipParticipationModel> history,  int historyPage,  MyChampStatus historyStatus,  List<MatchGroupModel> sheetMatches,  MyChampStatus matchesStatus,  MyTeamModel? sheetTeam,  MyChampStatus teamStatus)?  $default,) {final _that = this;
switch (_that) {
case _MyChampionshipsState() when $default != null:
return $default(_that.selectedTabIndex,_that.stats,_that.statsStatus,_that.participations,_that.participationsPage,_that.participationsStatus,_that.organized,_that.organizedPage,_that.organizedStatus,_that.history,_that.historyPage,_that.historyStatus,_that.sheetMatches,_that.matchesStatus,_that.sheetTeam,_that.teamStatus);case _:
  return null;

}
}

}

/// @nodoc


class _MyChampionshipsState implements MyChampionshipsState {
  const _MyChampionshipsState({this.selectedTabIndex = 0, this.stats, this.statsStatus = const MyChampStatus.initial(), final  List<MyChampionshipParticipationModel> participations = const [], this.participationsPage = 1, this.participationsStatus = const MyChampStatus.initial(), final  List<MyChampionshipOrganizedModel> organized = const [], this.organizedPage = 1, this.organizedStatus = const MyChampStatus.initial(), final  List<MyChampionshipParticipationModel> history = const [], this.historyPage = 1, this.historyStatus = const MyChampStatus.initial(), final  List<MatchGroupModel> sheetMatches = const [], this.matchesStatus = const MyChampStatus.initial(), this.sheetTeam, this.teamStatus = const MyChampStatus.initial()}): _participations = participations,_organized = organized,_history = history,_sheetMatches = sheetMatches;
  

@override@JsonKey() final  int selectedTabIndex;
// ─── Stats ───────────────────────────────────────────────
@override final  MyChampionshipsStatsModel? stats;
@override@JsonKey() final  MyChampStatus statsStatus;
// ─── Tab 0 → API tab 1 (subscribed / participations) ─────
 final  List<MyChampionshipParticipationModel> _participations;
// ─── Tab 0 → API tab 1 (subscribed / participations) ─────
@override@JsonKey() List<MyChampionshipParticipationModel> get participations {
  if (_participations is EqualUnmodifiableListView) return _participations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participations);
}

@override@JsonKey() final  int participationsPage;
@override@JsonKey() final  MyChampStatus participationsStatus;
// ─── Tab 1 → API tab 2 (organized) ───────────────────────
 final  List<MyChampionshipOrganizedModel> _organized;
// ─── Tab 1 → API tab 2 (organized) ───────────────────────
@override@JsonKey() List<MyChampionshipOrganizedModel> get organized {
  if (_organized is EqualUnmodifiableListView) return _organized;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_organized);
}

@override@JsonKey() final  int organizedPage;
@override@JsonKey() final  MyChampStatus organizedStatus;
// ─── Tab 2 → API tab 3 (completed / history) ─────────────
 final  List<MyChampionshipParticipationModel> _history;
// ─── Tab 2 → API tab 3 (completed / history) ─────────────
@override@JsonKey() List<MyChampionshipParticipationModel> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

@override@JsonKey() final  int historyPage;
@override@JsonKey() final  MyChampStatus historyStatus;
// ─── Bottom sheet: matches ───────────────────────────────
 final  List<MatchGroupModel> _sheetMatches;
// ─── Bottom sheet: matches ───────────────────────────────
@override@JsonKey() List<MatchGroupModel> get sheetMatches {
  if (_sheetMatches is EqualUnmodifiableListView) return _sheetMatches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sheetMatches);
}

@override@JsonKey() final  MyChampStatus matchesStatus;
// ─── Bottom sheet: my team ───────────────────────────────
@override final  MyTeamModel? sheetTeam;
@override@JsonKey() final  MyChampStatus teamStatus;

/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyChampionshipsStateCopyWith<_MyChampionshipsState> get copyWith => __$MyChampionshipsStateCopyWithImpl<_MyChampionshipsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyChampionshipsState&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.statsStatus, statsStatus) || other.statsStatus == statsStatus)&&const DeepCollectionEquality().equals(other._participations, _participations)&&(identical(other.participationsPage, participationsPage) || other.participationsPage == participationsPage)&&(identical(other.participationsStatus, participationsStatus) || other.participationsStatus == participationsStatus)&&const DeepCollectionEquality().equals(other._organized, _organized)&&(identical(other.organizedPage, organizedPage) || other.organizedPage == organizedPage)&&(identical(other.organizedStatus, organizedStatus) || other.organizedStatus == organizedStatus)&&const DeepCollectionEquality().equals(other._history, _history)&&(identical(other.historyPage, historyPage) || other.historyPage == historyPage)&&(identical(other.historyStatus, historyStatus) || other.historyStatus == historyStatus)&&const DeepCollectionEquality().equals(other._sheetMatches, _sheetMatches)&&(identical(other.matchesStatus, matchesStatus) || other.matchesStatus == matchesStatus)&&(identical(other.sheetTeam, sheetTeam) || other.sheetTeam == sheetTeam)&&(identical(other.teamStatus, teamStatus) || other.teamStatus == teamStatus));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTabIndex,stats,statsStatus,const DeepCollectionEquality().hash(_participations),participationsPage,participationsStatus,const DeepCollectionEquality().hash(_organized),organizedPage,organizedStatus,const DeepCollectionEquality().hash(_history),historyPage,historyStatus,const DeepCollectionEquality().hash(_sheetMatches),matchesStatus,sheetTeam,teamStatus);

@override
String toString() {
  return 'MyChampionshipsState(selectedTabIndex: $selectedTabIndex, stats: $stats, statsStatus: $statsStatus, participations: $participations, participationsPage: $participationsPage, participationsStatus: $participationsStatus, organized: $organized, organizedPage: $organizedPage, organizedStatus: $organizedStatus, history: $history, historyPage: $historyPage, historyStatus: $historyStatus, sheetMatches: $sheetMatches, matchesStatus: $matchesStatus, sheetTeam: $sheetTeam, teamStatus: $teamStatus)';
}


}

/// @nodoc
abstract mixin class _$MyChampionshipsStateCopyWith<$Res> implements $MyChampionshipsStateCopyWith<$Res> {
  factory _$MyChampionshipsStateCopyWith(_MyChampionshipsState value, $Res Function(_MyChampionshipsState) _then) = __$MyChampionshipsStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedTabIndex, MyChampionshipsStatsModel? stats, MyChampStatus statsStatus, List<MyChampionshipParticipationModel> participations, int participationsPage, MyChampStatus participationsStatus, List<MyChampionshipOrganizedModel> organized, int organizedPage, MyChampStatus organizedStatus, List<MyChampionshipParticipationModel> history, int historyPage, MyChampStatus historyStatus, List<MatchGroupModel> sheetMatches, MyChampStatus matchesStatus, MyTeamModel? sheetTeam, MyChampStatus teamStatus
});


@override $MyChampStatusCopyWith<$Res> get statsStatus;@override $MyChampStatusCopyWith<$Res> get participationsStatus;@override $MyChampStatusCopyWith<$Res> get organizedStatus;@override $MyChampStatusCopyWith<$Res> get historyStatus;@override $MyChampStatusCopyWith<$Res> get matchesStatus;@override $MyChampStatusCopyWith<$Res> get teamStatus;

}
/// @nodoc
class __$MyChampionshipsStateCopyWithImpl<$Res>
    implements _$MyChampionshipsStateCopyWith<$Res> {
  __$MyChampionshipsStateCopyWithImpl(this._self, this._then);

  final _MyChampionshipsState _self;
  final $Res Function(_MyChampionshipsState) _then;

/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTabIndex = null,Object? stats = freezed,Object? statsStatus = null,Object? participations = null,Object? participationsPage = null,Object? participationsStatus = null,Object? organized = null,Object? organizedPage = null,Object? organizedStatus = null,Object? history = null,Object? historyPage = null,Object? historyStatus = null,Object? sheetMatches = null,Object? matchesStatus = null,Object? sheetTeam = freezed,Object? teamStatus = null,}) {
  return _then(_MyChampionshipsState(
selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as MyChampionshipsStatsModel?,statsStatus: null == statsStatus ? _self.statsStatus : statsStatus // ignore: cast_nullable_to_non_nullable
as MyChampStatus,participations: null == participations ? _self._participations : participations // ignore: cast_nullable_to_non_nullable
as List<MyChampionshipParticipationModel>,participationsPage: null == participationsPage ? _self.participationsPage : participationsPage // ignore: cast_nullable_to_non_nullable
as int,participationsStatus: null == participationsStatus ? _self.participationsStatus : participationsStatus // ignore: cast_nullable_to_non_nullable
as MyChampStatus,organized: null == organized ? _self._organized : organized // ignore: cast_nullable_to_non_nullable
as List<MyChampionshipOrganizedModel>,organizedPage: null == organizedPage ? _self.organizedPage : organizedPage // ignore: cast_nullable_to_non_nullable
as int,organizedStatus: null == organizedStatus ? _self.organizedStatus : organizedStatus // ignore: cast_nullable_to_non_nullable
as MyChampStatus,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<MyChampionshipParticipationModel>,historyPage: null == historyPage ? _self.historyPage : historyPage // ignore: cast_nullable_to_non_nullable
as int,historyStatus: null == historyStatus ? _self.historyStatus : historyStatus // ignore: cast_nullable_to_non_nullable
as MyChampStatus,sheetMatches: null == sheetMatches ? _self._sheetMatches : sheetMatches // ignore: cast_nullable_to_non_nullable
as List<MatchGroupModel>,matchesStatus: null == matchesStatus ? _self.matchesStatus : matchesStatus // ignore: cast_nullable_to_non_nullable
as MyChampStatus,sheetTeam: freezed == sheetTeam ? _self.sheetTeam : sheetTeam // ignore: cast_nullable_to_non_nullable
as MyTeamModel?,teamStatus: null == teamStatus ? _self.teamStatus : teamStatus // ignore: cast_nullable_to_non_nullable
as MyChampStatus,
  ));
}

/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChampStatusCopyWith<$Res> get statsStatus {
  
  return $MyChampStatusCopyWith<$Res>(_self.statsStatus, (value) {
    return _then(_self.copyWith(statsStatus: value));
  });
}/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChampStatusCopyWith<$Res> get participationsStatus {
  
  return $MyChampStatusCopyWith<$Res>(_self.participationsStatus, (value) {
    return _then(_self.copyWith(participationsStatus: value));
  });
}/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChampStatusCopyWith<$Res> get organizedStatus {
  
  return $MyChampStatusCopyWith<$Res>(_self.organizedStatus, (value) {
    return _then(_self.copyWith(organizedStatus: value));
  });
}/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChampStatusCopyWith<$Res> get historyStatus {
  
  return $MyChampStatusCopyWith<$Res>(_self.historyStatus, (value) {
    return _then(_self.copyWith(historyStatus: value));
  });
}/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChampStatusCopyWith<$Res> get matchesStatus {
  
  return $MyChampStatusCopyWith<$Res>(_self.matchesStatus, (value) {
    return _then(_self.copyWith(matchesStatus: value));
  });
}/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChampStatusCopyWith<$Res> get teamStatus {
  
  return $MyChampStatusCopyWith<$Res>(_self.teamStatus, (value) {
    return _then(_self.copyWith(teamStatus: value));
  });
}
}

/// @nodoc
mixin _$MyChampStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyChampStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyChampStatus()';
}


}

/// @nodoc
class $MyChampStatusCopyWith<$Res>  {
$MyChampStatusCopyWith(MyChampStatus _, $Res Function(MyChampStatus) __);
}


/// Adds pattern-matching-related methods to [MyChampStatus].
extension MyChampStatusPatterns on MyChampStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MyChampStatusInitial value)?  initial,TResult Function( MyChampStatusLoading value)?  loading,TResult Function( MyChampStatusSuccess value)?  success,TResult Function( MyChampStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MyChampStatusInitial() when initial != null:
return initial(_that);case MyChampStatusLoading() when loading != null:
return loading(_that);case MyChampStatusSuccess() when success != null:
return success(_that);case MyChampStatusError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MyChampStatusInitial value)  initial,required TResult Function( MyChampStatusLoading value)  loading,required TResult Function( MyChampStatusSuccess value)  success,required TResult Function( MyChampStatusError value)  error,}){
final _that = this;
switch (_that) {
case MyChampStatusInitial():
return initial(_that);case MyChampStatusLoading():
return loading(_that);case MyChampStatusSuccess():
return success(_that);case MyChampStatusError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MyChampStatusInitial value)?  initial,TResult? Function( MyChampStatusLoading value)?  loading,TResult? Function( MyChampStatusSuccess value)?  success,TResult? Function( MyChampStatusError value)?  error,}){
final _that = this;
switch (_that) {
case MyChampStatusInitial() when initial != null:
return initial(_that);case MyChampStatusLoading() when loading != null:
return loading(_that);case MyChampStatusSuccess() when success != null:
return success(_that);case MyChampStatusError() when error != null:
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
case MyChampStatusInitial() when initial != null:
return initial();case MyChampStatusLoading() when loading != null:
return loading();case MyChampStatusSuccess() when success != null:
return success();case MyChampStatusError() when error != null:
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
case MyChampStatusInitial():
return initial();case MyChampStatusLoading():
return loading();case MyChampStatusSuccess():
return success();case MyChampStatusError():
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
case MyChampStatusInitial() when initial != null:
return initial();case MyChampStatusLoading() when loading != null:
return loading();case MyChampStatusSuccess() when success != null:
return success();case MyChampStatusError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class MyChampStatusInitial implements MyChampStatus {
  const MyChampStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyChampStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyChampStatus.initial()';
}


}




/// @nodoc


class MyChampStatusLoading implements MyChampStatus {
  const MyChampStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyChampStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyChampStatus.loading()';
}


}




/// @nodoc


class MyChampStatusSuccess implements MyChampStatus {
  const MyChampStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyChampStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyChampStatus.success()';
}


}




/// @nodoc


class MyChampStatusError implements MyChampStatus {
  const MyChampStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyChampStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyChampStatus.error()';
}


}




// dart format on
