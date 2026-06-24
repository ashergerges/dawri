// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'championship_add_team_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChampionshipAddTeamState {

 Set<int> get selectedPlayerIndexes; bool get isLoading; bool get isSuccess;
/// Create a copy of ChampionshipAddTeamState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChampionshipAddTeamStateCopyWith<ChampionshipAddTeamState> get copyWith => _$ChampionshipAddTeamStateCopyWithImpl<ChampionshipAddTeamState>(this as ChampionshipAddTeamState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampionshipAddTeamState&&const DeepCollectionEquality().equals(other.selectedPlayerIndexes, selectedPlayerIndexes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(selectedPlayerIndexes),isLoading,isSuccess);

@override
String toString() {
  return 'ChampionshipAddTeamState(selectedPlayerIndexes: $selectedPlayerIndexes, isLoading: $isLoading, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class $ChampionshipAddTeamStateCopyWith<$Res>  {
  factory $ChampionshipAddTeamStateCopyWith(ChampionshipAddTeamState value, $Res Function(ChampionshipAddTeamState) _then) = _$ChampionshipAddTeamStateCopyWithImpl;
@useResult
$Res call({
 Set<int> selectedPlayerIndexes, bool isLoading, bool isSuccess
});




}
/// @nodoc
class _$ChampionshipAddTeamStateCopyWithImpl<$Res>
    implements $ChampionshipAddTeamStateCopyWith<$Res> {
  _$ChampionshipAddTeamStateCopyWithImpl(this._self, this._then);

  final ChampionshipAddTeamState _self;
  final $Res Function(ChampionshipAddTeamState) _then;

/// Create a copy of ChampionshipAddTeamState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedPlayerIndexes = null,Object? isLoading = null,Object? isSuccess = null,}) {
  return _then(_self.copyWith(
selectedPlayerIndexes: null == selectedPlayerIndexes ? _self.selectedPlayerIndexes : selectedPlayerIndexes // ignore: cast_nullable_to_non_nullable
as Set<int>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChampionshipAddTeamState].
extension ChampionshipAddTeamStatePatterns on ChampionshipAddTeamState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChampionshipAddTeamState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChampionshipAddTeamState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChampionshipAddTeamState value)  $default,){
final _that = this;
switch (_that) {
case _ChampionshipAddTeamState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChampionshipAddTeamState value)?  $default,){
final _that = this;
switch (_that) {
case _ChampionshipAddTeamState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<int> selectedPlayerIndexes,  bool isLoading,  bool isSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChampionshipAddTeamState() when $default != null:
return $default(_that.selectedPlayerIndexes,_that.isLoading,_that.isSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<int> selectedPlayerIndexes,  bool isLoading,  bool isSuccess)  $default,) {final _that = this;
switch (_that) {
case _ChampionshipAddTeamState():
return $default(_that.selectedPlayerIndexes,_that.isLoading,_that.isSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<int> selectedPlayerIndexes,  bool isLoading,  bool isSuccess)?  $default,) {final _that = this;
switch (_that) {
case _ChampionshipAddTeamState() when $default != null:
return $default(_that.selectedPlayerIndexes,_that.isLoading,_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _ChampionshipAddTeamState implements ChampionshipAddTeamState {
  const _ChampionshipAddTeamState({final  Set<int> selectedPlayerIndexes = const {0, 1}, this.isLoading = false, this.isSuccess = false}): _selectedPlayerIndexes = selectedPlayerIndexes;
  

 final  Set<int> _selectedPlayerIndexes;
@override@JsonKey() Set<int> get selectedPlayerIndexes {
  if (_selectedPlayerIndexes is EqualUnmodifiableSetView) return _selectedPlayerIndexes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedPlayerIndexes);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;

/// Create a copy of ChampionshipAddTeamState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChampionshipAddTeamStateCopyWith<_ChampionshipAddTeamState> get copyWith => __$ChampionshipAddTeamStateCopyWithImpl<_ChampionshipAddTeamState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChampionshipAddTeamState&&const DeepCollectionEquality().equals(other._selectedPlayerIndexes, _selectedPlayerIndexes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_selectedPlayerIndexes),isLoading,isSuccess);

@override
String toString() {
  return 'ChampionshipAddTeamState(selectedPlayerIndexes: $selectedPlayerIndexes, isLoading: $isLoading, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$ChampionshipAddTeamStateCopyWith<$Res> implements $ChampionshipAddTeamStateCopyWith<$Res> {
  factory _$ChampionshipAddTeamStateCopyWith(_ChampionshipAddTeamState value, $Res Function(_ChampionshipAddTeamState) _then) = __$ChampionshipAddTeamStateCopyWithImpl;
@override @useResult
$Res call({
 Set<int> selectedPlayerIndexes, bool isLoading, bool isSuccess
});




}
/// @nodoc
class __$ChampionshipAddTeamStateCopyWithImpl<$Res>
    implements _$ChampionshipAddTeamStateCopyWith<$Res> {
  __$ChampionshipAddTeamStateCopyWithImpl(this._self, this._then);

  final _ChampionshipAddTeamState _self;
  final $Res Function(_ChampionshipAddTeamState) _then;

/// Create a copy of ChampionshipAddTeamState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedPlayerIndexes = null,Object? isLoading = null,Object? isSuccess = null,}) {
  return _then(_ChampionshipAddTeamState(
selectedPlayerIndexes: null == selectedPlayerIndexes ? _self._selectedPlayerIndexes : selectedPlayerIndexes // ignore: cast_nullable_to_non_nullable
as Set<int>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
