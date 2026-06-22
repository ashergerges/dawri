// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stadiums_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StadiumsState {

 int get selectedDateIndex; int get selectedSportIndex; List<DateOption> get dates; List<String> get sports; List<StadiumModel> get stadiums;
/// Create a copy of StadiumsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StadiumsStateCopyWith<StadiumsState> get copyWith => _$StadiumsStateCopyWithImpl<StadiumsState>(this as StadiumsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StadiumsState&&(identical(other.selectedDateIndex, selectedDateIndex) || other.selectedDateIndex == selectedDateIndex)&&(identical(other.selectedSportIndex, selectedSportIndex) || other.selectedSportIndex == selectedSportIndex)&&const DeepCollectionEquality().equals(other.dates, dates)&&const DeepCollectionEquality().equals(other.sports, sports)&&const DeepCollectionEquality().equals(other.stadiums, stadiums));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDateIndex,selectedSportIndex,const DeepCollectionEquality().hash(dates),const DeepCollectionEquality().hash(sports),const DeepCollectionEquality().hash(stadiums));

@override
String toString() {
  return 'StadiumsState(selectedDateIndex: $selectedDateIndex, selectedSportIndex: $selectedSportIndex, dates: $dates, sports: $sports, stadiums: $stadiums)';
}


}

/// @nodoc
abstract mixin class $StadiumsStateCopyWith<$Res>  {
  factory $StadiumsStateCopyWith(StadiumsState value, $Res Function(StadiumsState) _then) = _$StadiumsStateCopyWithImpl;
@useResult
$Res call({
 int selectedDateIndex, int selectedSportIndex, List<DateOption> dates, List<String> sports, List<StadiumModel> stadiums
});




}
/// @nodoc
class _$StadiumsStateCopyWithImpl<$Res>
    implements $StadiumsStateCopyWith<$Res> {
  _$StadiumsStateCopyWithImpl(this._self, this._then);

  final StadiumsState _self;
  final $Res Function(StadiumsState) _then;

/// Create a copy of StadiumsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedDateIndex = null,Object? selectedSportIndex = null,Object? dates = null,Object? sports = null,Object? stadiums = null,}) {
  return _then(_self.copyWith(
selectedDateIndex: null == selectedDateIndex ? _self.selectedDateIndex : selectedDateIndex // ignore: cast_nullable_to_non_nullable
as int,selectedSportIndex: null == selectedSportIndex ? _self.selectedSportIndex : selectedSportIndex // ignore: cast_nullable_to_non_nullable
as int,dates: null == dates ? _self.dates : dates // ignore: cast_nullable_to_non_nullable
as List<DateOption>,sports: null == sports ? _self.sports : sports // ignore: cast_nullable_to_non_nullable
as List<String>,stadiums: null == stadiums ? _self.stadiums : stadiums // ignore: cast_nullable_to_non_nullable
as List<StadiumModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [StadiumsState].
extension StadiumsStatePatterns on StadiumsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StadiumsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StadiumsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StadiumsState value)  $default,){
final _that = this;
switch (_that) {
case _StadiumsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StadiumsState value)?  $default,){
final _that = this;
switch (_that) {
case _StadiumsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int selectedDateIndex,  int selectedSportIndex,  List<DateOption> dates,  List<String> sports,  List<StadiumModel> stadiums)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StadiumsState() when $default != null:
return $default(_that.selectedDateIndex,_that.selectedSportIndex,_that.dates,_that.sports,_that.stadiums);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int selectedDateIndex,  int selectedSportIndex,  List<DateOption> dates,  List<String> sports,  List<StadiumModel> stadiums)  $default,) {final _that = this;
switch (_that) {
case _StadiumsState():
return $default(_that.selectedDateIndex,_that.selectedSportIndex,_that.dates,_that.sports,_that.stadiums);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int selectedDateIndex,  int selectedSportIndex,  List<DateOption> dates,  List<String> sports,  List<StadiumModel> stadiums)?  $default,) {final _that = this;
switch (_that) {
case _StadiumsState() when $default != null:
return $default(_that.selectedDateIndex,_that.selectedSportIndex,_that.dates,_that.sports,_that.stadiums);case _:
  return null;

}
}

}

