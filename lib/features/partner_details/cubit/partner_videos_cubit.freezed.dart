// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_videos_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PartnerVideosState {

 List<PartnerVideoModel> get videos; int get page; PartnerVideosStatus get status;
/// Create a copy of PartnerVideosState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnerVideosStateCopyWith<PartnerVideosState> get copyWith => _$PartnerVideosStateCopyWithImpl<PartnerVideosState>(this as PartnerVideosState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerVideosState&&const DeepCollectionEquality().equals(other.videos, videos)&&(identical(other.page, page) || other.page == page)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(videos),page,status);

@override
String toString() {
  return 'PartnerVideosState(videos: $videos, page: $page, status: $status)';
}


}

/// @nodoc
abstract mixin class $PartnerVideosStateCopyWith<$Res>  {
  factory $PartnerVideosStateCopyWith(PartnerVideosState value, $Res Function(PartnerVideosState) _then) = _$PartnerVideosStateCopyWithImpl;
@useResult
$Res call({
 List<PartnerVideoModel> videos, int page, PartnerVideosStatus status
});


$PartnerVideosStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$PartnerVideosStateCopyWithImpl<$Res>
    implements $PartnerVideosStateCopyWith<$Res> {
  _$PartnerVideosStateCopyWithImpl(this._self, this._then);

  final PartnerVideosState _self;
  final $Res Function(PartnerVideosState) _then;

/// Create a copy of PartnerVideosState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? videos = null,Object? page = null,Object? status = null,}) {
  return _then(_self.copyWith(
videos: null == videos ? _self.videos : videos // ignore: cast_nullable_to_non_nullable
as List<PartnerVideoModel>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PartnerVideosStatus,
  ));
}
/// Create a copy of PartnerVideosState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartnerVideosStatusCopyWith<$Res> get status {
  
  return $PartnerVideosStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartnerVideosState].
