// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TeamProfileState {

 TeamProfileModel? get team; TeamProfileStatus get status;// ─── Join request ────────────────────────────────────────
 bool get isJoining;/// True once the join request went through in this session — lets the
/// button say "request sent" instead of "already a member".
 bool get requestSent;/// The signed-in user already belongs to another team.
 bool get haveOtherTeam;
/// Create a copy of TeamProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamProfileStateCopyWith<TeamProfileState> get copyWith => _$TeamProfileStateCopyWithImpl<TeamProfileState>(this as TeamProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamProfileState&&(identical(other.team, team) || other.team == team)&&(identical(other.status, status) || other.status == status)&&(identical(other.isJoining, isJoining) || other.isJoining == isJoining)&&(identical(other.requestSent, requestSent) || other.requestSent == requestSent)&&(identical(other.haveOtherTeam, haveOtherTeam) || other.haveOtherTeam == haveOtherTeam));
}


@override
int get hashCode => Object.hash(runtimeType,team,status,isJoining,requestSent,haveOtherTeam);

@override
String toString() {
  return 'TeamProfileState(team: $team, status: $status, isJoining: $isJoining, requestSent: $requestSent, haveOtherTeam: $haveOtherTeam)';
}


}

/// @nodoc
abstract mixin class $TeamProfileStateCopyWith<$Res>  {
  factory $TeamProfileStateCopyWith(TeamProfileState value, $Res Function(TeamProfileState) _then) = _$TeamProfileStateCopyWithImpl;
@useResult
$Res call({
 TeamProfileModel? team, TeamProfileStatus status, bool isJoining, bool requestSent, bool haveOtherTeam
});


$TeamProfileStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$TeamProfileStateCopyWithImpl<$Res>
    implements $TeamProfileStateCopyWith<$Res> {
  _$TeamProfileStateCopyWithImpl(this._self, this._then);

  final TeamProfileState _self;
  final $Res Function(TeamProfileState) _then;

/// Create a copy of TeamProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? team = freezed,Object? status = null,Object? isJoining = null,Object? requestSent = null,Object? haveOtherTeam = null,}) {
  return _then(_self.copyWith(
team: freezed == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as TeamProfileModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TeamProfileStatus,isJoining: null == isJoining ? _self.isJoining : isJoining // ignore: cast_nullable_to_non_nullable
as bool,requestSent: null == requestSent ? _self.requestSent : requestSent // ignore: cast_nullable_to_non_nullable
as bool,haveOtherTeam: null == haveOtherTeam ? _self.haveOtherTeam : haveOtherTeam // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TeamProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamProfileStatusCopyWith<$Res> get status {
  
  return $TeamProfileStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [TeamProfileState].
extension TeamProfileStatePatterns on TeamProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamProfileState value)  $default,){
final _that = this;
switch (_that) {
case _TeamProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _TeamProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TeamProfileModel? team,  TeamProfileStatus status,  bool isJoining,  bool requestSent,  bool haveOtherTeam)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamProfileState() when $default != null:
return $default(_that.team,_that.status,_that.isJoining,_that.requestSent,_that.haveOtherTeam);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TeamProfileModel? team,  TeamProfileStatus status,  bool isJoining,  bool requestSent,  bool haveOtherTeam)  $default,) {final _that = this;
switch (_that) {
case _TeamProfileState():
return $default(_that.team,_that.status,_that.isJoining,_that.requestSent,_that.haveOtherTeam);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TeamProfileModel? team,  TeamProfileStatus status,  bool isJoining,  bool requestSent,  bool haveOtherTeam)?  $default,) {final _that = this;
switch (_that) {
case _TeamProfileState() when $default != null:
return $default(_that.team,_that.status,_that.isJoining,_that.requestSent,_that.haveOtherTeam);case _:
  return null;

}
}

}

/// @nodoc


class _TeamProfileState extends TeamProfileState {
  const _TeamProfileState({this.team, this.status = const TeamProfileStatus.initial(), this.isJoining = false, this.requestSent = false, this.haveOtherTeam = false}): super._();
  

@override final  TeamProfileModel? team;
@override@JsonKey() final  TeamProfileStatus status;
// ─── Join request ────────────────────────────────────────
@override@JsonKey() final  bool isJoining;
/// True once the join request went through in this session — lets the
/// button say "request sent" instead of "already a member".
@override@JsonKey() final  bool requestSent;
/// The signed-in user already belongs to another team.
@override@JsonKey() final  bool haveOtherTeam;

/// Create a copy of TeamProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamProfileStateCopyWith<_TeamProfileState> get copyWith => __$TeamProfileStateCopyWithImpl<_TeamProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamProfileState&&(identical(other.team, team) || other.team == team)&&(identical(other.status, status) || other.status == status)&&(identical(other.isJoining, isJoining) || other.isJoining == isJoining)&&(identical(other.requestSent, requestSent) || other.requestSent == requestSent)&&(identical(other.haveOtherTeam, haveOtherTeam) || other.haveOtherTeam == haveOtherTeam));
}


