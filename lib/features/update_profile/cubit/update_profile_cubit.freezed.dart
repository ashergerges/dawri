// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateProfileState {

 String get avatarPath; bool get isLocalAvatar; bool get reminderNotifications; bool get walletAlerts; bool get darkMode; bool get isPickingAvatar; String? get avatarError; bool get isUpdating; bool get isSuccess;
/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileStateCopyWith<UpdateProfileState> get copyWith => _$UpdateProfileStateCopyWithImpl<UpdateProfileState>(this as UpdateProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileState&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.isLocalAvatar, isLocalAvatar) || other.isLocalAvatar == isLocalAvatar)&&(identical(other.reminderNotifications, reminderNotifications) || other.reminderNotifications == reminderNotifications)&&(identical(other.walletAlerts, walletAlerts) || other.walletAlerts == walletAlerts)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.isPickingAvatar, isPickingAvatar) || other.isPickingAvatar == isPickingAvatar)&&(identical(other.avatarError, avatarError) || other.avatarError == avatarError)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,avatarPath,isLocalAvatar,reminderNotifications,walletAlerts,darkMode,isPickingAvatar,avatarError,isUpdating,isSuccess);

@override
String toString() {
  return 'UpdateProfileState(avatarPath: $avatarPath, isLocalAvatar: $isLocalAvatar, reminderNotifications: $reminderNotifications, walletAlerts: $walletAlerts, darkMode: $darkMode, isPickingAvatar: $isPickingAvatar, avatarError: $avatarError, isUpdating: $isUpdating, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileStateCopyWith<$Res>  {
  factory $UpdateProfileStateCopyWith(UpdateProfileState value, $Res Function(UpdateProfileState) _then) = _$UpdateProfileStateCopyWithImpl;
@useResult
$Res call({
 String avatarPath, bool isLocalAvatar, bool reminderNotifications, bool walletAlerts, bool darkMode, bool isPickingAvatar, String? avatarError, bool isUpdating, bool isSuccess
});




}
/// @nodoc
class _$UpdateProfileStateCopyWithImpl<$Res>
    implements $UpdateProfileStateCopyWith<$Res> {
  _$UpdateProfileStateCopyWithImpl(this._self, this._then);

  final UpdateProfileState _self;
  final $Res Function(UpdateProfileState) _then;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? avatarPath = null,Object? isLocalAvatar = null,Object? reminderNotifications = null,Object? walletAlerts = null,Object? darkMode = null,Object? isPickingAvatar = null,Object? avatarError = freezed,Object? isUpdating = null,Object? isSuccess = null,}) {
  return _then(_self.copyWith(
avatarPath: null == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String,isLocalAvatar: null == isLocalAvatar ? _self.isLocalAvatar : isLocalAvatar // ignore: cast_nullable_to_non_nullable
as bool,reminderNotifications: null == reminderNotifications ? _self.reminderNotifications : reminderNotifications // ignore: cast_nullable_to_non_nullable
as bool,walletAlerts: null == walletAlerts ? _self.walletAlerts : walletAlerts // ignore: cast_nullable_to_non_nullable
as bool,darkMode: null == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as bool,isPickingAvatar: null == isPickingAvatar ? _self.isPickingAvatar : isPickingAvatar // ignore: cast_nullable_to_non_nullable
as bool,avatarError: freezed == avatarError ? _self.avatarError : avatarError // ignore: cast_nullable_to_non_nullable
as String?,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateProfileState].
extension UpdateProfileStatePatterns on UpdateProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateProfileState value)  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String avatarPath,  bool isLocalAvatar,  bool reminderNotifications,  bool walletAlerts,  bool darkMode,  bool isPickingAvatar,  String? avatarError,  bool isUpdating,  bool isSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProfileState() when $default != null:
return $default(_that.avatarPath,_that.isLocalAvatar,_that.reminderNotifications,_that.walletAlerts,_that.darkMode,_that.isPickingAvatar,_that.avatarError,_that.isUpdating,_that.isSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String avatarPath,  bool isLocalAvatar,  bool reminderNotifications,  bool walletAlerts,  bool darkMode,  bool isPickingAvatar,  String? avatarError,  bool isUpdating,  bool isSuccess)  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileState():
return $default(_that.avatarPath,_that.isLocalAvatar,_that.reminderNotifications,_that.walletAlerts,_that.darkMode,_that.isPickingAvatar,_that.avatarError,_that.isUpdating,_that.isSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String avatarPath,  bool isLocalAvatar,  bool reminderNotifications,  bool walletAlerts,  bool darkMode,  bool isPickingAvatar,  String? avatarError,  bool isUpdating,  bool isSuccess)?  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileState() when $default != null:
return $default(_that.avatarPath,_that.isLocalAvatar,_that.reminderNotifications,_that.walletAlerts,_that.darkMode,_that.isPickingAvatar,_that.avatarError,_that.isUpdating,_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _UpdateProfileState implements UpdateProfileState {
  const _UpdateProfileState({this.avatarPath = UpdateProfileMockData.currentAvatarUrl, this.isLocalAvatar = false, this.reminderNotifications = true, this.walletAlerts = true, this.darkMode = false, this.isPickingAvatar = false, this.avatarError = null, this.isUpdating = false, this.isSuccess = false});
  

@override@JsonKey() final  String avatarPath;
@override@JsonKey() final  bool isLocalAvatar;
@override@JsonKey() final  bool reminderNotifications;
@override@JsonKey() final  bool walletAlerts;
@override@JsonKey() final  bool darkMode;
@override@JsonKey() final  bool isPickingAvatar;
@override@JsonKey() final  String? avatarError;
@override@JsonKey() final  bool isUpdating;
@override@JsonKey() final  bool isSuccess;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileStateCopyWith<_UpdateProfileState> get copyWith => __$UpdateProfileStateCopyWithImpl<_UpdateProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileState&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.isLocalAvatar, isLocalAvatar) || other.isLocalAvatar == isLocalAvatar)&&(identical(other.reminderNotifications, reminderNotifications) || other.reminderNotifications == reminderNotifications)&&(identical(other.walletAlerts, walletAlerts) || other.walletAlerts == walletAlerts)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.isPickingAvatar, isPickingAvatar) || other.isPickingAvatar == isPickingAvatar)&&(identical(other.avatarError, avatarError) || other.avatarError == avatarError)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,avatarPath,isLocalAvatar,reminderNotifications,walletAlerts,darkMode,isPickingAvatar,avatarError,isUpdating,isSuccess);