/// @nodoc


class _StadiumsState implements StadiumsState {
  const _StadiumsState({this.selectedDateIndex = 1, this.selectedSportIndex = 0, final  List<DateOption> dates = const [], final  List<String> sports = StadiumsMockData.sportKeys, final  List<StadiumModel> stadiums = StadiumsMockData.stadiums}): _dates = dates,_sports = sports,_stadiums = stadiums;
  

@override@JsonKey() final  int selectedDateIndex;
@override@JsonKey() final  int selectedSportIndex;
 final  List<DateOption> _dates;
@override@JsonKey() List<DateOption> get dates {
  if (_dates is EqualUnmodifiableListView) return _dates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dates);
}

 final  List<String> _sports;
@override@JsonKey() List<String> get sports {
  if (_sports is EqualUnmodifiableListView) return _sports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sports);
}

 final  List<StadiumModel> _stadiums;
@override@JsonKey() List<StadiumModel> get stadiums {
  if (_stadiums is EqualUnmodifiableListView) return _stadiums;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stadiums);
}


/// Create a copy of StadiumsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StadiumsStateCopyWith<_StadiumsState> get copyWith => __$StadiumsStateCopyWithImpl<_StadiumsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StadiumsState&&(identical(other.selectedDateIndex, selectedDateIndex) || other.selectedDateIndex == selectedDateIndex)&&(identical(other.selectedSportIndex, selectedSportIndex) || other.selectedSportIndex == selectedSportIndex)&&const DeepCollectionEquality().equals(other._dates, _dates)&&const DeepCollectionEquality().equals(other._sports, _sports)&&const DeepCollectionEquality().equals(other._stadiums, _stadiums));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDateIndex,selectedSportIndex,const DeepCollectionEquality().hash(_dates),const DeepCollectionEquality().hash(_sports),const DeepCollectionEquality().hash(_stadiums));

@override
String toString() {
  return 'StadiumsState(selectedDateIndex: $selectedDateIndex, selectedSportIndex: $selectedSportIndex, dates: $dates, sports: $sports, stadiums: $stadiums)';
}


}

/// @nodoc
abstract mixin class _$StadiumsStateCopyWith<$Res> implements $StadiumsStateCopyWith<$Res> {
  factory _$StadiumsStateCopyWith(_StadiumsState value, $Res Function(_StadiumsState) _then) = __$StadiumsStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedDateIndex, int selectedSportIndex, List<DateOption> dates, List<String> sports, List<StadiumModel> stadiums
});




}
/// @nodoc
class __$StadiumsStateCopyWithImpl<$Res>
    implements _$StadiumsStateCopyWith<$Res> {
  __$StadiumsStateCopyWithImpl(this._self, this._then);

  final _StadiumsState _self;
  final $Res Function(_StadiumsState) _then;

/// Create a copy of StadiumsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedDateIndex = null,Object? selectedSportIndex = null,Object? dates = null,Object? sports = null,Object? stadiums = null,}) {
  return _then(_StadiumsState(
selectedDateIndex: null == selectedDateIndex ? _self.selectedDateIndex : selectedDateIndex // ignore: cast_nullable_to_non_nullable
as int,selectedSportIndex: null == selectedSportIndex ? _self.selectedSportIndex : selectedSportIndex // ignore: cast_nullable_to_non_nullable
as int,dates: null == dates ? _self._dates : dates // ignore: cast_nullable_to_non_nullable
as List<DateOption>,sports: null == sports ? _self._sports : sports // ignore: cast_nullable_to_non_nullable
as List<String>,stadiums: null == stadiums ? _self._stadiums : stadiums // ignore: cast_nullable_to_non_nullable
as List<StadiumModel>,
  ));
}


}

// dart format on
