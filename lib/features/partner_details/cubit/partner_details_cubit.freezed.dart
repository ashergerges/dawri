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

 PartnerDetailsModel? get partner; PartnerDetailsStatus get detailsStatus;/// Kept apart from [partner] so the heart flips instantly (optimistic).
 bool get isFavorite;/// Videos whose view the server counted during this visit. Held separately
/// because [videos] is derived from [partner], which has no copyWith —
/// cleared on reload, when the fresh payload already includes them.
 Set<int> get extraViewIds;
/// Create a copy of PartnerDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnerDetailsStateCopyWith<PartnerDetailsState> get copyWith => _$PartnerDetailsStateCopyWithImpl<PartnerDetailsState>(this as PartnerDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerDetailsState&&(identical(other.partner, partner) || other.partner == partner)&&(identical(other.detailsStatus, detailsStatus) || other.detailsStatus == detailsStatus)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&const DeepCollectionEquality().equals(other.extraViewIds, extraViewIds));
}


@override
int get hashCode => Object.hash(runtimeType,partner,detailsStatus,isFavorite,const DeepCollectionEquality().hash(extraViewIds));

@override
String toString() {
  return 'PartnerDetailsState(partner: $partner, detailsStatus: $detailsStatus, isFavorite: $isFavorite, extraViewIds: $extraViewIds)';
}


}

/// @nodoc
abstract mixin class $PartnerDetailsStateCopyWith<$Res>  {
  factory $PartnerDetailsStateCopyWith(PartnerDetailsState value, $Res Function(PartnerDetailsState) _then) = _$PartnerDetailsStateCopyWithImpl;
@useResult
$Res call({
 PartnerDetailsModel? partner, PartnerDetailsStatus detailsStatus, bool isFavorite, Set<int> extraViewIds
});


$PartnerDetailsStatusCopyWith<$Res> get detailsStatus;

}
/// @nodoc
class _$PartnerDetailsStateCopyWithImpl<$Res>
    implements $PartnerDetailsStateCopyWith<$Res> {
  _$PartnerDetailsStateCopyWithImpl(this._self, this._then);

  final PartnerDetailsState _self;
  final $Res Function(PartnerDetailsState) _then;

/// Create a copy of PartnerDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? partner = freezed,Object? detailsStatus = null,Object? isFavorite = null,Object? extraViewIds = null,}) {
  return _then(_self.copyWith(
partner: freezed == partner ? _self.partner : partner // ignore: cast_nullable_to_non_nullable
as PartnerDetailsModel?,detailsStatus: null == detailsStatus ? _self.detailsStatus : detailsStatus // ignore: cast_nullable_to_non_nullable
as PartnerDetailsStatus,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,extraViewIds: null == extraViewIds ? _self.extraViewIds : extraViewIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}
/// Create a copy of PartnerDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartnerDetailsStatusCopyWith<$Res> get detailsStatus {
  
  return $PartnerDetailsStatusCopyWith<$Res>(_self.detailsStatus, (value) {
    return _then(_self.copyWith(detailsStatus: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PartnerDetailsModel? partner,  PartnerDetailsStatus detailsStatus,  bool isFavorite,  Set<int> extraViewIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartnerDetailsState() when $default != null:
return $default(_that.partner,_that.detailsStatus,_that.isFavorite,_that.extraViewIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PartnerDetailsModel? partner,  PartnerDetailsStatus detailsStatus,  bool isFavorite,  Set<int> extraViewIds)  $default,) {final _that = this;
switch (_that) {
case _PartnerDetailsState():
return $default(_that.partner,_that.detailsStatus,_that.isFavorite,_that.extraViewIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PartnerDetailsModel? partner,  PartnerDetailsStatus detailsStatus,  bool isFavorite,  Set<int> extraViewIds)?  $default,) {final _that = this;
switch (_that) {
case _PartnerDetailsState() when $default != null:
return $default(_that.partner,_that.detailsStatus,_that.isFavorite,_that.extraViewIds);case _:
  return null;

}
}

}

/// @nodoc


class _PartnerDetailsState extends PartnerDetailsState {
  const _PartnerDetailsState({this.partner, this.detailsStatus = const PartnerDetailsStatus.initial(), this.isFavorite = false, final  Set<int> extraViewIds = const <int>{}}): _extraViewIds = extraViewIds,super._();
  

@override final  PartnerDetailsModel? partner;
@override@JsonKey() final  PartnerDetailsStatus detailsStatus;
/// Kept apart from [partner] so the heart flips instantly (optimistic).
@override@JsonKey() final  bool isFavorite;
/// Videos whose view the server counted during this visit. Held separately
/// because [videos] is derived from [partner], which has no copyWith —
/// cleared on reload, when the fresh payload already includes them.
 final  Set<int> _extraViewIds;
/// Videos whose view the server counted during this visit. Held separately
/// because [videos] is derived from [partner], which has no copyWith —
/// cleared on reload, when the fresh payload already includes them.
@override@JsonKey() Set<int> get extraViewIds {
  if (_extraViewIds is EqualUnmodifiableSetView) return _extraViewIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_extraViewIds);
}


/// Create a copy of PartnerDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartnerDetailsStateCopyWith<_PartnerDetailsState> get copyWith => __$PartnerDetailsStateCopyWithImpl<_PartnerDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartnerDetailsState&&(identical(other.partner, partner) || other.partner == partner)&&(identical(other.detailsStatus, detailsStatus) || other.detailsStatus == detailsStatus)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&const DeepCollectionEquality().equals(other._extraViewIds, _extraViewIds));
}


@override
int get hashCode => Object.hash(runtimeType,partner,detailsStatus,isFavorite,const DeepCollectionEquality().hash(_extraViewIds));

@override
String toString() {
  return 'PartnerDetailsState(partner: $partner, detailsStatus: $detailsStatus, isFavorite: $isFavorite, extraViewIds: $extraViewIds)';
}


}

/// @nodoc
abstract mixin class _$PartnerDetailsStateCopyWith<$Res> implements $PartnerDetailsStateCopyWith<$Res> {
  factory _$PartnerDetailsStateCopyWith(_PartnerDetailsState value, $Res Function(_PartnerDetailsState) _then) = __$PartnerDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 PartnerDetailsModel? partner, PartnerDetailsStatus detailsStatus, bool isFavorite, Set<int> extraViewIds
});


@override $PartnerDetailsStatusCopyWith<$Res> get detailsStatus;

}
/// @nodoc
class __$PartnerDetailsStateCopyWithImpl<$Res>
    implements _$PartnerDetailsStateCopyWith<$Res> {
  __$PartnerDetailsStateCopyWithImpl(this._self, this._then);

  final _PartnerDetailsState _self;
  final $Res Function(_PartnerDetailsState) _then;

/// Create a copy of PartnerDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? partner = freezed,Object? detailsStatus = null,Object? isFavorite = null,Object? extraViewIds = null,}) {
  return _then(_PartnerDetailsState(
partner: freezed == partner ? _self.partner : partner // ignore: cast_nullable_to_non_nullable
as PartnerDetailsModel?,detailsStatus: null == detailsStatus ? _self.detailsStatus : detailsStatus // ignore: cast_nullable_to_non_nullable
as PartnerDetailsStatus,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,extraViewIds: null == extraViewIds ? _self._extraViewIds : extraViewIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}

/// Create a copy of PartnerDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartnerDetailsStatusCopyWith<$Res> get detailsStatus {
  
  return $PartnerDetailsStatusCopyWith<$Res>(_self.detailsStatus, (value) {
    return _then(_self.copyWith(detailsStatus: value));
  });
}
}

/// @nodoc
mixin _$PartnerDetailsStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerDetailsStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnerDetailsStatus()';
}


}

