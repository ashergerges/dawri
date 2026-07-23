// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'championship_control_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChampionshipControlState {

 int get activeTab;// ─── Overview ────────────────────────────────────────────
 ChampionshipOverviewModel? get overview; ControlStatus get overviewStatus; List<PendingRequestModel> get pendingRequests;// ─── Approved teams ──────────────────────────────────────
 List<ApprovedTeamModel> get approvedTeams; ControlStatus get teamsStatus;// ─── Matches ─────────────────────────────────────────────
 List<MatchGroupModel> get matchGroups; ControlStatus get matchesStatus;// ─── In-flight action (add match / save score) ───────────
 bool get isSubmitting;
/// Create a copy of ChampionshipControlState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChampionshipControlStateCopyWith<ChampionshipControlState> get copyWith => _$ChampionshipControlStateCopyWithImpl<ChampionshipControlState>(this as ChampionshipControlState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampionshipControlState&&(identical(other.activeTab, activeTab) || other.activeTab == activeTab)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.overviewStatus, overviewStatus) || other.overviewStatus == overviewStatus)&&const DeepCollectionEquality().equals(other.pendingRequests, pendingRequests)&&const DeepCollectionEquality().equals(other.approvedTeams, approvedTeams)&&(identical(other.teamsStatus, teamsStatus) || other.teamsStatus == teamsStatus)&&const DeepCollectionEquality().equals(other.matchGroups, matchGroups)&&(identical(other.matchesStatus, matchesStatus) || other.matchesStatus == matchesStatus)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting));
}


@override
int get hashCode => Object.hash(runtimeType,activeTab,overview,overviewStatus,const DeepCollectionEquality().hash(pendingRequests),const DeepCollectionEquality().hash(approvedTeams),teamsStatus,const DeepCollectionEquality().hash(matchGroups),matchesStatus,isSubmitting);

@override
String toString() {
  return 'ChampionshipControlState(activeTab: $activeTab, overview: $overview, overviewStatus: $overviewStatus, pendingRequests: $pendingRequests, approvedTeams: $approvedTeams, teamsStatus: $teamsStatus, matchGroups: $matchGroups, matchesStatus: $matchesStatus, isSubmitting: $isSubmitting)';
}


}