extension PartnerVideosStatePatterns on PartnerVideosState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartnerVideosState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartnerVideosState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartnerVideosState value)  $default,){
final _that = this;
switch (_that) {
case _PartnerVideosState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartnerVideosState value)?  $default,){
final _that = this;
switch (_that) {
case _PartnerVideosState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PartnerVideoModel> videos,  int page,  PartnerVideosStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartnerVideosState() when $default != null:
return $default(_that.videos,_that.page,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PartnerVideoModel> videos,  int page,  PartnerVideosStatus status)  $default,) {final _that = this;
switch (_that) {
case _PartnerVideosState():
return $default(_that.videos,_that.page,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PartnerVideoModel> videos,  int page,  PartnerVideosStatus status)?  $default,) {final _that = this;
switch (_that) {
case _PartnerVideosState() when $default != null:
return $default(_that.videos,_that.page,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _PartnerVideosState extends PartnerVideosState {
  const _PartnerVideosState({final  List<PartnerVideoModel> videos = const [], this.page = 1, this.status = const PartnerVideosStatus.initial()}): _videos = videos,super._();
  

 final  List<PartnerVideoModel> _videos;
@override@JsonKey() List<PartnerVideoModel> get videos {
  if (_videos is EqualUnmodifiableListView) return _videos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_videos);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  PartnerVideosStatus status;

/// Create a copy of PartnerVideosState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartnerVideosStateCopyWith<_PartnerVideosState> get copyWith => __$PartnerVideosStateCopyWithImpl<_PartnerVideosState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartnerVideosState&&const DeepCollectionEquality().equals(other._videos, _videos)&&(identical(other.page, page) || other.page == page)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_videos),page,status);

@override
String toString() {
  return 'PartnerVideosState(videos: $videos, page: $page, status: $status)';
}


}

/// @nodoc
abstract mixin class _$PartnerVideosStateCopyWith<$Res> implements $PartnerVideosStateCopyWith<$Res> {
  factory _$PartnerVideosStateCopyWith(_PartnerVideosState value, $Res Function(_PartnerVideosState) _then) = __$PartnerVideosStateCopyWithImpl;
@override @useResult
$Res call({
 List<PartnerVideoModel> videos, int page, PartnerVideosStatus status
});


@override $PartnerVideosStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$PartnerVideosStateCopyWithImpl<$Res>
    implements _$PartnerVideosStateCopyWith<$Res> {
  __$PartnerVideosStateCopyWithImpl(this._self, this._then);

  final _PartnerVideosState _self;
  final $Res Function(_PartnerVideosState) _then;

/// Create a copy of PartnerVideosState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? videos = null,Object? page = null,Object? status = null,}) {
  return _then(_PartnerVideosState(
videos: null == videos ? _self._videos : videos // ignore: cast_nullable_to_non_nullable
as List<PartnerVideoModel>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PartnerVideosStatus,
  ));
}

/// Create a copy of PartnerVideosState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartnerVideosStatusCopyWith<$Res> get status {
  
  return $PartnerVideosStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

/// @nodoc
mixin _$PartnerVideosStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerVideosStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnerVideosStatus()';
}


}

/// @nodoc
class $PartnerVideosStatusCopyWith<$Res>  {
$PartnerVideosStatusCopyWith(PartnerVideosStatus _, $Res Function(PartnerVideosStatus) __);
}


/// Adds pattern-matching-related methods to [PartnerVideosStatus].
extension PartnerVideosStatusPatterns on PartnerVideosStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PartnerVideosStatusInitial value)?  initial,TResult Function( PartnerVideosStatusLoading value)?  loading,TResult Function( PartnerVideosStatusError value)?  error,TResult Function( PartnerVideosStatusSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PartnerVideosStatusInitial() when initial != null:
return initial(_that);case PartnerVideosStatusLoading() when loading != null:
return loading(_that);case PartnerVideosStatusError() when error != null:
return error(_that);case PartnerVideosStatusSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PartnerVideosStatusInitial value)  initial,required TResult Function( PartnerVideosStatusLoading value)  loading,required TResult Function( PartnerVideosStatusError value)  error,required TResult Function( PartnerVideosStatusSuccess value)  success,}){
final _that = this;
switch (_that) {
case PartnerVideosStatusInitial():
return initial(_that);case PartnerVideosStatusLoading():
return loading(_that);case PartnerVideosStatusError():
return error(_that);case PartnerVideosStatusSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PartnerVideosStatusInitial value)?  initial,TResult? Function( PartnerVideosStatusLoading value)?  loading,TResult? Function( PartnerVideosStatusError value)?  error,TResult? Function( PartnerVideosStatusSuccess value)?  success,}){
final _that = this;
switch (_that) {
case PartnerVideosStatusInitial() when initial != null:
return initial(_that);case PartnerVideosStatusLoading() when loading != null:
return loading(_that);case PartnerVideosStatusError() when error != null:
return error(_that);case PartnerVideosStatusSuccess() when success != null:
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
case PartnerVideosStatusInitial() when initial != null:
return initial();case PartnerVideosStatusLoading() when loading != null:
return loading();case PartnerVideosStatusError() when error != null:
return error();case PartnerVideosStatusSuccess() when success != null:
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
case PartnerVideosStatusInitial():
return initial();case PartnerVideosStatusLoading():
return loading();case PartnerVideosStatusError():
return error();case PartnerVideosStatusSuccess():
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
case PartnerVideosStatusInitial() when initial != null:
return initial();case PartnerVideosStatusLoading() when loading != null:
return loading();case PartnerVideosStatusError() when error != null:
return error();case PartnerVideosStatusSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class PartnerVideosStatusInitial implements PartnerVideosStatus {
  const PartnerVideosStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerVideosStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnerVideosStatus.initial()';
}


}




/// @nodoc


class PartnerVideosStatusLoading implements PartnerVideosStatus {
  const PartnerVideosStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerVideosStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnerVideosStatus.loading()';
}


}




/// @nodoc


class PartnerVideosStatusError implements PartnerVideosStatus {
  const PartnerVideosStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerVideosStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnerVideosStatus.error()';
}


}




/// @nodoc


class PartnerVideosStatusSuccess implements PartnerVideosStatus {
  const PartnerVideosStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerVideosStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnerVideosStatus.success()';
}


}




// dart format on
