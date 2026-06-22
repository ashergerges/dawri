// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_championship_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateChampionshipState {

 String get name; SportType get selectedSport; TournamentSystem get selectedSystem; String get teams; String get fee; String get stadium; String get startDate; String get endDate; String get prizeFirst; String get prizeSecond; XFile? get logoFile; CreateChampionshipStateStatus get currState; bool get isSuccess; String? get errorMessage;
/// Create a copy of CreateChampionshipState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateChampionshipStateCopyWith<CreateChampionshipState> get copyWith => _$CreateChampionshipStateCopyWithImpl<CreateChampionshipState>(this as CreateChampionshipState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateChampionshipState&&(identical(other.name, name) || other.name == name)&&(identical(other.selectedSport, selectedSport) || other.selectedSport == selectedSport)&&(identical(other.selectedSystem, selectedSystem) || other.selectedSystem == selectedSystem)&&(identical(other.teams, teams) || other.teams == teams)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.stadium, stadium) || other.stadium == stadium)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.prizeFirst, prizeFirst) || other.prizeFirst == prizeFirst)&&(identical(other.prizeSecond, prizeSecond) || other.prizeSecond == prizeSecond)&&(identical(other.logoFile, logoFile) || other.logoFile == logoFile)&&(identical(other.currState, currState) || other.currState == currState)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,name,selectedSport,selectedSystem,teams,fee,stadium,startDate,endDate,prizeFirst,prizeSecond,logoFile,currState,isSuccess,errorMessage);

