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

 ManageTeamTab get selectedTab; MyTeamModel? get team; ManageTeamStatus get status;// Guards the accept/reject buttons while a response is in flight.
 bool get isResponding;
/// Create a copy of ManageTeamState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManageTeamStateCopyWith<ManageTeamState> get copyWith => _$ManageTeamStateCopyWithImpl<ManageTeamState>(this as ManageTeamState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageTeamState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.team, team) || other.team == team)&&(identical(other.status, status) || other.status == status)&&(identical(other.isResponding, isResponding) || other.isResponding == isResponding));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,team,status,isResponding);

@override
String toString() {
  return 'ManageTeamState(selectedTab: $selectedTab, team: $team, status: $status, isResponding: $isResponding)';
}


}

/// @nodoc
abstract mixin class $ManageTeamStateCopyWith<$Res>  {
  factory $ManageTeamStateCopyWith(ManageTeamState value, $Res Function(ManageTeamState) _then) = _$ManageTeamStateCopyWithImpl;
@useResult
$Res call({
 ManageTeamTab selectedTab, MyTeamModel? team, ManageTeamStatus status, bool isResponding
});


$ManageTeamStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$ManageTeamStateCopyWithImpl<$Res>
    implements $ManageTeamStateCopyWith<$Res> {
  _$ManageTeamStateCopyWithImpl(this._self, this._then);

  final ManageTeamState _self;
  final $Res Function(ManageTeamState) _then;

/// Create a copy of ManageTeamState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTab = null,Object? team = freezed,Object? status = null,Object? isResponding = null,}) {
  return _then(_self.copyWith(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as ManageTeamTab,team: freezed == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as MyTeamModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ManageTeamStatus,isResponding: null == isResponding ? _self.isResponding : isResponding // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ManageTeamState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManageTeamStatusCopyWith<$Res> get status {
  
  return $ManageTeamStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ManageTeamTab selectedTab,  MyTeamModel? team,  ManageTeamStatus status,  bool isResponding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManageTeamState() when $default != null:
return $default(_that.selectedTab,_that.team,_that.status,_that.isResponding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ManageTeamTab selectedTab,  MyTeamModel? team,  ManageTeamStatus status,  bool isResponding)  $default,) {final _that = this;
switch (_that) {
case _ManageTeamState():
return $default(_that.selectedTab,_that.team,_that.status,_that.isResponding);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ManageTeamTab selectedTab,  MyTeamModel? team,  ManageTeamStatus status,  bool isResponding)?  $default,) {final _that = this;
switch (_that) {
case _ManageTeamState() when $default != null:
return $default(_that.selectedTab,_that.team,_that.status,_that.isResponding);case _:
  return null;

}
}

}

/// @nodoc


class _ManageTeamState implements ManageTeamState {
  const _ManageTeamState({this.selectedTab = ManageTeamTab.roster, this.team, this.status = const ManageTeamStatus.initial(), this.isResponding = false});
  

@override@JsonKey() final  ManageTeamTab selectedTab;
@override final  MyTeamModel? team;
@override@JsonKey() final  ManageTeamStatus status;
// Guards the accept/reject buttons while a response is in flight.
@override@JsonKey() final  bool isResponding;

/// Create a copy of ManageTeamState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManageTeamStateCopyWith<_ManageTeamState> get copyWith => __$ManageTeamStateCopyWithImpl<_ManageTeamState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManageTeamState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.team, team) || other.team == team)&&(identical(other.status, status) || other.status == status)&&(identical(other.isResponding, isResponding) || other.isResponding == isResponding));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,team,status,isResponding);

@override
String toString() {
  return 'ManageTeamState(selectedTab: $selectedTab, team: $team, status: $status, isResponding: $isResponding)';
}


}

/// @nodoc
abstract mixin class _$ManageTeamStateCopyWith<$Res> implements $ManageTeamStateCopyWith<$Res> {
  factory _$ManageTeamStateCopyWith(_ManageTeamState value, $Res Function(_ManageTeamState) _then) = __$ManageTeamStateCopyWithImpl;
@override @useResult
$Res call({
 ManageTeamTab selectedTab, MyTeamModel? team, ManageTeamStatus status, bool isResponding
});


@override $ManageTeamStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$ManageTeamStateCopyWithImpl<$Res>
    implements _$ManageTeamStateCopyWith<$Res> {
  __$ManageTeamStateCopyWithImpl(this._self, this._then);

  final _ManageTeamState _self;
  final $Res Function(_ManageTeamState) _then;

/// Create a copy of ManageTeamState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,Object? team = freezed,Object? status = null,Object? isResponding = null,}) {
  return _then(_ManageTeamState(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as ManageTeamTab,team: freezed == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as MyTeamModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ManageTeamStatus,isResponding: null == isResponding ? _self.isResponding : isResponding // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ManageTeamState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManageTeamStatusCopyWith<$Res> get status {
  
  return $ManageTeamStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

/// @nodoc
mixin _$ManageTeamStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageTeamStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ManageTeamStatus()';
}


}

/// @nodoc
class $ManageTeamStatusCopyWith<$Res>  {
$ManageTeamStatusCopyWith(ManageTeamStatus _, $Res Function(ManageTeamStatus) __);
}


/// Adds pattern-matching-related methods to [ManageTeamStatus].
extension ManageTeamStatusPatterns on ManageTeamStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ManageTeamStatusInitial value)?  initial,TResult Function( ManageTeamStatusLoading value)?  loading,TResult Function( ManageTeamStatusSuccess value)?  success,TResult Function( ManageTeamStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ManageTeamStatusInitial() when initial != null:
return initial(_that);case ManageTeamStatusLoading() when loading != null:
return loading(_that);case ManageTeamStatusSuccess() when success != null:
return success(_that);case ManageTeamStatusError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ManageTeamStatusInitial value)  initial,required TResult Function( ManageTeamStatusLoading value)  loading,required TResult Function( ManageTeamStatusSuccess value)  success,required TResult Function( ManageTeamStatusError value)  error,}){
final _that = this;
switch (_that) {
case ManageTeamStatusInitial():
return initial(_that);case ManageTeamStatusLoading():
return loading(_that);case ManageTeamStatusSuccess():
return success(_that);case ManageTeamStatusError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ManageTeamStatusInitial value)?  initial,TResult? Function( ManageTeamStatusLoading value)?  loading,TResult? Function( ManageTeamStatusSuccess value)?  success,TResult? Function( ManageTeamStatusError value)?  error,}){
final _that = this;
switch (_that) {
case ManageTeamStatusInitial() when initial != null:
return initial(_that);case ManageTeamStatusLoading() when loading != null:
return loading(_that);case ManageTeamStatusSuccess() when success != null:
return success(_that);case ManageTeamStatusError() when error != null:
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
case ManageTeamStatusInitial() when initial != null:
return initial();case ManageTeamStatusLoading() when loading != null:
return loading();case ManageTeamStatusSuccess() when success != null:
return success();case ManageTeamStatusError() when error != null:
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
case ManageTeamStatusInitial():
return initial();case ManageTeamStatusLoading():
return loading();case ManageTeamStatusSuccess():
return success();case ManageTeamStatusError():
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
case ManageTeamStatusInitial() when initial != null:
return initial();case ManageTeamStatusLoading() when loading != null:
return loading();case ManageTeamStatusSuccess() when success != null:
return success();case ManageTeamStatusError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class ManageTeamStatusInitial implements ManageTeamStatus {
  const ManageTeamStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageTeamStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ManageTeamStatus.initial()';
}


}




/// @nodoc


class ManageTeamStatusLoading implements ManageTeamStatus {
  const ManageTeamStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageTeamStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ManageTeamStatus.loading()';
}


}




/// @nodoc


class ManageTeamStatusSuccess implements ManageTeamStatus {
  const ManageTeamStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageTeamStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ManageTeamStatus.success()';
}


}




/// @nodoc


class ManageTeamStatusError implements ManageTeamStatus {
  const ManageTeamStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageTeamStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ManageTeamStatus.error()';
}


}




// dart format on