/// @nodoc
abstract mixin class $ChampionshipControlStateCopyWith<$Res>  {
  factory $ChampionshipControlStateCopyWith(ChampionshipControlState value, $Res Function(ChampionshipControlState) _then) = _$ChampionshipControlStateCopyWithImpl;
@useResult
$Res call({
 int activeTab, ChampionshipOverviewModel? overview, ControlStatus overviewStatus, List<PendingRequestModel> pendingRequests, List<ApprovedTeamModel> approvedTeams, ControlStatus teamsStatus, List<MatchGroupModel> matchGroups, ControlStatus matchesStatus, bool isSubmitting
});


$ControlStatusCopyWith<$Res> get overviewStatus;$ControlStatusCopyWith<$Res> get teamsStatus;$ControlStatusCopyWith<$Res> get matchesStatus;

}
/// @nodoc
class _$ChampionshipControlStateCopyWithImpl<$Res>
    implements $ChampionshipControlStateCopyWith<$Res> {
  _$ChampionshipControlStateCopyWithImpl(this._self, this._then);

  final ChampionshipControlState _self;
  final $Res Function(ChampionshipControlState) _then;

/// Create a copy of ChampionshipControlState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeTab = null,Object? overview = freezed,Object? overviewStatus = null,Object? pendingRequests = null,Object? approvedTeams = null,Object? teamsStatus = null,Object? matchGroups = null,Object? matchesStatus = null,Object? isSubmitting = null,}) {
  return _then(_self.copyWith(
activeTab: null == activeTab ? _self.activeTab : activeTab // ignore: cast_nullable_to_non_nullable
as int,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as ChampionshipOverviewModel?,overviewStatus: null == overviewStatus ? _self.overviewStatus : overviewStatus // ignore: cast_nullable_to_non_nullable
as ControlStatus,pendingRequests: null == pendingRequests ? _self.pendingRequests : pendingRequests // ignore: cast_nullable_to_non_nullable
as List<PendingRequestModel>,approvedTeams: null == approvedTeams ? _self.approvedTeams : approvedTeams // ignore: cast_nullable_to_non_nullable
as List<ApprovedTeamModel>,teamsStatus: null == teamsStatus ? _self.teamsStatus : teamsStatus // ignore: cast_nullable_to_non_nullable
as ControlStatus,matchGroups: null == matchGroups ? _self.matchGroups : matchGroups // ignore: cast_nullable_to_non_nullable
as List<MatchGroupModel>,matchesStatus: null == matchesStatus ? _self.matchesStatus : matchesStatus // ignore: cast_nullable_to_non_nullable
as ControlStatus,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ChampionshipControlState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ControlStatusCopyWith<$Res> get overviewStatus {
  
  return $ControlStatusCopyWith<$Res>(_self.overviewStatus, (value) {
    return _then(_self.copyWith(overviewStatus: value));
  });
}/// Create a copy of ChampionshipControlState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ControlStatusCopyWith<$Res> get teamsStatus {
  
  return $ControlStatusCopyWith<$Res>(_self.teamsStatus, (value) {
    return _then(_self.copyWith(teamsStatus: value));
  });
}/// Create a copy of ChampionshipControlState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ControlStatusCopyWith<$Res> get matchesStatus {
  
  return $ControlStatusCopyWith<$Res>(_self.matchesStatus, (value) {
    return _then(_self.copyWith(matchesStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChampionshipControlState].
extension ChampionshipControlStatePatterns on ChampionshipControlState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChampionshipControlState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChampionshipControlState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChampionshipControlState value)  $default,){
final _that = this;
switch (_that) {
case _ChampionshipControlState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChampionshipControlState value)?  $default,){
final _that = this;
switch (_that) {
case _ChampionshipControlState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int activeTab,  ChampionshipOverviewModel? overview,  ControlStatus overviewStatus,  List<PendingRequestModel> pendingRequests,  List<ApprovedTeamModel> approvedTeams,  ControlStatus teamsStatus,  List<MatchGroupModel> matchGroups,  ControlStatus matchesStatus,  bool isSubmitting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChampionshipControlState() when $default != null:
return $default(_that.activeTab,_that.overview,_that.overviewStatus,_that.pendingRequests,_that.approvedTeams,_that.teamsStatus,_that.matchGroups,_that.matchesStatus,_that.isSubmitting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int activeTab,  ChampionshipOverviewModel? overview,  ControlStatus overviewStatus,  List<PendingRequestModel> pendingRequests,  List<ApprovedTeamModel> approvedTeams,  ControlStatus teamsStatus,  List<MatchGroupModel> matchGroups,  ControlStatus matchesStatus,  bool isSubmitting)  $default,) {final _that = this;
switch (_that) {
case _ChampionshipControlState():
return $default(_that.activeTab,_that.overview,_that.overviewStatus,_that.pendingRequests,_that.approvedTeams,_that.teamsStatus,_that.matchGroups,_that.matchesStatus,_that.isSubmitting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int activeTab,  ChampionshipOverviewModel? overview,  ControlStatus overviewStatus,  List<PendingRequestModel> pendingRequests,  List<ApprovedTeamModel> approvedTeams,  ControlStatus teamsStatus,  List<MatchGroupModel> matchGroups,  ControlStatus matchesStatus,  bool isSubmitting)?  $default,) {final _that = this;
switch (_that) {
case _ChampionshipControlState() when $default != null:
return $default(_that.activeTab,_that.overview,_that.overviewStatus,_that.pendingRequests,_that.approvedTeams,_that.teamsStatus,_that.matchGroups,_that.matchesStatus,_that.isSubmitting);case _:
  return null;

}
}

}

/// @nodoc


class _ChampionshipControlState implements ChampionshipControlState {
  const _ChampionshipControlState({this.activeTab = 0, this.overview, this.overviewStatus = const ControlStatus.initial(), final  List<PendingRequestModel> pendingRequests = const [], final  List<ApprovedTeamModel> approvedTeams = const [], this.teamsStatus = const ControlStatus.initial(), final  List<MatchGroupModel> matchGroups = const [], this.matchesStatus = const ControlStatus.initial(), this.isSubmitting = false}): _pendingRequests = pendingRequests,_approvedTeams = approvedTeams,_matchGroups = matchGroups;
  

@override@JsonKey() final  int activeTab;
// ─── Overview ────────────────────────────────────────────
@override final  ChampionshipOverviewModel? overview;
@override@JsonKey() final  ControlStatus overviewStatus;
 final  List<PendingRequestModel> _pendingRequests;
@override@JsonKey() List<PendingRequestModel> get pendingRequests {
  if (_pendingRequests is EqualUnmodifiableListView) return _pendingRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pendingRequests);
}

// ─── Approved teams ──────────────────────────────────────
 final  List<ApprovedTeamModel> _approvedTeams;
// ─── Approved teams ──────────────────────────────────────
@override@JsonKey() List<ApprovedTeamModel> get approvedTeams {
  if (_approvedTeams is EqualUnmodifiableListView) return _approvedTeams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_approvedTeams);
}

@override@JsonKey() final  ControlStatus teamsStatus;
// ─── Matches ─────────────────────────────────────────────
 final  List<MatchGroupModel> _matchGroups;
// ─── Matches ─────────────────────────────────────────────
@override@JsonKey() List<MatchGroupModel> get matchGroups {
  if (_matchGroups is EqualUnmodifiableListView) return _matchGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_matchGroups);
}

@override@JsonKey() final  ControlStatus matchesStatus;
// ─── In-flight action (add match / save score) ───────────
@override@JsonKey() final  bool isSubmitting;

/// Create a copy of ChampionshipControlState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChampionshipControlStateCopyWith<_ChampionshipControlState> get copyWith => __$ChampionshipControlStateCopyWithImpl<_ChampionshipControlState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChampionshipControlState&&(identical(other.activeTab, activeTab) || other.activeTab == activeTab)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.overviewStatus, overviewStatus) || other.overviewStatus == overviewStatus)&&const DeepCollectionEquality().equals(other._pendingRequests, _pendingRequests)&&const DeepCollectionEquality().equals(other._approvedTeams, _approvedTeams)&&(identical(other.teamsStatus, teamsStatus) || other.teamsStatus == teamsStatus)&&const DeepCollectionEquality().equals(other._matchGroups, _matchGroups)&&(identical(other.matchesStatus, matchesStatus) || other.matchesStatus == matchesStatus)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting));
}


@override
int get hashCode => Object.hash(runtimeType,activeTab,overview,overviewStatus,const DeepCollectionEquality().hash(_pendingRequests),const DeepCollectionEquality().hash(_approvedTeams),teamsStatus,const DeepCollectionEquality().hash(_matchGroups),matchesStatus,isSubmitting);

@override
String toString() {
  return 'ChampionshipControlState(activeTab: $activeTab, overview: $overview, overviewStatus: $overviewStatus, pendingRequests: $pendingRequests, approvedTeams: $approvedTeams, teamsStatus: $teamsStatus, matchGroups: $matchGroups, matchesStatus: $matchesStatus, isSubmitting: $isSubmitting)';
}


}

