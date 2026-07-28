// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stadium_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StadiumProfileState {

 int get activeImageIndex;// ─── Details ─────────────────────────────────────────────
 StadiumDetailsModel? get stadium; StadiumProfileStatus get detailsStatus; bool get isFavorite;// ─── Reviews (bottom sheet) ──────────────────────────────
 List<StadiumReviewModel> get reviews; int get reviewsPage; bool get hasMoreReviews; StadiumProfileStatus get reviewsStatus;// ─── Rate ────────────────────────────────────────────────
 int get selectedStars; String get comment; StadiumProfileStatus get rateSubmitStatus;
/// Create a copy of StadiumProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StadiumProfileStateCopyWith<StadiumProfileState> get copyWith => _$StadiumProfileStateCopyWithImpl<StadiumProfileState>(this as StadiumProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StadiumProfileState&&(identical(other.activeImageIndex, activeImageIndex) || other.activeImageIndex == activeImageIndex)&&(identical(other.stadium, stadium) || other.stadium == stadium)&&(identical(other.detailsStatus, detailsStatus) || other.detailsStatus == detailsStatus)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&const DeepCollectionEquality().equals(other.reviews, reviews)&&(identical(other.reviewsPage, reviewsPage) || other.reviewsPage == reviewsPage)&&(identical(other.hasMoreReviews, hasMoreReviews) || other.hasMoreReviews == hasMoreReviews)&&(identical(other.reviewsStatus, reviewsStatus) || other.reviewsStatus == reviewsStatus)&&(identical(other.selectedStars, selectedStars) || other.selectedStars == selectedStars)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.rateSubmitStatus, rateSubmitStatus) || other.rateSubmitStatus == rateSubmitStatus));
}


@override
int get hashCode => Object.hash(runtimeType,activeImageIndex,stadium,detailsStatus,isFavorite,const DeepCollectionEquality().hash(reviews),reviewsPage,hasMoreReviews,reviewsStatus,selectedStars,comment,rateSubmitStatus);

@override
String toString() {
  return 'StadiumProfileState(activeImageIndex: $activeImageIndex, stadium: $stadium, detailsStatus: $detailsStatus, isFavorite: $isFavorite, reviews: $reviews, reviewsPage: $reviewsPage, hasMoreReviews: $hasMoreReviews, reviewsStatus: $reviewsStatus, selectedStars: $selectedStars, comment: $comment, rateSubmitStatus: $rateSubmitStatus)';
}


}