@override
int get hashCode => Object.hash(runtimeType,team,status,isJoining,requestSent,haveOtherTeam);

@override
String toString() {
  return 'TeamProfileState(team: $team, status: $status, isJoining: $isJoining, requestSent: $requestSent, haveOtherTeam: $haveOtherTeam)';
}


}

/// @nodoc
abstract mixin class _$TeamProfileStateCopyWith<$Res> implements $TeamProfileStateCopyWith<$Res> {
  factory _$TeamProfileStateCopyWith(_TeamProfileState value, $Res Function(_TeamProfileState) _then) = __$TeamProfileStateCopyWithImpl;
@override @useResult
$Res call({
 TeamProfileModel? team, TeamProfileStatus status, bool isJoining, bool requestSent, bool haveOtherTeam
});


@override $TeamProfileStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$TeamProfileStateCopyWithImpl<$Res>
    implements _$TeamProfileStateCopyWith<$Res> {
  __$TeamProfileStateCopyWithImpl(this._self, this._then);

  final _TeamProfileState _self;
  final $Res Function(_TeamProfileState) _then;

/// Create a copy of TeamProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? team = freezed,Object? status = null,Object? isJoining = null,Object? requestSent = null,Object? haveOtherTeam = null,}) {
  return _then(_TeamProfileState(
team: freezed == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as TeamProfileModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TeamProfileStatus,isJoining: null == isJoining ? _self.isJoining : isJoining // ignore: cast_nullable_to_non_nullable
as bool,requestSent: null == requestSent ? _self.requestSent : requestSent // ignore: cast_nullable_to_non_nullable
as bool,haveOtherTeam: null == haveOtherTeam ? _self.haveOtherTeam : haveOtherTeam // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TeamProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamProfileStatusCopyWith<$Res> get status {
  
  return $TeamProfileStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

/// @nodoc
mixin _$TeamProfileStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamProfileStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamProfileStatus()';
}


}

/// @nodoc
class $TeamProfileStatusCopyWith<$Res>  {
$TeamProfileStatusCopyWith(TeamProfileStatus _, $Res Function(TeamProfileStatus) __);
}


/// Adds pattern-matching-related methods to [TeamProfileStatus].
extension TeamProfileStatusPatterns on TeamProfileStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TeamProfileStatusInitial value)?  initial,TResult Function( TeamProfileStatusLoading value)?  loading,TResult Function( TeamProfileStatusSuccess value)?  success,TResult Function( TeamProfileStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TeamProfileStatusInitial() when initial != null:
return initial(_that);case TeamProfileStatusLoading() when loading != null:
return loading(_that);case TeamProfileStatusSuccess() when success != null:
return success(_that);case TeamProfileStatusError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TeamProfileStatusInitial value)  initial,required TResult Function( TeamProfileStatusLoading value)  loading,required TResult Function( TeamProfileStatusSuccess value)  success,required TResult Function( TeamProfileStatusError value)  error,}){
final _that = this;
switch (_that) {
case TeamProfileStatusInitial():
return initial(_that);case TeamProfileStatusLoading():
return loading(_that);case TeamProfileStatusSuccess():
return success(_that);case TeamProfileStatusError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TeamProfileStatusInitial value)?  initial,TResult? Function( TeamProfileStatusLoading value)?  loading,TResult? Function( TeamProfileStatusSuccess value)?  success,TResult? Function( TeamProfileStatusError value)?  error,}){
final _that = this;
switch (_that) {
case TeamProfileStatusInitial() when initial != null:
return initial(_that);case TeamProfileStatusLoading() when loading != null:
return loading(_that);case TeamProfileStatusSuccess() when success != null:
return success(_that);case TeamProfileStatusError() when error != null:
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
case TeamProfileStatusInitial() when initial != null:
return initial();case TeamProfileStatusLoading() when loading != null:
return loading();case TeamProfileStatusSuccess() when success != null:
return success();case TeamProfileStatusError() when error != null:
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
case TeamProfileStatusInitial():
return initial();case TeamProfileStatusLoading():
return loading();case TeamProfileStatusSuccess():
return success();case TeamProfileStatusError():
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
case TeamProfileStatusInitial() when initial != null:
return initial();case TeamProfileStatusLoading() when loading != null:
return loading();case TeamProfileStatusSuccess() when success != null:
return success();case TeamProfileStatusError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class TeamProfileStatusInitial implements TeamProfileStatus {
  const TeamProfileStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamProfileStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamProfileStatus.initial()';
}


}




/// @nodoc


class TeamProfileStatusLoading implements TeamProfileStatus {
  const TeamProfileStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamProfileStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamProfileStatus.loading()';
}


}




/// @nodoc


class TeamProfileStatusSuccess implements TeamProfileStatus {
  const TeamProfileStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamProfileStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamProfileStatus.success()';
}


}




/// @nodoc


class TeamProfileStatusError implements TeamProfileStatus {
  const TeamProfileStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamProfileStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TeamProfileStatus.error()';
}


}




// dart format on
