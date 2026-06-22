// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'championships_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChampionshipsState {

 int get activeTab;
/// Create a copy of ChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChampionshipsStateCopyWith<ChampionshipsState> get copyWith => _$ChampionshipsStateCopyWithImpl<ChampionshipsState>(this as ChampionshipsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampionshipsState&&(identical(other.activeTab, activeTab) || other.activeTab == activeTab));
}


@override
int get hashCode => Object.hash(runtimeType,activeTab);

@override
String toString() {
  return 'ChampionshipsState(activeTab: $activeTab)';
}


}

/// @nodoc
abstract mixin class $ChampionshipsStateCopyWith<$Res>  {
  factory $ChampionshipsStateCopyWith(ChampionshipsState value, $Res Function(ChampionshipsState) _then) = _$ChampionshipsStateCopyWithImpl;
@useResult
$Res call({
 int activeTab
});




}
/// @nodoc
class _$ChampionshipsStateCopyWithImpl<$Res>
    implements $ChampionshipsStateCopyWith<$Res> {
  _$ChampionshipsStateCopyWithImpl(this._self, this._then);

  final ChampionshipsState _self;
  final $Res Function(ChampionshipsState) _then;

/// Create a copy of ChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeTab = null,}) {
  return _then(_self.copyWith(
activeTab: null == activeTab ? _self.activeTab : activeTab // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChampionshipsState].
extension ChampionshipsStatePatterns on ChampionshipsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChampionshipsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChampionshipsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChampionshipsState value)  $default,){
final _that = this;
switch (_that) {
case _ChampionshipsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChampionshipsState value)?  $default,){
final _that = this;
switch (_that) {
case _ChampionshipsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int activeTab)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChampionshipsState() when $default != null:
return $default(_that.activeTab);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int activeTab)  $default,) {final _that = this;
switch (_that) {
case _ChampionshipsState():
return $default(_that.activeTab);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int activeTab)?  $default,) {final _that = this;
switch (_that) {
case _ChampionshipsState() when $default != null:
return $default(_that.activeTab);case _:
  return null;

}
}

}

/// @nodoc


class _ChampionshipsState implements ChampionshipsState {
  const _ChampionshipsState({this.activeTab = 0});
  

@override@JsonKey() final  int activeTab;

/// Create a copy of ChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChampionshipsStateCopyWith<_ChampionshipsState> get copyWith => __$ChampionshipsStateCopyWithImpl<_ChampionshipsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChampionshipsState&&(identical(other.activeTab, activeTab) || other.activeTab == activeTab));
}


@override
int get hashCode => Object.hash(runtimeType,activeTab);

@override
String toString() {
  return 'ChampionshipsState(activeTab: $activeTab)';
}


}

/// @nodoc
abstract mixin class _$ChampionshipsStateCopyWith<$Res> implements $ChampionshipsStateCopyWith<$Res> {
  factory _$ChampionshipsStateCopyWith(_ChampionshipsState value, $Res Function(_ChampionshipsState) _then) = __$ChampionshipsStateCopyWithImpl;
@override @useResult
$Res call({
 int activeTab
});




}
/// @nodoc
class __$ChampionshipsStateCopyWithImpl<$Res>
    implements _$ChampionshipsStateCopyWith<$Res> {
  __$ChampionshipsStateCopyWithImpl(this._self, this._then);

  final _ChampionshipsState _self;
  final $Res Function(_ChampionshipsState) _then;

/// Create a copy of ChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeTab = null,}) {
  return _then(_ChampionshipsState(
activeTab: null == activeTab ? _self.activeTab : activeTab // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
