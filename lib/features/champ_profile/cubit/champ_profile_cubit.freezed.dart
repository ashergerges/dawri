// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'champ_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChampProfileState {

 ChampTab get selectedTab; bool get isFav; bool get isRegistering; bool get isRegistered; bool get showSuccessModal;
/// Create a copy of ChampProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChampProfileStateCopyWith<ChampProfileState> get copyWith => _$ChampProfileStateCopyWithImpl<ChampProfileState>(this as ChampProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampProfileState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.isFav, isFav) || other.isFav == isFav)&&(identical(other.isRegistering, isRegistering) || other.isRegistering == isRegistering)&&(identical(other.isRegistered, isRegistered) || other.isRegistered == isRegistered)&&(identical(other.showSuccessModal, showSuccessModal) || other.showSuccessModal == showSuccessModal));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,isFav,isRegistering,isRegistered,showSuccessModal);

@override
String toString() {
  return 'ChampProfileState(selectedTab: $selectedTab, isFav: $isFav, isRegistering: $isRegistering, isRegistered: $isRegistered, showSuccessModal: $showSuccessModal)';
}


}

/// @nodoc
abstract mixin class $ChampProfileStateCopyWith<$Res>  {
  factory $ChampProfileStateCopyWith(ChampProfileState value, $Res Function(ChampProfileState) _then) = _$ChampProfileStateCopyWithImpl;
@useResult
$Res call({
 ChampTab selectedTab, bool isFav, bool isRegistering, bool isRegistered, bool showSuccessModal
});




}
/// @nodoc
class _$ChampProfileStateCopyWithImpl<$Res>
    implements $ChampProfileStateCopyWith<$Res> {
  _$ChampProfileStateCopyWithImpl(this._self, this._then);

  final ChampProfileState _self;
  final $Res Function(ChampProfileState) _then;

/// Create a copy of ChampProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTab = null,Object? isFav = null,Object? isRegistering = null,Object? isRegistered = null,Object? showSuccessModal = null,}) {
  return _then(_self.copyWith(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as ChampTab,isFav: null == isFav ? _self.isFav : isFav // ignore: cast_nullable_to_non_nullable
as bool,isRegistering: null == isRegistering ? _self.isRegistering : isRegistering // ignore: cast_nullable_to_non_nullable
as bool,isRegistered: null == isRegistered ? _self.isRegistered : isRegistered // ignore: cast_nullable_to_non_nullable
as bool,showSuccessModal: null == showSuccessModal ? _self.showSuccessModal : showSuccessModal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChampProfileState].
extension ChampProfileStatePatterns on ChampProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChampProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChampProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChampProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ChampProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChampProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ChampProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChampTab selectedTab,  bool isFav,  bool isRegistering,  bool isRegistered,  bool showSuccessModal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChampProfileState() when $default != null:
return $default(_that.selectedTab,_that.isFav,_that.isRegistering,_that.isRegistered,_that.showSuccessModal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChampTab selectedTab,  bool isFav,  bool isRegistering,  bool isRegistered,  bool showSuccessModal)  $default,) {final _that = this;
switch (_that) {
case _ChampProfileState():
return $default(_that.selectedTab,_that.isFav,_that.isRegistering,_that.isRegistered,_that.showSuccessModal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChampTab selectedTab,  bool isFav,  bool isRegistering,  bool isRegistered,  bool showSuccessModal)?  $default,) {final _that = this;
switch (_that) {
case _ChampProfileState() when $default != null:
return $default(_that.selectedTab,_that.isFav,_that.isRegistering,_that.isRegistered,_that.showSuccessModal);case _:
  return null;

}
}

}

/// @nodoc


class _ChampProfileState implements ChampProfileState {
  const _ChampProfileState({this.selectedTab = ChampTab.info, this.isFav = false, this.isRegistering = false, this.isRegistered = false, this.showSuccessModal = false});
  

@override@JsonKey() final  ChampTab selectedTab;
@override@JsonKey() final  bool isFav;
@override@JsonKey() final  bool isRegistering;
@override@JsonKey() final  bool isRegistered;
@override@JsonKey() final  bool showSuccessModal;

/// Create a copy of ChampProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChampProfileStateCopyWith<_ChampProfileState> get copyWith => __$ChampProfileStateCopyWithImpl<_ChampProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChampProfileState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.isFav, isFav) || other.isFav == isFav)&&(identical(other.isRegistering, isRegistering) || other.isRegistering == isRegistering)&&(identical(other.isRegistered, isRegistered) || other.isRegistered == isRegistered)&&(identical(other.showSuccessModal, showSuccessModal) || other.showSuccessModal == showSuccessModal));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,isFav,isRegistering,isRegistered,showSuccessModal);

@override
String toString() {
  return 'ChampProfileState(selectedTab: $selectedTab, isFav: $isFav, isRegistering: $isRegistering, isRegistered: $isRegistered, showSuccessModal: $showSuccessModal)';
}


}

/// @nodoc
abstract mixin class _$ChampProfileStateCopyWith<$Res> implements $ChampProfileStateCopyWith<$Res> {
  factory _$ChampProfileStateCopyWith(_ChampProfileState value, $Res Function(_ChampProfileState) _then) = __$ChampProfileStateCopyWithImpl;
@override @useResult
$Res call({
 ChampTab selectedTab, bool isFav, bool isRegistering, bool isRegistered, bool showSuccessModal
});




}
/// @nodoc
class __$ChampProfileStateCopyWithImpl<$Res>
    implements _$ChampProfileStateCopyWith<$Res> {
  __$ChampProfileStateCopyWithImpl(this._self, this._then);

  final _ChampProfileState _self;
  final $Res Function(_ChampProfileState) _then;

/// Create a copy of ChampProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,Object? isFav = null,Object? isRegistering = null,Object? isRegistered = null,Object? showSuccessModal = null,}) {
  return _then(_ChampProfileState(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as ChampTab,isFav: null == isFav ? _self.isFav : isFav // ignore: cast_nullable_to_non_nullable
as bool,isRegistering: null == isRegistering ? _self.isRegistering : isRegistering // ignore: cast_nullable_to_non_nullable
as bool,isRegistered: null == isRegistered ? _self.isRegistered : isRegistered // ignore: cast_nullable_to_non_nullable
as bool,showSuccessModal: null == showSuccessModal ? _self.showSuccessModal : showSuccessModal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
