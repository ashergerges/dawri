// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_reviews_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PartnerReviewsState {

 List<PartnerReviewModel> get reviews; PartnerRatingModel? get rating; int get page; PartnerReviewsStatus get status;
/// Create a copy of PartnerReviewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnerReviewsStateCopyWith<PartnerReviewsState> get copyWith => _$PartnerReviewsStateCopyWithImpl<PartnerReviewsState>(this as PartnerReviewsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerReviewsState&&const DeepCollectionEquality().equals(other.reviews, reviews)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.page, page) || other.page == page)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(reviews),rating,page,status);

@override
String toString() {
  return 'PartnerReviewsState(reviews: $reviews, rating: $rating, page: $page, status: $status)';
}


}

/// @nodoc
abstract mixin class $PartnerReviewsStateCopyWith<$Res>  {
  factory $PartnerReviewsStateCopyWith(PartnerReviewsState value, $Res Function(PartnerReviewsState) _then) = _$PartnerReviewsStateCopyWithImpl;
@useResult
$Res call({
 List<PartnerReviewModel> reviews, PartnerRatingModel? rating, int page, PartnerReviewsStatus status
});


$PartnerReviewsStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$PartnerReviewsStateCopyWithImpl<$Res>
    implements $PartnerReviewsStateCopyWith<$Res> {
  _$PartnerReviewsStateCopyWithImpl(this._self, this._then);

  final PartnerReviewsState _self;
  final $Res Function(PartnerReviewsState) _then;

/// Create a copy of PartnerReviewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reviews = null,Object? rating = freezed,Object? page = null,Object? status = null,}) {
  return _then(_self.copyWith(
reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<PartnerReviewModel>,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as PartnerRatingModel?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PartnerReviewsStatus,
  ));
}
/// Create a copy of PartnerReviewsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartnerReviewsStatusCopyWith<$Res> get status {
  
  return $PartnerReviewsStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartnerReviewsState].
