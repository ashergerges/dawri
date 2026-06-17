// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_bar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TabBarState {

 int get activeScreen;
/// Create a copy of TabBarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabBarStateCopyWith<TabBarState> get copyWith => _$TabBarStateCopyWithImpl<TabBarState>(this as TabBarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabBarState&&(identical(other.activeScreen, activeScreen) || other.activeScreen == activeScreen));
}


@override
int get hashCode => Object.hash(runtimeType,activeScreen);

@override
String toString() {
  return 'TabBarState(activeScreen: $activeScreen)';
}


}

/// @nodoc
abstract mixin class $TabBarStateCopyWith<$Res>  {
  factory $TabBarStateCopyWith(TabBarState value, $Res Function(TabBarState) _then) = _$TabBarStateCopyWithImpl;
@useResult
$Res call({
 int activeScreen
});




}
/// @nodoc
class _$TabBarStateCopyWithImpl<$Res>
    implements $TabBarStateCopyWith<$Res> {
  _$TabBarStateCopyWithImpl(this._self, this._then);

  final TabBarState _self;
  final $Res Function(TabBarState) _then;

/// Create a copy of TabBarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeScreen = null,}) {
  return _then(_self.copyWith(
activeScreen: null == activeScreen ? _self.activeScreen : activeScreen // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TabBarState].
extension TabBarStatePatterns on TabBarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TabBarIndex value)?  tabBarIndex,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TabBarIndex() when tabBarIndex != null:
return tabBarIndex(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TabBarIndex value)  tabBarIndex,}){
final _that = this;
switch (_that) {
case TabBarIndex():
return tabBarIndex(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TabBarIndex value)?  tabBarIndex,}){
final _that = this;
switch (_that) {
case TabBarIndex() when tabBarIndex != null:
return tabBarIndex(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int activeScreen)?  tabBarIndex,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TabBarIndex() when tabBarIndex != null:
return tabBarIndex(_that.activeScreen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int activeScreen)  tabBarIndex,}) {final _that = this;
switch (_that) {
case TabBarIndex():
return tabBarIndex(_that.activeScreen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int activeScreen)?  tabBarIndex,}) {final _that = this;
switch (_that) {
case TabBarIndex() when tabBarIndex != null:
return tabBarIndex(_that.activeScreen);case _:
  return null;

}
}

}

/// @nodoc


class TabBarIndex implements TabBarState {
  const TabBarIndex({this.activeScreen = 0});
  

@override@JsonKey() final  int activeScreen;

/// Create a copy of TabBarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabBarIndexCopyWith<TabBarIndex> get copyWith => _$TabBarIndexCopyWithImpl<TabBarIndex>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabBarIndex&&(identical(other.activeScreen, activeScreen) || other.activeScreen == activeScreen));
}


@override
int get hashCode => Object.hash(runtimeType,activeScreen);

@override
String toString() {
  return 'TabBarState.tabBarIndex(activeScreen: $activeScreen)';
}


}

/// @nodoc
abstract mixin class $TabBarIndexCopyWith<$Res> implements $TabBarStateCopyWith<$Res> {
  factory $TabBarIndexCopyWith(TabBarIndex value, $Res Function(TabBarIndex) _then) = _$TabBarIndexCopyWithImpl;
@override @useResult
$Res call({
 int activeScreen
});




}
/// @nodoc
class _$TabBarIndexCopyWithImpl<$Res>
    implements $TabBarIndexCopyWith<$Res> {
  _$TabBarIndexCopyWithImpl(this._self, this._then);

  final TabBarIndex _self;
  final $Res Function(TabBarIndex) _then;

/// Create a copy of TabBarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeScreen = null,}) {
  return _then(TabBarIndex(
activeScreen: null == activeScreen ? _self.activeScreen : activeScreen // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