/// @nodoc
abstract mixin class _$ChampionshipControlStateCopyWith<$Res> implements $ChampionshipControlStateCopyWith<$Res> {
  factory _$ChampionshipControlStateCopyWith(_ChampionshipControlState value, $Res Function(_ChampionshipControlState) _then) = __$ChampionshipControlStateCopyWithImpl;
@override @useResult
$Res call({
 int activeTab, ChampionshipOverviewModel? overview, ControlStatus overviewStatus, List<PendingRequestModel> pendingRequests, List<ApprovedTeamModel> approvedTeams, ControlStatus teamsStatus, List<MatchGroupModel> matchGroups, ControlStatus matchesStatus, bool isSubmitting
});


@override $ControlStatusCopyWith<$Res> get overviewStatus;@override $ControlStatusCopyWith<$Res> get teamsStatus;@override $ControlStatusCopyWith<$Res> get matchesStatus;

}
/// @nodoc
class __$ChampionshipControlStateCopyWithImpl<$Res>
    implements _$ChampionshipControlStateCopyWith<$Res> {
  __$ChampionshipControlStateCopyWithImpl(this._self, this._then);

  final _ChampionshipControlState _self;
  final $Res Function(_ChampionshipControlState) _then;

/// Create a copy of ChampionshipControlState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeTab = null,Object? overview = freezed,Object? overviewStatus = null,Object? pendingRequests = null,Object? approvedTeams = null,Object? teamsStatus = null,Object? matchGroups = null,Object? matchesStatus = null,Object? isSubmitting = null,}) {
  return _then(_ChampionshipControlState(
activeTab: null == activeTab ? _self.activeTab : activeTab // ignore: cast_nullable_to_non_nullable
as int,overview: freezed == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as ChampionshipOverviewModel?,overviewStatus: null == overviewStatus ? _self.overviewStatus : overviewStatus // ignore: cast_nullable_to_non_nullable
as ControlStatus,pendingRequests: null == pendingRequests ? _self._pendingRequests : pendingRequests // ignore: cast_nullable_to_non_nullable
as List<PendingRequestModel>,approvedTeams: null == approvedTeams ? _self._approvedTeams : approvedTeams // ignore: cast_nullable_to_non_nullable
as List<ApprovedTeamModel>,teamsStatus: null == teamsStatus ? _self.teamsStatus : teamsStatus // ignore: cast_nullable_to_non_nullable
as ControlStatus,matchGroups: null == matchGroups ? _self._matchGroups : matchGroups // ignore: cast_nullable_to_non_nullable
as List<MatchGroupModel>,matchesStatus: null == matchesStatus ? _self.matchesStatus : matchesStatus // ignore: cast_nullable_to_non_nullable
as ControlStatus,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ChampionshipControlState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ControlStatusCopyWith<$Res> get overviewStatus {
  
  return $ControlStatusCopyWith<$Res>(_self.overviewStatus, (value) {
    return _then(_self.copyWith(overviewStatus: value));
  });
}/// Create a copy of ChampionshipControlState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ControlStatusCopyWith<$Res> get teamsStatus {
  
  return $ControlStatusCopyWith<$Res>(_self.teamsStatus, (value) {
    return _then(_self.copyWith(teamsStatus: value));
  });
}/// Create a copy of ChampionshipControlState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ControlStatusCopyWith<$Res> get matchesStatus {
  
  return $ControlStatusCopyWith<$Res>(_self.matchesStatus, (value) {
    return _then(_self.copyWith(matchesStatus: value));
  });
}
}