extension PartnerReviewsStatePatterns on PartnerReviewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartnerReviewsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartnerReviewsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartnerReviewsState value)  $default,){
final _that = this;
switch (_that) {
case _PartnerReviewsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartnerReviewsState value)?  $default,){
final _that = this;
switch (_that) {
case _PartnerReviewsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PartnerReviewModel> reviews,  PartnerRatingModel? rating,  int page,  PartnerReviewsStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartnerReviewsState() when $default != null:
return $default(_that.reviews,_that.rating,_that.page,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PartnerReviewModel> reviews,  PartnerRatingModel? rating,  int page,  PartnerReviewsStatus status)  $default,) {final _that = this;
switch (_that) {
case _PartnerReviewsState():
return $default(_that.reviews,_that.rating,_that.page,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PartnerReviewModel> reviews,  PartnerRatingModel? rating,  int page,  PartnerReviewsStatus status)?  $default,) {final _that = this;
switch (_that) {
case _PartnerReviewsState() when $default != null:
return $default(_that.reviews,_that.rating,_that.page,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _PartnerReviewsState extends PartnerReviewsState {
  const _PartnerReviewsState({final  List<PartnerReviewModel> reviews = const [], this.rating, this.page = 1, this.status = const PartnerReviewsStatus.initial()}): _reviews = reviews,super._();
  

 final  List<PartnerReviewModel> _reviews;
@override@JsonKey() List<PartnerReviewModel> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

@override final  PartnerRatingModel? rating;
@override@JsonKey() final  int page;
@override@JsonKey() final  PartnerReviewsStatus status;

/// Create a copy of PartnerReviewsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartnerReviewsStateCopyWith<_PartnerReviewsState> get copyWith => __$PartnerReviewsStateCopyWithImpl<_PartnerReviewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartnerReviewsState&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.page, page) || other.page == page)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reviews),rating,page,status);

@override
String toString() {
  return 'PartnerReviewsState(reviews: $reviews, rating: $rating, page: $page, status: $status)';
}


}

/// @nodoc
abstract mixin class _$PartnerReviewsStateCopyWith<$Res> implements $PartnerReviewsStateCopyWith<$Res> {
  factory _$PartnerReviewsStateCopyWith(_PartnerReviewsState value, $Res Function(_PartnerReviewsState) _then) = __$PartnerReviewsStateCopyWithImpl;
@override @useResult
$Res call({
 List<PartnerReviewModel> reviews, PartnerRatingModel? rating, int page, PartnerReviewsStatus status
});


@override $PartnerReviewsStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$PartnerReviewsStateCopyWithImpl<$Res>
    implements _$PartnerReviewsStateCopyWith<$Res> {
  __$PartnerReviewsStateCopyWithImpl(this._self, this._then);

  final _PartnerReviewsState _self;
  final $Res Function(_PartnerReviewsState) _then;

/// Create a copy of PartnerReviewsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reviews = null,Object? rating = freezed,Object? page = null,Object? status = null,}) {
  return _then(_PartnerReviewsState(
reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<PartnerReviewModel>,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as PartnerRatingModel?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PartnerReviewsStatus,
  ));
}

/// Create a copy of PartnerReviewsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartnerReviewsStatusCopyWith<$Res> get status {
  
  return $PartnerReviewsStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

/// @nodoc
mixin _$PartnerReviewsStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerReviewsStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnerReviewsStatus()';
}


}

/// @nodoc
class $PartnerReviewsStatusCopyWith<$Res>  {
$PartnerReviewsStatusCopyWith(PartnerReviewsStatus _, $Res Function(PartnerReviewsStatus) __);
}


/// Adds pattern-matching-related methods to [PartnerReviewsStatus].
extension PartnerReviewsStatusPatterns on PartnerReviewsStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PartnerReviewsStatusInitial value)?  initial,TResult Function( PartnerReviewsStatusLoading value)?  loading,TResult Function( PartnerReviewsStatusError value)?  error,TResult Function( PartnerReviewsStatusSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PartnerReviewsStatusInitial() when initial != null:
return initial(_that);case PartnerReviewsStatusLoading() when loading != null:
return loading(_that);case PartnerReviewsStatusError() when error != null:
return error(_that);case PartnerReviewsStatusSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PartnerReviewsStatusInitial value)  initial,required TResult Function( PartnerReviewsStatusLoading value)  loading,required TResult Function( PartnerReviewsStatusError value)  error,required TResult Function( PartnerReviewsStatusSuccess value)  success,}){
final _that = this;
switch (_that) {
case PartnerReviewsStatusInitial():
return initial(_that);case PartnerReviewsStatusLoading():
return loading(_that);case PartnerReviewsStatusError():
return error(_that);case PartnerReviewsStatusSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PartnerReviewsStatusInitial value)?  initial,TResult? Function( PartnerReviewsStatusLoading value)?  loading,TResult? Function( PartnerReviewsStatusError value)?  error,TResult? Function( PartnerReviewsStatusSuccess value)?  success,}){
final _that = this;
switch (_that) {
case PartnerReviewsStatusInitial() when initial != null:
return initial(_that);case PartnerReviewsStatusLoading() when loading != null:
return loading(_that);case PartnerReviewsStatusError() when error != null:
return error(_that);case PartnerReviewsStatusSuccess() when success != null:
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
case PartnerReviewsStatusInitial() when initial != null:
return initial();case PartnerReviewsStatusLoading() when loading != null:
return loading();case PartnerReviewsStatusError() when error != null:
return error();case PartnerReviewsStatusSuccess() when success != null:
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
case PartnerReviewsStatusInitial():
return initial();case PartnerReviewsStatusLoading():
return loading();case PartnerReviewsStatusError():
return error();case PartnerReviewsStatusSuccess():
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
case PartnerReviewsStatusInitial() when initial != null:
return initial();case PartnerReviewsStatusLoading() when loading != null:
return loading();case PartnerReviewsStatusError() when error != null:
return error();case PartnerReviewsStatusSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class PartnerReviewsStatusInitial implements PartnerReviewsStatus {
  const PartnerReviewsStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerReviewsStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnerReviewsStatus.initial()';
}


}




/// @nodoc


class PartnerReviewsStatusLoading implements PartnerReviewsStatus {
  const PartnerReviewsStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerReviewsStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnerReviewsStatus.loading()';
}


}




/// @nodoc


class PartnerReviewsStatusError implements PartnerReviewsStatus {
  const PartnerReviewsStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerReviewsStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnerReviewsStatus.error()';
}


}




/// @nodoc


class PartnerReviewsStatusSuccess implements PartnerReviewsStatus {
  const PartnerReviewsStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerReviewsStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnerReviewsStatus.success()';
}


}




// dart format on