/// @nodoc
abstract mixin class $StadiumProfileStateCopyWith<$Res>  {
  factory $StadiumProfileStateCopyWith(StadiumProfileState value, $Res Function(StadiumProfileState) _then) = _$StadiumProfileStateCopyWithImpl;
@useResult
$Res call({
 int activeImageIndex, StadiumDetailsModel? stadium, StadiumProfileStatus detailsStatus, bool isFavorite, List<StadiumReviewModel> reviews, int reviewsPage, bool hasMoreReviews, StadiumProfileStatus reviewsStatus, int selectedStars, String comment, StadiumProfileStatus rateSubmitStatus
});


$StadiumProfileStatusCopyWith<$Res> get detailsStatus;$StadiumProfileStatusCopyWith<$Res> get reviewsStatus;$StadiumProfileStatusCopyWith<$Res> get rateSubmitStatus;

}
/// @nodoc
class _$StadiumProfileStateCopyWithImpl<$Res>
    implements $StadiumProfileStateCopyWith<$Res> {
  _$StadiumProfileStateCopyWithImpl(this._self, this._then);

  final StadiumProfileState _self;
  final $Res Function(StadiumProfileState) _then;

/// Create a copy of StadiumProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeImageIndex = null,Object? stadium = freezed,Object? detailsStatus = null,Object? isFavorite = null,Object? reviews = null,Object? reviewsPage = null,Object? hasMoreReviews = null,Object? reviewsStatus = null,Object? selectedStars = null,Object? comment = null,Object? rateSubmitStatus = null,}) {
  return _then(_self.copyWith(
activeImageIndex: null == activeImageIndex ? _self.activeImageIndex : activeImageIndex // ignore: cast_nullable_to_non_nullable
as int,stadium: freezed == stadium ? _self.stadium : stadium // ignore: cast_nullable_to_non_nullable
as StadiumDetailsModel?,detailsStatus: null == detailsStatus ? _self.detailsStatus : detailsStatus // ignore: cast_nullable_to_non_nullable
as StadiumProfileStatus,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<StadiumReviewModel>,reviewsPage: null == reviewsPage ? _self.reviewsPage : reviewsPage // ignore: cast_nullable_to_non_nullable
as int,hasMoreReviews: null == hasMoreReviews ? _self.hasMoreReviews : hasMoreReviews // ignore: cast_nullable_to_non_nullable
as bool,reviewsStatus: null == reviewsStatus ? _self.reviewsStatus : reviewsStatus // ignore: cast_nullable_to_non_nullable
as StadiumProfileStatus,selectedStars: null == selectedStars ? _self.selectedStars : selectedStars // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,rateSubmitStatus: null == rateSubmitStatus ? _self.rateSubmitStatus : rateSubmitStatus // ignore: cast_nullable_to_non_nullable
as StadiumProfileStatus,
  ));
}
/// Create a copy of StadiumProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StadiumProfileStatusCopyWith<$Res> get detailsStatus {
  
  return $StadiumProfileStatusCopyWith<$Res>(_self.detailsStatus, (value) {
    return _then(_self.copyWith(detailsStatus: value));
  });
}/// Create a copy of StadiumProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StadiumProfileStatusCopyWith<$Res> get reviewsStatus {
  
  return $StadiumProfileStatusCopyWith<$Res>(_self.reviewsStatus, (value) {
    return _then(_self.copyWith(reviewsStatus: value));
  });
}/// Create a copy of StadiumProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StadiumProfileStatusCopyWith<$Res> get rateSubmitStatus {
  
  return $StadiumProfileStatusCopyWith<$Res>(_self.rateSubmitStatus, (value) {
    return _then(_self.copyWith(rateSubmitStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [StadiumProfileState].
extension StadiumProfileStatePatterns on StadiumProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StadiumProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StadiumProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StadiumProfileState value)  $default,){
final _that = this;
switch (_that) {
case _StadiumProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StadiumProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _StadiumProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int activeImageIndex,  StadiumDetailsModel? stadium,  StadiumProfileStatus detailsStatus,  bool isFavorite,  List<StadiumReviewModel> reviews,  int reviewsPage,  bool hasMoreReviews,  StadiumProfileStatus reviewsStatus,  int selectedStars,  String comment,  StadiumProfileStatus rateSubmitStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StadiumProfileState() when $default != null:
return $default(_that.activeImageIndex,_that.stadium,_that.detailsStatus,_that.isFavorite,_that.reviews,_that.reviewsPage,_that.hasMoreReviews,_that.reviewsStatus,_that.selectedStars,_that.comment,_that.rateSubmitStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int activeImageIndex,  StadiumDetailsModel? stadium,  StadiumProfileStatus detailsStatus,  bool isFavorite,  List<StadiumReviewModel> reviews,  int reviewsPage,  bool hasMoreReviews,  StadiumProfileStatus reviewsStatus,  int selectedStars,  String comment,  StadiumProfileStatus rateSubmitStatus)  $default,) {final _that = this;
switch (_that) {
case _StadiumProfileState():
return $default(_that.activeImageIndex,_that.stadium,_that.detailsStatus,_that.isFavorite,_that.reviews,_that.reviewsPage,_that.hasMoreReviews,_that.reviewsStatus,_that.selectedStars,_that.comment,_that.rateSubmitStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int activeImageIndex,  StadiumDetailsModel? stadium,  StadiumProfileStatus detailsStatus,  bool isFavorite,  List<StadiumReviewModel> reviews,  int reviewsPage,  bool hasMoreReviews,  StadiumProfileStatus reviewsStatus,  int selectedStars,  String comment,  StadiumProfileStatus rateSubmitStatus)?  $default,) {final _that = this;
switch (_that) {
case _StadiumProfileState() when $default != null:
return $default(_that.activeImageIndex,_that.stadium,_that.detailsStatus,_that.isFavorite,_that.reviews,_that.reviewsPage,_that.hasMoreReviews,_that.reviewsStatus,_that.selectedStars,_that.comment,_that.rateSubmitStatus);case _:
  return null;

}
}

}

/// @nodoc


class _StadiumProfileState implements StadiumProfileState {
  const _StadiumProfileState({this.activeImageIndex = 0, this.stadium, this.detailsStatus = const StadiumProfileStatus.initial(), this.isFavorite = false, final  List<StadiumReviewModel> reviews = const [], this.reviewsPage = 1, this.hasMoreReviews = true, this.reviewsStatus = const StadiumProfileStatus.initial(), this.selectedStars = 0, this.comment = '', this.rateSubmitStatus = const StadiumProfileStatus.initial()}): _reviews = reviews;
  

@override@JsonKey() final  int activeImageIndex;
// ─── Details ─────────────────────────────────────────────
@override final  StadiumDetailsModel? stadium;
@override@JsonKey() final  StadiumProfileStatus detailsStatus;
@override@JsonKey() final  bool isFavorite;
// ─── Reviews (bottom sheet) ──────────────────────────────
 final  List<StadiumReviewModel> _reviews;
// ─── Reviews (bottom sheet) ──────────────────────────────
@override@JsonKey() List<StadiumReviewModel> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

@override@JsonKey() final  int reviewsPage;
@override@JsonKey() final  bool hasMoreReviews;
@override@JsonKey() final  StadiumProfileStatus reviewsStatus;
// ─── Rate ────────────────────────────────────────────────
@override@JsonKey() final  int selectedStars;
@override@JsonKey() final  String comment;
@override@JsonKey() final  StadiumProfileStatus rateSubmitStatus;

/// Create a copy of StadiumProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StadiumProfileStateCopyWith<_StadiumProfileState> get copyWith => __$StadiumProfileStateCopyWithImpl<_StadiumProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StadiumProfileState&&(identical(other.activeImageIndex, activeImageIndex) || other.activeImageIndex == activeImageIndex)&&(identical(other.stadium, stadium) || other.stadium == stadium)&&(identical(other.detailsStatus, detailsStatus) || other.detailsStatus == detailsStatus)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&(identical(other.reviewsPage, reviewsPage) || other.reviewsPage == reviewsPage)&&(identical(other.hasMoreReviews, hasMoreReviews) || other.hasMoreReviews == hasMoreReviews)&&(identical(other.reviewsStatus, reviewsStatus) || other.reviewsStatus == reviewsStatus)&&(identical(other.selectedStars, selectedStars) || other.selectedStars == selectedStars)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.rateSubmitStatus, rateSubmitStatus) || other.rateSubmitStatus == rateSubmitStatus));
}


@override
int get hashCode => Object.hash(runtimeType,activeImageIndex,stadium,detailsStatus,isFavorite,const DeepCollectionEquality().hash(_reviews),reviewsPage,hasMoreReviews,reviewsStatus,selectedStars,comment,rateSubmitStatus);

@override
String toString() {
  return 'StadiumProfileState(activeImageIndex: $activeImageIndex, stadium: $stadium, detailsStatus: $detailsStatus, isFavorite: $isFavorite, reviews: $reviews, reviewsPage: $reviewsPage, hasMoreReviews: $hasMoreReviews, reviewsStatus: $reviewsStatus, selectedStars: $selectedStars, comment: $comment, rateSubmitStatus: $rateSubmitStatus)';
}


}

/// @nodoc
abstract mixin class _$StadiumProfileStateCopyWith<$Res> implements $StadiumProfileStateCopyWith<$Res> {
  factory _$StadiumProfileStateCopyWith(_StadiumProfileState value, $Res Function(_StadiumProfileState) _then) = __$StadiumProfileStateCopyWithImpl;
@override @useResult
$Res call({
 int activeImageIndex, StadiumDetailsModel? stadium, StadiumProfileStatus detailsStatus, bool isFavorite, List<StadiumReviewModel> reviews, int reviewsPage, bool hasMoreReviews, StadiumProfileStatus reviewsStatus, int selectedStars, String comment, StadiumProfileStatus rateSubmitStatus
});


@override $StadiumProfileStatusCopyWith<$Res> get detailsStatus;@override $StadiumProfileStatusCopyWith<$Res> get reviewsStatus;@override $StadiumProfileStatusCopyWith<$Res> get rateSubmitStatus;

}
/// @nodoc
class __$StadiumProfileStateCopyWithImpl<$Res>
    implements _$StadiumProfileStateCopyWith<$Res> {
  __$StadiumProfileStateCopyWithImpl(this._self, this._then);

  final _StadiumProfileState _self;
  final $Res Function(_StadiumProfileState) _then;

/// Create a copy of StadiumProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeImageIndex = null,Object? stadium = freezed,Object? detailsStatus = null,Object? isFavorite = null,Object? reviews = null,Object? reviewsPage = null,Object? hasMoreReviews = null,Object? reviewsStatus = null,Object? selectedStars = null,Object? comment = null,Object? rateSubmitStatus = null,}) {
  return _then(_StadiumProfileState(
activeImageIndex: null == activeImageIndex ? _self.activeImageIndex : activeImageIndex // ignore: cast_nullable_to_non_nullable
as int,stadium: freezed == stadium ? _self.stadium : stadium // ignore: cast_nullable_to_non_nullable
as StadiumDetailsModel?,detailsStatus: null == detailsStatus ? _self.detailsStatus : detailsStatus // ignore: cast_nullable_to_non_nullable
as StadiumProfileStatus,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<StadiumReviewModel>,reviewsPage: null == reviewsPage ? _self.reviewsPage : reviewsPage // ignore: cast_nullable_to_non_nullable
as int,hasMoreReviews: null == hasMoreReviews ? _self.hasMoreReviews : hasMoreReviews // ignore: cast_nullable_to_non_nullable
as bool,reviewsStatus: null == reviewsStatus ? _self.reviewsStatus : reviewsStatus // ignore: cast_nullable_to_non_nullable
as StadiumProfileStatus,selectedStars: null == selectedStars ? _self.selectedStars : selectedStars // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,rateSubmitStatus: null == rateSubmitStatus ? _self.rateSubmitStatus : rateSubmitStatus // ignore: cast_nullable_to_non_nullable
as StadiumProfileStatus,
  ));
}

/// Create a copy of StadiumProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StadiumProfileStatusCopyWith<$Res> get detailsStatus {
  
  return $StadiumProfileStatusCopyWith<$Res>(_self.detailsStatus, (value) {
    return _then(_self.copyWith(detailsStatus: value));
  });
}/// Create a copy of StadiumProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StadiumProfileStatusCopyWith<$Res> get reviewsStatus {
  
  return $StadiumProfileStatusCopyWith<$Res>(_self.reviewsStatus, (value) {
    return _then(_self.copyWith(reviewsStatus: value));
  });
}/// Create a copy of StadiumProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StadiumProfileStatusCopyWith<$Res> get rateSubmitStatus {
  
  return $StadiumProfileStatusCopyWith<$Res>(_self.rateSubmitStatus, (value) {
    return _then(_self.copyWith(rateSubmitStatus: value));
  });
}
}

/// @nodoc
mixin _$StadiumProfileStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StadiumProfileStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StadiumProfileStatus()';
}


}

/// @nodoc
class $StadiumProfileStatusCopyWith<$Res>  {
$StadiumProfileStatusCopyWith(StadiumProfileStatus _, $Res Function(StadiumProfileStatus) __);
}


/// Adds pattern-matching-related methods to [StadiumProfileStatus].
extension StadiumProfileStatusPatterns on StadiumProfileStatus {
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


class Initial implements StadiumProfileStatus {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StadiumProfileStatus.initial()';
}


}




/// @nodoc


class Loading implements StadiumProfileStatus {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StadiumProfileStatus.loading()';
}


}




/// @nodoc


class Error implements StadiumProfileStatus {
  const Error();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StadiumProfileStatus.error()';
}


}




/// @nodoc


class Success implements StadiumProfileStatus {
  const Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StadiumProfileStatus.success()';
}


}




// dart format on