/// @nodoc
mixin _$ControlStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ControlStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ControlStatus()';
}


}

/// @nodoc
class $ControlStatusCopyWith<$Res>  {
$ControlStatusCopyWith(ControlStatus _, $Res Function(ControlStatus) __);
}


/// Adds pattern-matching-related methods to [ControlStatus].
extension ControlStatusPatterns on ControlStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ControlStatusInitial value)?  initial,TResult Function( ControlStatusLoading value)?  loading,TResult Function( ControlStatusSuccess value)?  success,TResult Function( ControlStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ControlStatusInitial() when initial != null:
return initial(_that);case ControlStatusLoading() when loading != null:
return loading(_that);case ControlStatusSuccess() when success != null:
return success(_that);case ControlStatusError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ControlStatusInitial value)  initial,required TResult Function( ControlStatusLoading value)  loading,required TResult Function( ControlStatusSuccess value)  success,required TResult Function( ControlStatusError value)  error,}){
final _that = this;
switch (_that) {
case ControlStatusInitial():
return initial(_that);case ControlStatusLoading():
return loading(_that);case ControlStatusSuccess():
return success(_that);case ControlStatusError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ControlStatusInitial value)?  initial,TResult? Function( ControlStatusLoading value)?  loading,TResult? Function( ControlStatusSuccess value)?  success,TResult? Function( ControlStatusError value)?  error,}){
final _that = this;
switch (_that) {
case ControlStatusInitial() when initial != null:
return initial(_that);case ControlStatusLoading() when loading != null:
return loading(_that);case ControlStatusSuccess() when success != null:
return success(_that);case ControlStatusError() when error != null:
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
case ControlStatusInitial() when initial != null:
return initial();case ControlStatusLoading() when loading != null:
return loading();case ControlStatusSuccess() when success != null:
return success();case ControlStatusError() when error != null:
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
case ControlStatusInitial():
return initial();case ControlStatusLoading():
return loading();case ControlStatusSuccess():
return success();case ControlStatusError():
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
case ControlStatusInitial() when initial != null:
return initial();case ControlStatusLoading() when loading != null:
return loading();case ControlStatusSuccess() when success != null:
return success();case ControlStatusError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class ControlStatusInitial implements ControlStatus {
  const ControlStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ControlStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ControlStatus.initial()';
}


}




/// @nodoc


class ControlStatusLoading implements ControlStatus {
  const ControlStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ControlStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ControlStatus.loading()';
}


}




/// @nodoc


class ControlStatusSuccess implements ControlStatus {
  const ControlStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ControlStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ControlStatus.success()';
}


}




/// @nodoc


class ControlStatusError implements ControlStatus {
  const ControlStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ControlStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ControlStatus.error()';
}


}




// dart format on
