// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stadium_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StadiumProfileState {

 int get activeImageIndex; bool get isFavorite;
/// Create a copy of StadiumProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StadiumProfileStateCopyWith<StadiumProfileState> get copyWith => _$StadiumProfileStateCopyWithImpl<StadiumProfileState>(this as StadiumProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StadiumProfileState&&(identical(other.activeImageIndex, activeImageIndex) || other.activeImageIndex == activeImageIndex)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,activeImageIndex,isFavorite);

@override
String toString() {
  return 'StadiumProfileState(activeImageIndex: $activeImageIndex, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $StadiumProfileStateCopyWith<$Res>  {
  factory $StadiumProfileStateCopyWith(StadiumProfileState value, $Res Function(StadiumProfileState) _then) = _$StadiumProfileStateCopyWithImpl;
@useResult
$Res call({
 int activeImageIndex, bool isFavorite
});




}
/// @nodoc
class _$StadiumProfileStateCopyWithImpl<$Res>
    implements $StadiumProfileStateCopyWith<$Res> {
  _$StadiumProfileStateCopyWithImpl(this._self, this._then);

  final StadiumProfileState _self;
  final $Res Function(StadiumProfileState) _then;

/// Create a copy of StadiumProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeImageIndex = null,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
activeImageIndex: null == activeImageIndex ? _self.activeImageIndex : activeImageIndex // ignore: cast_nullable_to_non_nullable
as int,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StadiumProfileState].
extension StadiumProfileStatePatterns on StadiumProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StadiumProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StadiumProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StadiumProfileState value)  $default,){
final _that = this;
switch (_that) {
case _StadiumProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StadiumProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _StadiumProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int activeImageIndex,  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StadiumProfileState() when $default != null:
return $default(_that.activeImageIndex,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int activeImageIndex,  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _StadiumProfileState():
return $default(_that.activeImageIndex,_that.isFavorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int activeImageIndex,  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _StadiumProfileState() when $default != null:
return $default(_that.activeImageIndex,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc


class _StadiumProfileState implements StadiumProfileState {
  const _StadiumProfileState({this.activeImageIndex = 0, this.isFavorite = false});
  

@override@JsonKey() final  int activeImageIndex;
@override@JsonKey() final  bool isFavorite;

/// Create a copy of StadiumProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StadiumProfileStateCopyWith<_StadiumProfileState> get copyWith => __$StadiumProfileStateCopyWithImpl<_StadiumProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StadiumProfileState&&(identical(other.activeImageIndex, activeImageIndex) || other.activeImageIndex == activeImageIndex)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,activeImageIndex,isFavorite);

@override
String toString() {
  return 'StadiumProfileState(activeImageIndex: $activeImageIndex, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$StadiumProfileStateCopyWith<$Res> implements $StadiumProfileStateCopyWith<$Res> {
  factory _$StadiumProfileStateCopyWith(_StadiumProfileState value, $Res Function(_StadiumProfileState) _then) = __$StadiumProfileStateCopyWithImpl;
@override @useResult
$Res call({
 int activeImageIndex, bool isFavorite
});




}
/// @nodoc
class __$StadiumProfileStateCopyWithImpl<$Res>
    implements _$StadiumProfileStateCopyWith<$Res> {
  __$StadiumProfileStateCopyWithImpl(this._self, this._then);

  final _StadiumProfileState _self;
  final $Res Function(_StadiumProfileState) _then;

/// Create a copy of StadiumProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeImageIndex = null,Object? isFavorite = null,}) {
  return _then(_StadiumProfileState(
activeImageIndex: null == activeImageIndex ? _self.activeImageIndex : activeImageIndex // ignore: cast_nullable_to_non_nullable
as int,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