@override
String toString() {
  return 'CreateChampionshipState(name: $name, selectedSport: $selectedSport, selectedSystem: $selectedSystem, teams: $teams, fee: $fee, stadium: $stadium, startDate: $startDate, endDate: $endDate, prizeFirst: $prizeFirst, prizeSecond: $prizeSecond, logoFile: $logoFile, currState: $currState, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CreateChampionshipStateCopyWith<$Res>  {
  factory $CreateChampionshipStateCopyWith(CreateChampionshipState value, $Res Function(CreateChampionshipState) _then) = _$CreateChampionshipStateCopyWithImpl;
@useResult
$Res call({
 String name, SportType selectedSport, TournamentSystem selectedSystem, String teams, String fee, String stadium, String startDate, String endDate, String prizeFirst, String prizeSecond, XFile? logoFile, CreateChampionshipStateStatus currState, bool isSuccess, String? errorMessage
});


$CreateChampionshipStateStatusCopyWith<$Res> get currState;

}
/// @nodoc
class _$CreateChampionshipStateCopyWithImpl<$Res>
    implements $CreateChampionshipStateCopyWith<$Res> {
  _$CreateChampionshipStateCopyWithImpl(this._self, this._then);

  final CreateChampionshipState _self;
  final $Res Function(CreateChampionshipState) _then;

/// Create a copy of CreateChampionshipState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? selectedSport = null,Object? selectedSystem = null,Object? teams = null,Object? fee = null,Object? stadium = null,Object? startDate = null,Object? endDate = null,Object? prizeFirst = null,Object? prizeSecond = null,Object? logoFile = freezed,Object? currState = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,selectedSport: null == selectedSport ? _self.selectedSport : selectedSport // ignore: cast_nullable_to_non_nullable
as SportType,selectedSystem: null == selectedSystem ? _self.selectedSystem : selectedSystem // ignore: cast_nullable_to_non_nullable
as TournamentSystem,teams: null == teams ? _self.teams : teams // ignore: cast_nullable_to_non_nullable
as String,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as String,stadium: null == stadium ? _self.stadium : stadium // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,prizeFirst: null == prizeFirst ? _self.prizeFirst : prizeFirst // ignore: cast_nullable_to_non_nullable
as String,prizeSecond: null == prizeSecond ? _self.prizeSecond : prizeSecond // ignore: cast_nullable_to_non_nullable
as String,logoFile: freezed == logoFile ? _self.logoFile : logoFile // ignore: cast_nullable_to_non_nullable
as XFile?,currState: null == currState ? _self.currState : currState // ignore: cast_nullable_to_non_nullable
as CreateChampionshipStateStatus,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CreateChampionshipState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateChampionshipStateStatusCopyWith<$Res> get currState {
  
  return $CreateChampionshipStateStatusCopyWith<$Res>(_self.currState, (value) {
    return _then(_self.copyWith(currState: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateChampionshipState].
extension CreateChampionshipStatePatterns on CreateChampionshipState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateChampionshipState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateChampionshipState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateChampionshipState value)  $default,){
final _that = this;
switch (_that) {
case _CreateChampionshipState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateChampionshipState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateChampionshipState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  SportType selectedSport,  TournamentSystem selectedSystem,  String teams,  String fee,  String stadium,  String startDate,  String endDate,  String prizeFirst,  String prizeSecond,  XFile? logoFile,  CreateChampionshipStateStatus currState,  bool isSuccess,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateChampionshipState() when $default != null:
return $default(_that.name,_that.selectedSport,_that.selectedSystem,_that.teams,_that.fee,_that.stadium,_that.startDate,_that.endDate,_that.prizeFirst,_that.prizeSecond,_that.logoFile,_that.currState,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  SportType selectedSport,  TournamentSystem selectedSystem,  String teams,  String fee,  String stadium,  String startDate,  String endDate,  String prizeFirst,  String prizeSecond,  XFile? logoFile,  CreateChampionshipStateStatus currState,  bool isSuccess,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CreateChampionshipState():
return $default(_that.name,_that.selectedSport,_that.selectedSystem,_that.teams,_that.fee,_that.stadium,_that.startDate,_that.endDate,_that.prizeFirst,_that.prizeSecond,_that.logoFile,_that.currState,_that.isSuccess,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  SportType selectedSport,  TournamentSystem selectedSystem,  String teams,  String fee,  String stadium,  String startDate,  String endDate,  String prizeFirst,  String prizeSecond,  XFile? logoFile,  CreateChampionshipStateStatus currState,  bool isSuccess,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CreateChampionshipState() when $default != null:
return $default(_that.name,_that.selectedSport,_that.selectedSystem,_that.teams,_that.fee,_that.stadium,_that.startDate,_that.endDate,_that.prizeFirst,_that.prizeSecond,_that.logoFile,_that.currState,_that.isSuccess,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CreateChampionshipState implements CreateChampionshipState {
  const _CreateChampionshipState({this.name = '', this.selectedSport = SportType.football, this.selectedSystem = TournamentSystem.knockout, this.teams = '', this.fee = '', this.stadium = '', this.startDate = '', this.endDate = '', this.prizeFirst = '', this.prizeSecond = '', this.logoFile, this.currState = const CreateChampionshipStateStatus.initial(), this.isSuccess = false, this.errorMessage});
  

@override@JsonKey() final  String name;
@override@JsonKey() final  SportType selectedSport;
@override@JsonKey() final  TournamentSystem selectedSystem;
@override@JsonKey() final  String teams;
@override@JsonKey() final  String fee;
@override@JsonKey() final  String stadium;
@override@JsonKey() final  String startDate;
@override@JsonKey() final  String endDate;
@override@JsonKey() final  String prizeFirst;
@override@JsonKey() final  String prizeSecond;
@override final  XFile? logoFile;
@override@JsonKey() final  CreateChampionshipStateStatus currState;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;

/// Create a copy of CreateChampionshipState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateChampionshipStateCopyWith<_CreateChampionshipState> get copyWith => __$CreateChampionshipStateCopyWithImpl<_CreateChampionshipState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateChampionshipState&&(identical(other.name, name) || other.name == name)&&(identical(other.selectedSport, selectedSport) || other.selectedSport == selectedSport)&&(identical(other.selectedSystem, selectedSystem) || other.selectedSystem == selectedSystem)&&(identical(other.teams, teams) || other.teams == teams)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.stadium, stadium) || other.stadium == stadium)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.prizeFirst, prizeFirst) || other.prizeFirst == prizeFirst)&&(identical(other.prizeSecond, prizeSecond) || other.prizeSecond == prizeSecond)&&(identical(other.logoFile, logoFile) || other.logoFile == logoFile)&&(identical(other.currState, currState) || other.currState == currState)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,name,selectedSport,selectedSystem,teams,fee,stadium,startDate,endDate,prizeFirst,prizeSecond,logoFile,currState,isSuccess,errorMessage);

@override
String toString() {
  return 'CreateChampionshipState(name: $name, selectedSport: $selectedSport, selectedSystem: $selectedSystem, teams: $teams, fee: $fee, stadium: $stadium, startDate: $startDate, endDate: $endDate, prizeFirst: $prizeFirst, prizeSecond: $prizeSecond, logoFile: $logoFile, currState: $currState, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CreateChampionshipStateCopyWith<$Res> implements $CreateChampionshipStateCopyWith<$Res> {
  factory _$CreateChampionshipStateCopyWith(_CreateChampionshipState value, $Res Function(_CreateChampionshipState) _then) = __$CreateChampionshipStateCopyWithImpl;
@override @useResult
$Res call({
 String name, SportType selectedSport, TournamentSystem selectedSystem, String teams, String fee, String stadium, String startDate, String endDate, String prizeFirst, String prizeSecond, XFile? logoFile, CreateChampionshipStateStatus currState, bool isSuccess, String? errorMessage
});


@override $CreateChampionshipStateStatusCopyWith<$Res> get currState;

}
/// @nodoc
class __$CreateChampionshipStateCopyWithImpl<$Res>
    implements _$CreateChampionshipStateCopyWith<$Res> {
  __$CreateChampionshipStateCopyWithImpl(this._self, this._then);

  final _CreateChampionshipState _self;
  final $Res Function(_CreateChampionshipState) _then;

/// Create a copy of CreateChampionshipState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? selectedSport = null,Object? selectedSystem = null,Object? teams = null,Object? fee = null,Object? stadium = null,Object? startDate = null,Object? endDate = null,Object? prizeFirst = null,Object? prizeSecond = null,Object? logoFile = freezed,Object? currState = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_CreateChampionshipState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,selectedSport: null == selectedSport ? _self.selectedSport : selectedSport // ignore: cast_nullable_to_non_nullable
as SportType,selectedSystem: null == selectedSystem ? _self.selectedSystem : selectedSystem // ignore: cast_nullable_to_non_nullable
as TournamentSystem,teams: null == teams ? _self.teams : teams // ignore: cast_nullable_to_non_nullable
as String,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as String,stadium: null == stadium ? _self.stadium : stadium // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,prizeFirst: null == prizeFirst ? _self.prizeFirst : prizeFirst // ignore: cast_nullable_to_non_nullable
as String,prizeSecond: null == prizeSecond ? _self.prizeSecond : prizeSecond // ignore: cast_nullable_to_non_nullable
as String,logoFile: freezed == logoFile ? _self.logoFile : logoFile // ignore: cast_nullable_to_non_nullable
as XFile?,currState: null == currState ? _self.currState : currState // ignore: cast_nullable_to_non_nullable
as CreateChampionshipStateStatus,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CreateChampionshipState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateChampionshipStateStatusCopyWith<$Res> get currState {
  
  return $CreateChampionshipStateStatusCopyWith<$Res>(_self.currState, (value) {
    return _then(_self.copyWith(currState: value));
  });
}
}

/// @nodoc
mixin _$CreateChampionshipStateStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateChampionshipStateStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateChampionshipStateStatus()';
}


}

/// @nodoc
class $CreateChampionshipStateStatusCopyWith<$Res>  {
$CreateChampionshipStateStatusCopyWith(CreateChampionshipStateStatus _, $Res Function(CreateChampionshipStateStatus) __);
}


/// Adds pattern-matching-related methods to [CreateChampionshipStateStatus].
extension CreateChampionshipStateStatusPatterns on CreateChampionshipStateStatus {
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


class Initial implements CreateChampionshipStateStatus {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateChampionshipStateStatus.initial()';
}


}




/// @nodoc


class Loading implements CreateChampionshipStateStatus {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateChampionshipStateStatus.loading()';
}


}




/// @nodoc


class Error implements CreateChampionshipStateStatus {
  const Error();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateChampionshipStateStatus.error()';
}


}




/// @nodoc


class Success implements CreateChampionshipStateStatus {
  const Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateChampionshipStateStatus.success()';
}


}




// dart format on
