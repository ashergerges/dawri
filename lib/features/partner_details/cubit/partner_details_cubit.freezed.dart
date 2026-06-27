// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PartnerDetailsState {

 bool get isLiked;
/// Create a copy of PartnerDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnerDetailsStateCopyWith<PartnerDetailsState> get copyWith => _$PartnerDetailsStateCopyWithImpl<PartnerDetailsState>(this as PartnerDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerDetailsState&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked));
}


@override
int get hashCode => Object.hash(runtimeType,isLiked);

@override
String toString() {
  return 'PartnerDetailsState(isLiked: $isLiked)';
}


}

/// @nodoc
abstract mixin class $PartnerDetailsStateCopyWith<$Res>  {
  factory $PartnerDetailsStateCopyWith(PartnerDetailsState value, $Res Function(PartnerDetailsState) _then) = _$PartnerDetailsStateCopyWithImpl;
@useResult
$Res call({
 bool isLiked
});




}
/// @nodoc
class _$PartnerDetailsStateCopyWithImpl<$Res>
    implements $PartnerDetailsStateCopyWith<$Res> {
  _$PartnerDetailsStateCopyWithImpl(this._self, this._then);

  final PartnerDetailsState _self;
  final $Res Function(PartnerDetailsState) _then;

/// Create a copy of PartnerDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLiked = null,}) {
  return _then(_self.copyWith(
isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PartnerDetailsState].
extension PartnerDetailsStatePatterns on PartnerDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartnerDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartnerDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartnerDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _PartnerDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartnerDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _PartnerDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLiked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartnerDetailsState() when $default != null:
return $default(_that.isLiked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLiked)  $default,) {final _that = this;
switch (_that) {
case _PartnerDetailsState():
return $default(_that.isLiked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLiked)?  $default,) {final _that = this;
switch (_that) {
case _PartnerDetailsState() when $default != null:
return $default(_that.isLiked);case _:
  return null;

}
}

}

/// @nodoc


class _PartnerDetailsState implements PartnerDetailsState {
  const _PartnerDetailsState({this.isLiked = false});
  

@override@JsonKey() final  bool isLiked;

/// Create a copy of PartnerDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartnerDetailsStateCopyWith<_PartnerDetailsState> get copyWith => __$PartnerDetailsStateCopyWithImpl<_PartnerDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartnerDetailsState&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked));
}


@override
int get hashCode => Object.hash(runtimeType,isLiked);

@override
String toString() {
  return 'PartnerDetailsState(isLiked: $isLiked)';
}


}

/// @nodoc
abstract mixin class _$PartnerDetailsStateCopyWith<$Res> implements $PartnerDetailsStateCopyWith<$Res> {
  factory _$PartnerDetailsStateCopyWith(_PartnerDetailsState value, $Res Function(_PartnerDetailsState) _then) = __$PartnerDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLiked
});




}
/// @nodoc
class __$PartnerDetailsStateCopyWithImpl<$Res>
    implements _$PartnerDetailsStateCopyWith<$Res> {
  __$PartnerDetailsStateCopyWithImpl(this._self, this._then);

  final _PartnerDetailsState _self;
  final $Res Function(_PartnerDetailsState) _then;

/// Create a copy of PartnerDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLiked = null,}) {
  return _then(_PartnerDetailsState(
isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
