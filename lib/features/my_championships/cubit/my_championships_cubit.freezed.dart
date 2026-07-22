// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_championships_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyChampionshipsState {

 int get selectedTabIndex;
/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyChampionshipsStateCopyWith<MyChampionshipsState> get copyWith => _$MyChampionshipsStateCopyWithImpl<MyChampionshipsState>(this as MyChampionshipsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyChampionshipsState&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTabIndex);

@override
String toString() {
  return 'MyChampionshipsState(selectedTabIndex: $selectedTabIndex)';
}


}

/// @nodoc
abstract mixin class $MyChampionshipsStateCopyWith<$Res>  {
  factory $MyChampionshipsStateCopyWith(MyChampionshipsState value, $Res Function(MyChampionshipsState) _then) = _$MyChampionshipsStateCopyWithImpl;
@useResult
$Res call({
 int selectedTabIndex
});




}
/// @nodoc
class _$MyChampionshipsStateCopyWithImpl<$Res>
    implements $MyChampionshipsStateCopyWith<$Res> {
  _$MyChampionshipsStateCopyWithImpl(this._self, this._then);

  final MyChampionshipsState _self;
  final $Res Function(MyChampionshipsState) _then;

/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTabIndex = null,}) {
  return _then(_self.copyWith(
selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MyChampionshipsState].
extension MyChampionshipsStatePatterns on MyChampionshipsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyChampionshipsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyChampionshipsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyChampionshipsState value)  $default,){
final _that = this;
switch (_that) {
case _MyChampionshipsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyChampionshipsState value)?  $default,){
final _that = this;
switch (_that) {
case _MyChampionshipsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int selectedTabIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyChampionshipsState() when $default != null:
return $default(_that.selectedTabIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int selectedTabIndex)  $default,) {final _that = this;
switch (_that) {
case _MyChampionshipsState():
return $default(_that.selectedTabIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int selectedTabIndex)?  $default,) {final _that = this;
switch (_that) {
case _MyChampionshipsState() when $default != null:
return $default(_that.selectedTabIndex);case _:
  return null;

}
}

}

/// @nodoc


class _MyChampionshipsState implements MyChampionshipsState {
  const _MyChampionshipsState({this.selectedTabIndex = 0});
  

@override@JsonKey() final  int selectedTabIndex;

/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyChampionshipsStateCopyWith<_MyChampionshipsState> get copyWith => __$MyChampionshipsStateCopyWithImpl<_MyChampionshipsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyChampionshipsState&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTabIndex);

@override
String toString() {
  return 'MyChampionshipsState(selectedTabIndex: $selectedTabIndex)';
}


}

/// @nodoc
abstract mixin class _$MyChampionshipsStateCopyWith<$Res> implements $MyChampionshipsStateCopyWith<$Res> {
  factory _$MyChampionshipsStateCopyWith(_MyChampionshipsState value, $Res Function(_MyChampionshipsState) _then) = __$MyChampionshipsStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedTabIndex
});




}
/// @nodoc
class __$MyChampionshipsStateCopyWithImpl<$Res>
    implements _$MyChampionshipsStateCopyWith<$Res> {
  __$MyChampionshipsStateCopyWithImpl(this._self, this._then);

  final _MyChampionshipsState _self;
  final $Res Function(_MyChampionshipsState) _then;

/// Create a copy of MyChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTabIndex = null,}) {
  return _then(_MyChampionshipsState(
selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
