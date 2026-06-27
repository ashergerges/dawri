// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_team_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ManageTeamState {

 ManageTeamTab get selectedTab; List<PlayerCardData> get roster; List<PendingRequestData> get pendingRequests;
/// Create a copy of ManageTeamState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManageTeamStateCopyWith<ManageTeamState> get copyWith => _$ManageTeamStateCopyWithImpl<ManageTeamState>(this as ManageTeamState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageTeamState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&const DeepCollectionEquality().equals(other.roster, roster)&&const DeepCollectionEquality().equals(other.pendingRequests, pendingRequests));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,const DeepCollectionEquality().hash(roster),const DeepCollectionEquality().hash(pendingRequests));

@override
String toString() {
  return 'ManageTeamState(selectedTab: $selectedTab, roster: $roster, pendingRequests: $pendingRequests)';
}


}

/// @nodoc
abstract mixin class $ManageTeamStateCopyWith<$Res>  {
  factory $ManageTeamStateCopyWith(ManageTeamState value, $Res Function(ManageTeamState) _then) = _$ManageTeamStateCopyWithImpl;
@useResult
$Res call({
 ManageTeamTab selectedTab, List<PlayerCardData> roster, List<PendingRequestData> pendingRequests
});




}
/// @nodoc
class _$ManageTeamStateCopyWithImpl<$Res>
    implements $ManageTeamStateCopyWith<$Res> {
  _$ManageTeamStateCopyWithImpl(this._self, this._then);

  final ManageTeamState _self;
  final $Res Function(ManageTeamState) _then;

/// Create a copy of ManageTeamState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTab = null,Object? roster = null,Object? pendingRequests = null,}) {
  return _then(_self.copyWith(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as ManageTeamTab,roster: null == roster ? _self.roster : roster // ignore: cast_nullable_to_non_nullable
as List<PlayerCardData>,pendingRequests: null == pendingRequests ? _self.pendingRequests : pendingRequests // ignore: cast_nullable_to_non_nullable
as List<PendingRequestData>,
  ));
}

}


/// Adds pattern-matching-related methods to [ManageTeamState].
extension ManageTeamStatePatterns on ManageTeamState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManageTeamState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManageTeamState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManageTeamState value)  $default,){
final _that = this;
switch (_that) {
case _ManageTeamState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManageTeamState value)?  $default,){
final _that = this;
switch (_that) {
case _ManageTeamState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ManageTeamTab selectedTab,  List<PlayerCardData> roster,  List<PendingRequestData> pendingRequests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManageTeamState() when $default != null:
return $default(_that.selectedTab,_that.roster,_that.pendingRequests);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ManageTeamTab selectedTab,  List<PlayerCardData> roster,  List<PendingRequestData> pendingRequests)  $default,) {final _that = this;
switch (_that) {
case _ManageTeamState():
return $default(_that.selectedTab,_that.roster,_that.pendingRequests);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ManageTeamTab selectedTab,  List<PlayerCardData> roster,  List<PendingRequestData> pendingRequests)?  $default,) {final _that = this;
switch (_that) {
case _ManageTeamState() when $default != null:
return $default(_that.selectedTab,_that.roster,_that.pendingRequests);case _:
  return null;

}
}

}

/// @nodoc


class _ManageTeamState implements ManageTeamState {
  const _ManageTeamState({this.selectedTab = ManageTeamTab.roster, final  List<PlayerCardData> roster = const [], final  List<PendingRequestData> pendingRequests = const []}): _roster = roster,_pendingRequests = pendingRequests;
  

@override@JsonKey() final  ManageTeamTab selectedTab;
 final  List<PlayerCardData> _roster;
@override@JsonKey() List<PlayerCardData> get roster {
  if (_roster is EqualUnmodifiableListView) return _roster;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roster);
}

 final  List<PendingRequestData> _pendingRequests;
@override@JsonKey() List<PendingRequestData> get pendingRequests {
  if (_pendingRequests is EqualUnmodifiableListView) return _pendingRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pendingRequests);
}


/// Create a copy of ManageTeamState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManageTeamStateCopyWith<_ManageTeamState> get copyWith => __$ManageTeamStateCopyWithImpl<_ManageTeamState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManageTeamState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&const DeepCollectionEquality().equals(other._roster, _roster)&&const DeepCollectionEquality().equals(other._pendingRequests, _pendingRequests));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,const DeepCollectionEquality().hash(_roster),const DeepCollectionEquality().hash(_pendingRequests));

@override
String toString() {
  return 'ManageTeamState(selectedTab: $selectedTab, roster: $roster, pendingRequests: $pendingRequests)';
}


}

/// @nodoc
abstract mixin class _$ManageTeamStateCopyWith<$Res> implements $ManageTeamStateCopyWith<$Res> {
  factory _$ManageTeamStateCopyWith(_ManageTeamState value, $Res Function(_ManageTeamState) _then) = __$ManageTeamStateCopyWithImpl;
@override @useResult
$Res call({
 ManageTeamTab selectedTab, List<PlayerCardData> roster, List<PendingRequestData> pendingRequests
});




}
/// @nodoc
class __$ManageTeamStateCopyWithImpl<$Res>
    implements _$ManageTeamStateCopyWith<$Res> {
  __$ManageTeamStateCopyWithImpl(this._self, this._then);

  final _ManageTeamState _self;
  final $Res Function(_ManageTeamState) _then;

/// Create a copy of ManageTeamState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,Object? roster = null,Object? pendingRequests = null,}) {
  return _then(_ManageTeamState(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as ManageTeamTab,roster: null == roster ? _self._roster : roster // ignore: cast_nullable_to_non_nullable
as List<PlayerCardData>,pendingRequests: null == pendingRequests ? _self._pendingRequests : pendingRequests // ignore: cast_nullable_to_non_nullable
as List<PendingRequestData>,
  ));
}


}

// dart format on