@override
String toString() {
  return 'UpdateProfileState(avatarPath: $avatarPath, isLocalAvatar: $isLocalAvatar, reminderNotifications: $reminderNotifications, walletAlerts: $walletAlerts, darkMode: $darkMode, isPickingAvatar: $isPickingAvatar, avatarError: $avatarError, isUpdating: $isUpdating, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileStateCopyWith<$Res> implements $UpdateProfileStateCopyWith<$Res> {
  factory _$UpdateProfileStateCopyWith(_UpdateProfileState value, $Res Function(_UpdateProfileState) _then) = __$UpdateProfileStateCopyWithImpl;
@override @useResult
$Res call({
 String avatarPath, bool isLocalAvatar, bool reminderNotifications, bool walletAlerts, bool darkMode, bool isPickingAvatar, String? avatarError, bool isUpdating, bool isSuccess
});




}
/// @nodoc
class __$UpdateProfileStateCopyWithImpl<$Res>
    implements _$UpdateProfileStateCopyWith<$Res> {
  __$UpdateProfileStateCopyWithImpl(this._self, this._then);

  final _UpdateProfileState _self;
  final $Res Function(_UpdateProfileState) _then;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? avatarPath = null,Object? isLocalAvatar = null,Object? reminderNotifications = null,Object? walletAlerts = null,Object? darkMode = null,Object? isPickingAvatar = null,Object? avatarError = freezed,Object? isUpdating = null,Object? isSuccess = null,}) {
  return _then(_UpdateProfileState(
avatarPath: null == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String,isLocalAvatar: null == isLocalAvatar ? _self.isLocalAvatar : isLocalAvatar // ignore: cast_nullable_to_non_nullable
as bool,reminderNotifications: null == reminderNotifications ? _self.reminderNotifications : reminderNotifications // ignore: cast_nullable_to_non_nullable
as bool,walletAlerts: null == walletAlerts ? _self.walletAlerts : walletAlerts // ignore: cast_nullable_to_non_nullable
as bool,darkMode: null == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as bool,isPickingAvatar: null == isPickingAvatar ? _self.isPickingAvatar : isPickingAvatar // ignore: cast_nullable_to_non_nullable
as bool,avatarError: freezed == avatarError ? _self.avatarError : avatarError // ignore: cast_nullable_to_non_nullable
as String?,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
