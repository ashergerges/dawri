// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tickets_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TicketsState {

 int get selectedTabIndex; bool get showSuccessModal; UpcomingMatchModel? get lastBookedMatch;
/// Create a copy of TicketsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketsStateCopyWith<TicketsState> get copyWith => _$TicketsStateCopyWithImpl<TicketsState>(this as TicketsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketsState&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&(identical(other.showSuccessModal, showSuccessModal) || other.showSuccessModal == showSuccessModal)&&(identical(other.lastBookedMatch, lastBookedMatch) || other.lastBookedMatch == lastBookedMatch));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTabIndex,showSuccessModal,lastBookedMatch);

@override
String toString() {
  return 'TicketsState(selectedTabIndex: $selectedTabIndex, showSuccessModal: $showSuccessModal, lastBookedMatch: $lastBookedMatch)';
}


}

/// @nodoc
abstract mixin class $TicketsStateCopyWith<$Res>  {
  factory $TicketsStateCopyWith(TicketsState value, $Res Function(TicketsState) _then) = _$TicketsStateCopyWithImpl;
@useResult
$Res call({
 int selectedTabIndex, bool showSuccessModal, UpcomingMatchModel? lastBookedMatch
});




}
/// @nodoc
class _$TicketsStateCopyWithImpl<$Res>
    implements $TicketsStateCopyWith<$Res> {
  _$TicketsStateCopyWithImpl(this._self, this._then);

  final TicketsState _self;
  final $Res Function(TicketsState) _then;

/// Create a copy of TicketsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTabIndex = null,Object? showSuccessModal = null,Object? lastBookedMatch = freezed,}) {
  return _then(_self.copyWith(
selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,showSuccessModal: null == showSuccessModal ? _self.showSuccessModal : showSuccessModal // ignore: cast_nullable_to_non_nullable
as bool,lastBookedMatch: freezed == lastBookedMatch ? _self.lastBookedMatch : lastBookedMatch // ignore: cast_nullable_to_non_nullable
as UpcomingMatchModel?,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketsState].
extension TicketsStatePatterns on TicketsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketsState value)  $default,){
final _that = this;
switch (_that) {
case _TicketsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketsState value)?  $default,){
final _that = this;
switch (_that) {
case _TicketsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int selectedTabIndex,  bool showSuccessModal,  UpcomingMatchModel? lastBookedMatch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketsState() when $default != null:
return $default(_that.selectedTabIndex,_that.showSuccessModal,_that.lastBookedMatch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int selectedTabIndex,  bool showSuccessModal,  UpcomingMatchModel? lastBookedMatch)  $default,) {final _that = this;
switch (_that) {
case _TicketsState():
return $default(_that.selectedTabIndex,_that.showSuccessModal,_that.lastBookedMatch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int selectedTabIndex,  bool showSuccessModal,  UpcomingMatchModel? lastBookedMatch)?  $default,) {final _that = this;
switch (_that) {
case _TicketsState() when $default != null:
return $default(_that.selectedTabIndex,_that.showSuccessModal,_that.lastBookedMatch);case _:
  return null;

}
}

}

/// @nodoc


class _TicketsState implements TicketsState {
  const _TicketsState({this.selectedTabIndex = 0, this.showSuccessModal = false, this.lastBookedMatch = null});
  

@override@JsonKey() final  int selectedTabIndex;
@override@JsonKey() final  bool showSuccessModal;
@override@JsonKey() final  UpcomingMatchModel? lastBookedMatch;

/// Create a copy of TicketsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketsStateCopyWith<_TicketsState> get copyWith => __$TicketsStateCopyWithImpl<_TicketsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketsState&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&(identical(other.showSuccessModal, showSuccessModal) || other.showSuccessModal == showSuccessModal)&&(identical(other.lastBookedMatch, lastBookedMatch) || other.lastBookedMatch == lastBookedMatch));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTabIndex,showSuccessModal,lastBookedMatch);

@override
String toString() {
  return 'TicketsState(selectedTabIndex: $selectedTabIndex, showSuccessModal: $showSuccessModal, lastBookedMatch: $lastBookedMatch)';
}


}

/// @nodoc
abstract mixin class _$TicketsStateCopyWith<$Res> implements $TicketsStateCopyWith<$Res> {
  factory _$TicketsStateCopyWith(_TicketsState value, $Res Function(_TicketsState) _then) = __$TicketsStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedTabIndex, bool showSuccessModal, UpcomingMatchModel? lastBookedMatch
});




}
/// @nodoc
class __$TicketsStateCopyWithImpl<$Res>
    implements _$TicketsStateCopyWith<$Res> {
  __$TicketsStateCopyWithImpl(this._self, this._then);

  final _TicketsState _self;
  final $Res Function(_TicketsState) _then;

/// Create a copy of TicketsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTabIndex = null,Object? showSuccessModal = null,Object? lastBookedMatch = freezed,}) {
  return _then(_TicketsState(
selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,showSuccessModal: null == showSuccessModal ? _self.showSuccessModal : showSuccessModal // ignore: cast_nullable_to_non_nullable
as bool,lastBookedMatch: freezed == lastBookedMatch ? _self.lastBookedMatch : lastBookedMatch // ignore: cast_nullable_to_non_nullable
as UpcomingMatchModel?,
  ));
}


}

// dart format on
