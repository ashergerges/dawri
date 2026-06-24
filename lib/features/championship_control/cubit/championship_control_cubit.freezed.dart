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

 int get activeTab; List<PendingRequest> get pendingRequests; List<ApprovedTeam> get approvedTeams; List<Match> get matches;
/// Create a copy of ChampionshipControlState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChampionshipControlStateCopyWith<ChampionshipControlState> get copyWith => _$ChampionshipControlStateCopyWithImpl<ChampionshipControlState>(this as ChampionshipControlState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampionshipControlState&&(identical(other.activeTab, activeTab) || other.activeTab == activeTab)&&const DeepCollectionEquality().equals(other.pendingRequests, pendingRequests)&&const DeepCollectionEquality().equals(other.approvedTeams, approvedTeams)&&const DeepCollectionEquality().equals(other.matches, matches));
}


@override
int get hashCode => Object.hash(runtimeType,activeTab,const DeepCollectionEquality().hash(pendingRequests),const DeepCollectionEquality().hash(approvedTeams),const DeepCollectionEquality().hash(matches));

@override
String toString() {
  return 'ChampionshipControlState(activeTab: $activeTab, pendingRequests: $pendingRequests, approvedTeams: $approvedTeams, matches: $matches)';
}


}

/// @nodoc
abstract mixin class $ChampionshipControlStateCopyWith<$Res>  {
  factory $ChampionshipControlStateCopyWith(ChampionshipControlState value, $Res Function(ChampionshipControlState) _then) = _$ChampionshipControlStateCopyWithImpl;
@useResult
$Res call({
 int activeTab, List<PendingRequest> pendingRequests, List<ApprovedTeam> approvedTeams, List<Match> matches
});




}
/// @nodoc
class _$ChampionshipControlStateCopyWithImpl<$Res>
    implements $ChampionshipControlStateCopyWith<$Res> {
  _$ChampionshipControlStateCopyWithImpl(this._self, this._then);

  final ChampionshipControlState _self;
  final $Res Function(ChampionshipControlState) _then;

/// Create a copy of ChampionshipControlState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeTab = null,Object? pendingRequests = null,Object? approvedTeams = null,Object? matches = null,}) {
  return _then(_self.copyWith(
activeTab: null == activeTab ? _self.activeTab : activeTab // ignore: cast_nullable_to_non_nullable
as int,pendingRequests: null == pendingRequests ? _self.pendingRequests : pendingRequests // ignore: cast_nullable_to_non_nullable
as List<PendingRequest>,approvedTeams: null == approvedTeams ? _self.approvedTeams : approvedTeams // ignore: cast_nullable_to_non_nullable
as List<ApprovedTeam>,matches: null == matches ? _self.matches : matches // ignore: cast_nullable_to_non_nullable
as List<Match>,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int activeTab,  List<PendingRequest> pendingRequests,  List<ApprovedTeam> approvedTeams,  List<Match> matches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChampionshipControlState() when $default != null:
return $default(_that.activeTab,_that.pendingRequests,_that.approvedTeams,_that.matches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int activeTab,  List<PendingRequest> pendingRequests,  List<ApprovedTeam> approvedTeams,  List<Match> matches)  $default,) {final _that = this;
switch (_that) {
case _ChampionshipControlState():
return $default(_that.activeTab,_that.pendingRequests,_that.approvedTeams,_that.matches);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int activeTab,  List<PendingRequest> pendingRequests,  List<ApprovedTeam> approvedTeams,  List<Match> matches)?  $default,) {final _that = this;
switch (_that) {
case _ChampionshipControlState() when $default != null:
return $default(_that.activeTab,_that.pendingRequests,_that.approvedTeams,_that.matches);case _:
  return null;

}
}

}

/// @nodoc


class _ChampionshipControlState implements ChampionshipControlState {
  const _ChampionshipControlState({this.activeTab = 0, final  List<PendingRequest> pendingRequests = const [], final  List<ApprovedTeam> approvedTeams = const [], final  List<Match> matches = const []}): _pendingRequests = pendingRequests,_approvedTeams = approvedTeams,_matches = matches;
  

@override@JsonKey() final  int activeTab;
 final  List<PendingRequest> _pendingRequests;
@override@JsonKey() List<PendingRequest> get pendingRequests {
  if (_pendingRequests is EqualUnmodifiableListView) return _pendingRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pendingRequests);
}

 final  List<ApprovedTeam> _approvedTeams;
@override@JsonKey() List<ApprovedTeam> get approvedTeams {
  if (_approvedTeams is EqualUnmodifiableListView) return _approvedTeams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_approvedTeams);
}

 final  List<Match> _matches;
@override@JsonKey() List<Match> get matches {
  if (_matches is EqualUnmodifiableListView) return _matches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_matches);
}


/// Create a copy of ChampionshipControlState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChampionshipControlStateCopyWith<_ChampionshipControlState> get copyWith => __$ChampionshipControlStateCopyWithImpl<_ChampionshipControlState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChampionshipControlState&&(identical(other.activeTab, activeTab) || other.activeTab == activeTab)&&const DeepCollectionEquality().equals(other._pendingRequests, _pendingRequests)&&const DeepCollectionEquality().equals(other._approvedTeams, _approvedTeams)&&const DeepCollectionEquality().equals(other._matches, _matches));
}


@override
int get hashCode => Object.hash(runtimeType,activeTab,const DeepCollectionEquality().hash(_pendingRequests),const DeepCollectionEquality().hash(_approvedTeams),const DeepCollectionEquality().hash(_matches));

@override
String toString() {
  return 'ChampionshipControlState(activeTab: $activeTab, pendingRequests: $pendingRequests, approvedTeams: $approvedTeams, matches: $matches)';
}


}

/// @nodoc
abstract mixin class _$ChampionshipControlStateCopyWith<$Res> implements $ChampionshipControlStateCopyWith<$Res> {
  factory _$ChampionshipControlStateCopyWith(_ChampionshipControlState value, $Res Function(_ChampionshipControlState) _then) = __$ChampionshipControlStateCopyWithImpl;
@override @useResult
$Res call({
 int activeTab, List<PendingRequest> pendingRequests, List<ApprovedTeam> approvedTeams, List<Match> matches
});




}
/// @nodoc
class __$ChampionshipControlStateCopyWithImpl<$Res>
    implements _$ChampionshipControlStateCopyWith<$Res> {
  __$ChampionshipControlStateCopyWithImpl(this._self, this._then);

  final _ChampionshipControlState _self;
  final $Res Function(_ChampionshipControlState) _then;

/// Create a copy of ChampionshipControlState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeTab = null,Object? pendingRequests = null,Object? approvedTeams = null,Object? matches = null,}) {
  return _then(_ChampionshipControlState(
activeTab: null == activeTab ? _self.activeTab : activeTab // ignore: cast_nullable_to_non_nullable
as int,pendingRequests: null == pendingRequests ? _self._pendingRequests : pendingRequests // ignore: cast_nullable_to_non_nullable
as List<PendingRequest>,approvedTeams: null == approvedTeams ? _self._approvedTeams : approvedTeams // ignore: cast_nullable_to_non_nullable
as List<ApprovedTeam>,matches: null == matches ? _self._matches : matches // ignore: cast_nullable_to_non_nullable
as List<Match>,
  ));
}


}

// dart format on
