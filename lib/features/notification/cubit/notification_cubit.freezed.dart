// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationState {

 NotificationStateStatus get currState; List<NotificationGroupModel> get notificationGroup; RefreshController get refreshController;
/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationStateCopyWith<NotificationState> get copyWith => _$NotificationStateCopyWithImpl<NotificationState>(this as NotificationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationState&&(identical(other.currState, currState) || other.currState == currState)&&const DeepCollectionEquality().equals(other.notificationGroup, notificationGroup)&&(identical(other.refreshController, refreshController) || other.refreshController == refreshController));
}


@override
int get hashCode => Object.hash(runtimeType,currState,const DeepCollectionEquality().hash(notificationGroup),refreshController);

@override
String toString() {
  return 'NotificationState(currState: $currState, notificationGroup: $notificationGroup, refreshController: $refreshController)';
}


}

/// @nodoc
abstract mixin class $NotificationStateCopyWith<$Res>  {
  factory $NotificationStateCopyWith(NotificationState value, $Res Function(NotificationState) _then) = _$NotificationStateCopyWithImpl;
@useResult
$Res call({
 NotificationStateStatus currState, List<NotificationGroupModel> notificationGroup, RefreshController refreshController
});


$NotificationStateStatusCopyWith<$Res> get currState;

}
/// @nodoc
class _$NotificationStateCopyWithImpl<$Res>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._self, this._then);

  final NotificationState _self;
  final $Res Function(NotificationState) _then;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currState = null,Object? notificationGroup = null,Object? refreshController = null,}) {
  return _then(_self.copyWith(
currState: null == currState ? _self.currState : currState // ignore: cast_nullable_to_non_nullable
as NotificationStateStatus,notificationGroup: null == notificationGroup ? _self.notificationGroup : notificationGroup // ignore: cast_nullable_to_non_nullable
as List<NotificationGroupModel>,refreshController: null == refreshController ? _self.refreshController : refreshController // ignore: cast_nullable_to_non_nullable
as RefreshController,
  ));
}
/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationStateStatusCopyWith<$Res> get currState {
  
  return $NotificationStateStatusCopyWith<$Res>(_self.currState, (value) {
    return _then(_self.copyWith(currState: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationState].
extension NotificationStatePatterns on NotificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationState value)  $default,){
final _that = this;
switch (_that) {
case _NotificationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationState value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NotificationStateStatus currState,  List<NotificationGroupModel> notificationGroup,  RefreshController refreshController)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationState() when $default != null:
return $default(_that.currState,_that.notificationGroup,_that.refreshController);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NotificationStateStatus currState,  List<NotificationGroupModel> notificationGroup,  RefreshController refreshController)  $default,) {final _that = this;
switch (_that) {
case _NotificationState():
return $default(_that.currState,_that.notificationGroup,_that.refreshController);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NotificationStateStatus currState,  List<NotificationGroupModel> notificationGroup,  RefreshController refreshController)?  $default,) {final _that = this;
switch (_that) {
case _NotificationState() when $default != null:
return $default(_that.currState,_that.notificationGroup,_that.refreshController);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationState implements NotificationState {
  const _NotificationState({this.currState = const NotificationStateStatus.initial(), final  List<NotificationGroupModel> notificationGroup = const [], required this.refreshController}): _notificationGroup = notificationGroup;
  

@override@JsonKey() final  NotificationStateStatus currState;
 final  List<NotificationGroupModel> _notificationGroup;
@override@JsonKey() List<NotificationGroupModel> get notificationGroup {
  if (_notificationGroup is EqualUnmodifiableListView) return _notificationGroup;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notificationGroup);
}

@override final  RefreshController refreshController;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationStateCopyWith<_NotificationState> get copyWith => __$NotificationStateCopyWithImpl<_NotificationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationState&&(identical(other.currState, currState) || other.currState == currState)&&const DeepCollectionEquality().equals(other._notificationGroup, _notificationGroup)&&(identical(other.refreshController, refreshController) || other.refreshController == refreshController));
}


@override
int get hashCode => Object.hash(runtimeType,currState,const DeepCollectionEquality().hash(_notificationGroup),refreshController);

@override
String toString() {
  return 'NotificationState(currState: $currState, notificationGroup: $notificationGroup, refreshController: $refreshController)';
}


}

/// @nodoc
abstract mixin class _$NotificationStateCopyWith<$Res> implements $NotificationStateCopyWith<$Res> {
  factory _$NotificationStateCopyWith(_NotificationState value, $Res Function(_NotificationState) _then) = __$NotificationStateCopyWithImpl;
@override @useResult
$Res call({
 NotificationStateStatus currState, List<NotificationGroupModel> notificationGroup, RefreshController refreshController
});


@override $NotificationStateStatusCopyWith<$Res> get currState;

}
/// @nodoc
class __$NotificationStateCopyWithImpl<$Res>
    implements _$NotificationStateCopyWith<$Res> {
  __$NotificationStateCopyWithImpl(this._self, this._then);

  final _NotificationState _self;
  final $Res Function(_NotificationState) _then;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currState = null,Object? notificationGroup = null,Object? refreshController = null,}) {
  return _then(_NotificationState(
currState: null == currState ? _self.currState : currState // ignore: cast_nullable_to_non_nullable
as NotificationStateStatus,notificationGroup: null == notificationGroup ? _self._notificationGroup : notificationGroup // ignore: cast_nullable_to_non_nullable
as List<NotificationGroupModel>,refreshController: null == refreshController ? _self.refreshController : refreshController // ignore: cast_nullable_to_non_nullable
as RefreshController,
  ));
}

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationStateStatusCopyWith<$Res> get currState {
  
  return $NotificationStateStatusCopyWith<$Res>(_self.currState, (value) {
    return _then(_self.copyWith(currState: value));
  });
}
}

/// @nodoc
mixin _$NotificationStateStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationStateStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationStateStatus()';
}


}

/// @nodoc
class $NotificationStateStatusCopyWith<$Res>  {
$NotificationStateStatusCopyWith(NotificationStateStatus _, $Res Function(NotificationStateStatus) __);
}


/// Adds pattern-matching-related methods to [NotificationStateStatus].
extension NotificationStateStatusPatterns on NotificationStateStatus {
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


class Initial implements NotificationStateStatus {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationStateStatus.initial()';
}


}




/// @nodoc


class Loading implements NotificationStateStatus {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationStateStatus.loading()';
}


}




/// @nodoc


class Error implements NotificationStateStatus {
  const Error();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationStateStatus.error()';
}


}




/// @nodoc


class Success implements NotificationStateStatus {
  const Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationStateStatus.success()';
}


}




// dart format on