/// @nodoc
class $PartnerDetailsStatusCopyWith<$Res>  {
$PartnerDetailsStatusCopyWith(PartnerDetailsStatus _, $Res Function(PartnerDetailsStatus) __);
}


/// Adds pattern-matching-related methods to [PartnerDetailsStatus].
extension PartnerDetailsStatusPatterns on PartnerDetailsStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PartnerDetailsStatusInitial value)?  initial,TResult Function( PartnerDetailsStatusLoading value)?  loading,TResult Function( PartnerDetailsStatusError value)?  error,TResult Function( PartnerDetailsStatusSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PartnerDetailsStatusInitial() when initial != null:
return initial(_that);case PartnerDetailsStatusLoading() when loading != null:
return loading(_that);case PartnerDetailsStatusError() when error != null:
return error(_that);case PartnerDetailsStatusSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PartnerDetailsStatusInitial value)  initial,required TResult Function( PartnerDetailsStatusLoading value)  loading,required TResult Function( PartnerDetailsStatusError value)  error,required TResult Function( PartnerDetailsStatusSuccess value)  success,}){
final _that = this;
switch (_that) {
case PartnerDetailsStatusInitial():
return initial(_that);case PartnerDetailsStatusLoading():
return loading(_that);case PartnerDetailsStatusError():
return error(_that);case PartnerDetailsStatusSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PartnerDetailsStatusInitial value)?  initial,TResult? Function( PartnerDetailsStatusLoading value)?  loading,TResult? Function( PartnerDetailsStatusError value)?  error,TResult? Function( PartnerDetailsStatusSuccess value)?  success,}){
final _that = this;
switch (_that) {
case PartnerDetailsStatusInitial() when initial != null:
return initial(_that);case PartnerDetailsStatusLoading() when loading != null:
return loading(_that);case PartnerDetailsStatusError() when error != null:
return error(_that);case PartnerDetailsStatusSuccess() when success != null:
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
case PartnerDetailsStatusInitial() when initial != null:
return initial();case PartnerDetailsStatusLoading() when loading != null:
return loading();case PartnerDetailsStatusError() when error != null:
return error();case PartnerDetailsStatusSuccess() when success != null:
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
case PartnerDetailsStatusInitial():
return initial();case PartnerDetailsStatusLoading():
return loading();case PartnerDetailsStatusError():
return error();case PartnerDetailsStatusSuccess():
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
case PartnerDetailsStatusInitial() when initial != null:
return initial();case PartnerDetailsStatusLoading() when loading != null:
return loading();case PartnerDetailsStatusError() when error != null:
return error();case PartnerDetailsStatusSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class PartnerDetailsStatusInitial implements PartnerDetailsStatus {
  const PartnerDetailsStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerDetailsStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnerDetailsStatus.initial()';
}


}




/// @nodoc


class PartnerDetailsStatusLoading implements PartnerDetailsStatus {
  const PartnerDetailsStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerDetailsStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnerDetailsStatus.loading()';
}


}




/// @nodoc


class PartnerDetailsStatusError implements PartnerDetailsStatus {
  const PartnerDetailsStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerDetailsStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnerDetailsStatus.error()';
}


}




/// @nodoc


class PartnerDetailsStatusSuccess implements PartnerDetailsStatus {
  const PartnerDetailsStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerDetailsStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnerDetailsStatus.success()';
}


}




// dart format on
