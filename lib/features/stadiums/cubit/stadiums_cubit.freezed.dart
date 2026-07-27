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

 int get selectedDateIndex; int get selectedSportIndex; List<DateOption> get dates; List<SportModel> get sports; List<StadiumModel> get stadiums; StadiumsStatus get status;
/// Create a copy of StadiumsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StadiumsStateCopyWith<StadiumsState> get copyWith => _$StadiumsStateCopyWithImpl<StadiumsState>(this as StadiumsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StadiumsState&&(identical(other.selectedDateIndex, selectedDateIndex) || other.selectedDateIndex == selectedDateIndex)&&(identical(other.selectedSportIndex, selectedSportIndex) || other.selectedSportIndex == selectedSportIndex)&&const DeepCollectionEquality().equals(other.dates, dates)&&const DeepCollectionEquality().equals(other.sports, sports)&&const DeepCollectionEquality().equals(other.stadiums, stadiums)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDateIndex,selectedSportIndex,const DeepCollectionEquality().hash(dates),const DeepCollectionEquality().hash(sports),const DeepCollectionEquality().hash(stadiums),status);

@override
String toString() {
  return 'StadiumsState(selectedDateIndex: $selectedDateIndex, selectedSportIndex: $selectedSportIndex, dates: $dates, sports: $sports, stadiums: $stadiums, status: $status)';
}


}

/// @nodoc
abstract mixin class $StadiumsStateCopyWith<$Res>  {
  factory $StadiumsStateCopyWith(StadiumsState value, $Res Function(StadiumsState) _then) = _$StadiumsStateCopyWithImpl;
@useResult
$Res call({
 int selectedDateIndex, int selectedSportIndex, List<DateOption> dates, List<SportModel> sports, List<StadiumModel> stadiums, StadiumsStatus status
});


$StadiumsStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$StadiumsStateCopyWithImpl<$Res>
    implements $StadiumsStateCopyWith<$Res> {
  _$StadiumsStateCopyWithImpl(this._self, this._then);

  final StadiumsState _self;
  final $Res Function(StadiumsState) _then;

/// Create a copy of StadiumsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedDateIndex = null,Object? selectedSportIndex = null,Object? dates = null,Object? sports = null,Object? stadiums = null,Object? status = null,}) {
  return _then(_self.copyWith(
selectedDateIndex: null == selectedDateIndex ? _self.selectedDateIndex : selectedDateIndex // ignore: cast_nullable_to_non_nullable
as int,selectedSportIndex: null == selectedSportIndex ? _self.selectedSportIndex : selectedSportIndex // ignore: cast_nullable_to_non_nullable
as int,dates: null == dates ? _self.dates : dates // ignore: cast_nullable_to_non_nullable
as List<DateOption>,sports: null == sports ? _self.sports : sports // ignore: cast_nullable_to_non_nullable
as List<SportModel>,stadiums: null == stadiums ? _self.stadiums : stadiums // ignore: cast_nullable_to_non_nullable
as List<StadiumModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StadiumsStatus,
  ));
}
/// Create a copy of StadiumsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StadiumsStatusCopyWith<$Res> get status {
  
  return $StadiumsStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int selectedDateIndex,  int selectedSportIndex,  List<DateOption> dates,  List<SportModel> sports,  List<StadiumModel> stadiums,  StadiumsStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StadiumsState() when $default != null:
return $default(_that.selectedDateIndex,_that.selectedSportIndex,_that.dates,_that.sports,_that.stadiums,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int selectedDateIndex,  int selectedSportIndex,  List<DateOption> dates,  List<SportModel> sports,  List<StadiumModel> stadiums,  StadiumsStatus status)  $default,) {final _that = this;
switch (_that) {
case _StadiumsState():
return $default(_that.selectedDateIndex,_that.selectedSportIndex,_that.dates,_that.sports,_that.stadiums,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int selectedDateIndex,  int selectedSportIndex,  List<DateOption> dates,  List<SportModel> sports,  List<StadiumModel> stadiums,  StadiumsStatus status)?  $default,) {final _that = this;
switch (_that) {
case _StadiumsState() when $default != null:
return $default(_that.selectedDateIndex,_that.selectedSportIndex,_that.dates,_that.sports,_that.stadiums,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _StadiumsState implements StadiumsState {
  const _StadiumsState({this.selectedDateIndex = 0, this.selectedSportIndex = 0, final  List<DateOption> dates = const [], final  List<SportModel> sports = const [], final  List<StadiumModel> stadiums = const [], this.status = const StadiumsStatus.initial()}): _dates = dates,_sports = sports,_stadiums = stadiums;
  

@override@JsonKey() final  int selectedDateIndex;
@override@JsonKey() final  int selectedSportIndex;
 final  List<DateOption> _dates;
@override@JsonKey() List<DateOption> get dates {
  if (_dates is EqualUnmodifiableListView) return _dates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dates);
}

 final  List<SportModel> _sports;
@override@JsonKey() List<SportModel> get sports {
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

@override@JsonKey() final  StadiumsStatus status;

/// Create a copy of StadiumsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StadiumsStateCopyWith<_StadiumsState> get copyWith => __$StadiumsStateCopyWithImpl<_StadiumsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StadiumsState&&(identical(other.selectedDateIndex, selectedDateIndex) || other.selectedDateIndex == selectedDateIndex)&&(identical(other.selectedSportIndex, selectedSportIndex) || other.selectedSportIndex == selectedSportIndex)&&const DeepCollectionEquality().equals(other._dates, _dates)&&const DeepCollectionEquality().equals(other._sports, _sports)&&const DeepCollectionEquality().equals(other._stadiums, _stadiums)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDateIndex,selectedSportIndex,const DeepCollectionEquality().hash(_dates),const DeepCollectionEquality().hash(_sports),const DeepCollectionEquality().hash(_stadiums),status);

@override
String toString() {
  return 'StadiumsState(selectedDateIndex: $selectedDateIndex, selectedSportIndex: $selectedSportIndex, dates: $dates, sports: $sports, stadiums: $stadiums, status: $status)';
}


}

/// @nodoc
abstract mixin class _$StadiumsStateCopyWith<$Res> implements $StadiumsStateCopyWith<$Res> {
  factory _$StadiumsStateCopyWith(_StadiumsState value, $Res Function(_StadiumsState) _then) = __$StadiumsStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedDateIndex, int selectedSportIndex, List<DateOption> dates, List<SportModel> sports, List<StadiumModel> stadiums, StadiumsStatus status
});


@override $StadiumsStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$StadiumsStateCopyWithImpl<$Res>
    implements _$StadiumsStateCopyWith<$Res> {
  __$StadiumsStateCopyWithImpl(this._self, this._then);

  final _StadiumsState _self;
  final $Res Function(_StadiumsState) _then;

/// Create a copy of StadiumsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedDateIndex = null,Object? selectedSportIndex = null,Object? dates = null,Object? sports = null,Object? stadiums = null,Object? status = null,}) {
  return _then(_StadiumsState(
selectedDateIndex: null == selectedDateIndex ? _self.selectedDateIndex : selectedDateIndex // ignore: cast_nullable_to_non_nullable
as int,selectedSportIndex: null == selectedSportIndex ? _self.selectedSportIndex : selectedSportIndex // ignore: cast_nullable_to_non_nullable
as int,dates: null == dates ? _self._dates : dates // ignore: cast_nullable_to_non_nullable
as List<DateOption>,sports: null == sports ? _self._sports : sports // ignore: cast_nullable_to_non_nullable
as List<SportModel>,stadiums: null == stadiums ? _self._stadiums : stadiums // ignore: cast_nullable_to_non_nullable
as List<StadiumModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StadiumsStatus,
  ));
}

/// Create a copy of StadiumsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StadiumsStatusCopyWith<$Res> get status {
  
  return $StadiumsStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

/// @nodoc
mixin _$StadiumsStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StadiumsStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StadiumsStatus()';
}


}

/// @nodoc
class $StadiumsStatusCopyWith<$Res>  {
$StadiumsStatusCopyWith(StadiumsStatus _, $Res Function(StadiumsStatus) __);
}


/// Adds pattern-matching-related methods to [StadiumsStatus].
extension StadiumsStatusPatterns on StadiumsStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StadiumsStatusInitial value)?  initial,TResult Function( StadiumsStatusLoading value)?  loading,TResult Function( StadiumsStatusSuccess value)?  success,TResult Function( StadiumsStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StadiumsStatusInitial() when initial != null:
return initial(_that);case StadiumsStatusLoading() when loading != null:
return loading(_that);case StadiumsStatusSuccess() when success != null:
return success(_that);case StadiumsStatusError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StadiumsStatusInitial value)  initial,required TResult Function( StadiumsStatusLoading value)  loading,required TResult Function( StadiumsStatusSuccess value)  success,required TResult Function( StadiumsStatusError value)  error,}){
final _that = this;
switch (_that) {
case StadiumsStatusInitial():
return initial(_that);case StadiumsStatusLoading():
return loading(_that);case StadiumsStatusSuccess():
return success(_that);case StadiumsStatusError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StadiumsStatusInitial value)?  initial,TResult? Function( StadiumsStatusLoading value)?  loading,TResult? Function( StadiumsStatusSuccess value)?  success,TResult? Function( StadiumsStatusError value)?  error,}){
final _that = this;
switch (_that) {
case StadiumsStatusInitial() when initial != null:
return initial(_that);case StadiumsStatusLoading() when loading != null:
return loading(_that);case StadiumsStatusSuccess() when success != null:
return success(_that);case StadiumsStatusError() when error != null:
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
case StadiumsStatusInitial() when initial != null:
return initial();case StadiumsStatusLoading() when loading != null:
return loading();case StadiumsStatusSuccess() when success != null:
return success();case StadiumsStatusError() when error != null:
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
case StadiumsStatusInitial():
return initial();case StadiumsStatusLoading():
return loading();case StadiumsStatusSuccess():
return success();case StadiumsStatusError():
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
case StadiumsStatusInitial() when initial != null:
return initial();case StadiumsStatusLoading() when loading != null:
return loading();case StadiumsStatusSuccess() when success != null:
return success();case StadiumsStatusError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class StadiumsStatusInitial implements StadiumsStatus {
  const StadiumsStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StadiumsStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StadiumsStatus.initial()';
}


}




/// @nodoc


class StadiumsStatusLoading implements StadiumsStatus {
  const StadiumsStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StadiumsStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StadiumsStatus.loading()';
}


}




/// @nodoc


class StadiumsStatusSuccess implements StadiumsStatus {
  const StadiumsStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StadiumsStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StadiumsStatus.success()';
}


}




/// @nodoc


class StadiumsStatusError implements StadiumsStatus {
  const StadiumsStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StadiumsStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StadiumsStatus.error()';
}


}




// dart format on
