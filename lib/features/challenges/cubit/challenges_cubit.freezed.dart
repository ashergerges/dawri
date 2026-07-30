// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenges_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChallengesState {

 List<SportModel> get sports; int? get selectedSportId; List<ChallengeModel> get challenges; int get currentPage; bool get hasMore; ChallengesStatus get status; bool get isSubmitting; bool get isModalOpen; int? get activeChallengeId;
/// Create a copy of ChallengesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengesStateCopyWith<ChallengesState> get copyWith => _$ChallengesStateCopyWithImpl<ChallengesState>(this as ChallengesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengesState&&const DeepCollectionEquality().equals(other.sports, sports)&&(identical(other.selectedSportId, selectedSportId) || other.selectedSportId == selectedSportId)&&const DeepCollectionEquality().equals(other.challenges, challenges)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.status, status) || other.status == status)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isModalOpen, isModalOpen) || other.isModalOpen == isModalOpen)&&(identical(other.activeChallengeId, activeChallengeId) || other.activeChallengeId == activeChallengeId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sports),selectedSportId,const DeepCollectionEquality().hash(challenges),currentPage,hasMore,status,isSubmitting,isModalOpen,activeChallengeId);

@override
String toString() {
  return 'ChallengesState(sports: $sports, selectedSportId: $selectedSportId, challenges: $challenges, currentPage: $currentPage, hasMore: $hasMore, status: $status, isSubmitting: $isSubmitting, isModalOpen: $isModalOpen, activeChallengeId: $activeChallengeId)';
}


}

/// @nodoc
abstract mixin class $ChallengesStateCopyWith<$Res>  {
  factory $ChallengesStateCopyWith(ChallengesState value, $Res Function(ChallengesState) _then) = _$ChallengesStateCopyWithImpl;
@useResult
$Res call({
 List<SportModel> sports, int? selectedSportId, List<ChallengeModel> challenges, int currentPage, bool hasMore, ChallengesStatus status, bool isSubmitting, bool isModalOpen, int? activeChallengeId
});


$ChallengesStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$ChallengesStateCopyWithImpl<$Res>
    implements $ChallengesStateCopyWith<$Res> {
  _$ChallengesStateCopyWithImpl(this._self, this._then);

  final ChallengesState _self;
  final $Res Function(ChallengesState) _then;

/// Create a copy of ChallengesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sports = null,Object? selectedSportId = freezed,Object? challenges = null,Object? currentPage = null,Object? hasMore = null,Object? status = null,Object? isSubmitting = null,Object? isModalOpen = null,Object? activeChallengeId = freezed,}) {
  return _then(_self.copyWith(
sports: null == sports ? _self.sports : sports // ignore: cast_nullable_to_non_nullable
as List<SportModel>,selectedSportId: freezed == selectedSportId ? _self.selectedSportId : selectedSportId // ignore: cast_nullable_to_non_nullable
as int?,challenges: null == challenges ? _self.challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<ChallengeModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChallengesStatus,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isModalOpen: null == isModalOpen ? _self.isModalOpen : isModalOpen // ignore: cast_nullable_to_non_nullable
as bool,activeChallengeId: freezed == activeChallengeId ? _self.activeChallengeId : activeChallengeId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ChallengesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChallengesStatusCopyWith<$Res> get status {
  
  return $ChallengesStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChallengesState].
extension ChallengesStatePatterns on ChallengesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallengesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallengesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallengesState value)  $default,){
final _that = this;
switch (_that) {
case _ChallengesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallengesState value)?  $default,){
final _that = this;
switch (_that) {
case _ChallengesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SportModel> sports,  int? selectedSportId,  List<ChallengeModel> challenges,  int currentPage,  bool hasMore,  ChallengesStatus status,  bool isSubmitting,  bool isModalOpen,  int? activeChallengeId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallengesState() when $default != null:
return $default(_that.sports,_that.selectedSportId,_that.challenges,_that.currentPage,_that.hasMore,_that.status,_that.isSubmitting,_that.isModalOpen,_that.activeChallengeId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SportModel> sports,  int? selectedSportId,  List<ChallengeModel> challenges,  int currentPage,  bool hasMore,  ChallengesStatus status,  bool isSubmitting,  bool isModalOpen,  int? activeChallengeId)  $default,) {final _that = this;
switch (_that) {
case _ChallengesState():
return $default(_that.sports,_that.selectedSportId,_that.challenges,_that.currentPage,_that.hasMore,_that.status,_that.isSubmitting,_that.isModalOpen,_that.activeChallengeId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SportModel> sports,  int? selectedSportId,  List<ChallengeModel> challenges,  int currentPage,  bool hasMore,  ChallengesStatus status,  bool isSubmitting,  bool isModalOpen,  int? activeChallengeId)?  $default,) {final _that = this;
switch (_that) {
case _ChallengesState() when $default != null:
return $default(_that.sports,_that.selectedSportId,_that.challenges,_that.currentPage,_that.hasMore,_that.status,_that.isSubmitting,_that.isModalOpen,_that.activeChallengeId);case _:
  return null;

}
}

}

/// @nodoc


class _ChallengesState implements ChallengesState {
  const _ChallengesState({final  List<SportModel> sports = const [], this.selectedSportId, final  List<ChallengeModel> challenges = const [], this.currentPage = 1, this.hasMore = false, this.status = const ChallengesStatus.initial(), this.isSubmitting = false, this.isModalOpen = false, this.activeChallengeId}): _sports = sports,_challenges = challenges;
  

 final  List<SportModel> _sports;
@override@JsonKey() List<SportModel> get sports {
  if (_sports is EqualUnmodifiableListView) return _sports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sports);
}

@override final  int? selectedSportId;
 final  List<ChallengeModel> _challenges;
@override@JsonKey() List<ChallengeModel> get challenges {
  if (_challenges is EqualUnmodifiableListView) return _challenges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_challenges);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  ChallengesStatus status;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isModalOpen;
@override final  int? activeChallengeId;

/// Create a copy of ChallengesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengesStateCopyWith<_ChallengesState> get copyWith => __$ChallengesStateCopyWithImpl<_ChallengesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengesState&&const DeepCollectionEquality().equals(other._sports, _sports)&&(identical(other.selectedSportId, selectedSportId) || other.selectedSportId == selectedSportId)&&const DeepCollectionEquality().equals(other._challenges, _challenges)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.status, status) || other.status == status)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isModalOpen, isModalOpen) || other.isModalOpen == isModalOpen)&&(identical(other.activeChallengeId, activeChallengeId) || other.activeChallengeId == activeChallengeId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sports),selectedSportId,const DeepCollectionEquality().hash(_challenges),currentPage,hasMore,status,isSubmitting,isModalOpen,activeChallengeId);

@override
String toString() {
  return 'ChallengesState(sports: $sports, selectedSportId: $selectedSportId, challenges: $challenges, currentPage: $currentPage, hasMore: $hasMore, status: $status, isSubmitting: $isSubmitting, isModalOpen: $isModalOpen, activeChallengeId: $activeChallengeId)';
}


}

/// @nodoc
abstract mixin class _$ChallengesStateCopyWith<$Res> implements $ChallengesStateCopyWith<$Res> {
  factory _$ChallengesStateCopyWith(_ChallengesState value, $Res Function(_ChallengesState) _then) = __$ChallengesStateCopyWithImpl;
@override @useResult
$Res call({
 List<SportModel> sports, int? selectedSportId, List<ChallengeModel> challenges, int currentPage, bool hasMore, ChallengesStatus status, bool isSubmitting, bool isModalOpen, int? activeChallengeId
});


@override $ChallengesStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$ChallengesStateCopyWithImpl<$Res>
    implements _$ChallengesStateCopyWith<$Res> {
  __$ChallengesStateCopyWithImpl(this._self, this._then);

  final _ChallengesState _self;
  final $Res Function(_ChallengesState) _then;

/// Create a copy of ChallengesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sports = null,Object? selectedSportId = freezed,Object? challenges = null,Object? currentPage = null,Object? hasMore = null,Object? status = null,Object? isSubmitting = null,Object? isModalOpen = null,Object? activeChallengeId = freezed,}) {
  return _then(_ChallengesState(
sports: null == sports ? _self._sports : sports // ignore: cast_nullable_to_non_nullable
as List<SportModel>,selectedSportId: freezed == selectedSportId ? _self.selectedSportId : selectedSportId // ignore: cast_nullable_to_non_nullable
as int?,challenges: null == challenges ? _self._challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<ChallengeModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChallengesStatus,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isModalOpen: null == isModalOpen ? _self.isModalOpen : isModalOpen // ignore: cast_nullable_to_non_nullable
as bool,activeChallengeId: freezed == activeChallengeId ? _self.activeChallengeId : activeChallengeId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ChallengesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChallengesStatusCopyWith<$Res> get status {
  
  return $ChallengesStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

/// @nodoc
mixin _$ChallengesStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengesStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChallengesStatus()';
}


}

/// @nodoc
class $ChallengesStatusCopyWith<$Res>  {
$ChallengesStatusCopyWith(ChallengesStatus _, $Res Function(ChallengesStatus) __);
}


/// Adds pattern-matching-related methods to [ChallengesStatus].
extension ChallengesStatusPatterns on ChallengesStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChallengesStatusInitial value)?  initial,TResult Function( ChallengesStatusLoading value)?  loading,TResult Function( ChallengesStatusLoadingAccept value)?  loadingAccept,TResult Function( ChallengesStatusLoadingMore value)?  loadingMore,TResult Function( ChallengesStatusSuccess value)?  success,TResult Function( ChallengesStatusError value)?  error,TResult Function( ChallengesStatusEmpty value)?  empty,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChallengesStatusInitial() when initial != null:
return initial(_that);case ChallengesStatusLoading() when loading != null:
return loading(_that);case ChallengesStatusLoadingAccept() when loadingAccept != null:
return loadingAccept(_that);case ChallengesStatusLoadingMore() when loadingMore != null:
return loadingMore(_that);case ChallengesStatusSuccess() when success != null:
return success(_that);case ChallengesStatusError() when error != null:
return error(_that);case ChallengesStatusEmpty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChallengesStatusInitial value)  initial,required TResult Function( ChallengesStatusLoading value)  loading,required TResult Function( ChallengesStatusLoadingAccept value)  loadingAccept,required TResult Function( ChallengesStatusLoadingMore value)  loadingMore,required TResult Function( ChallengesStatusSuccess value)  success,required TResult Function( ChallengesStatusError value)  error,required TResult Function( ChallengesStatusEmpty value)  empty,}){
final _that = this;
switch (_that) {
case ChallengesStatusInitial():
return initial(_that);case ChallengesStatusLoading():
return loading(_that);case ChallengesStatusLoadingAccept():
return loadingAccept(_that);case ChallengesStatusLoadingMore():
return loadingMore(_that);case ChallengesStatusSuccess():
return success(_that);case ChallengesStatusError():
return error(_that);case ChallengesStatusEmpty():
return empty(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChallengesStatusInitial value)?  initial,TResult? Function( ChallengesStatusLoading value)?  loading,TResult? Function( ChallengesStatusLoadingAccept value)?  loadingAccept,TResult? Function( ChallengesStatusLoadingMore value)?  loadingMore,TResult? Function( ChallengesStatusSuccess value)?  success,TResult? Function( ChallengesStatusError value)?  error,TResult? Function( ChallengesStatusEmpty value)?  empty,}){
final _that = this;
switch (_that) {
case ChallengesStatusInitial() when initial != null:
return initial(_that);case ChallengesStatusLoading() when loading != null:
return loading(_that);case ChallengesStatusLoadingAccept() when loadingAccept != null:
return loadingAccept(_that);case ChallengesStatusLoadingMore() when loadingMore != null:
return loadingMore(_that);case ChallengesStatusSuccess() when success != null:
return success(_that);case ChallengesStatusError() when error != null:
return error(_that);case ChallengesStatusEmpty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  loadingAccept,TResult Function()?  loadingMore,TResult Function()?  success,TResult Function()?  error,TResult Function()?  empty,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChallengesStatusInitial() when initial != null:
return initial();case ChallengesStatusLoading() when loading != null:
return loading();case ChallengesStatusLoadingAccept() when loadingAccept != null:
return loadingAccept();case ChallengesStatusLoadingMore() when loadingMore != null:
return loadingMore();case ChallengesStatusSuccess() when success != null:
return success();case ChallengesStatusError() when error != null:
return error();case ChallengesStatusEmpty() when empty != null:
return empty();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  loadingAccept,required TResult Function()  loadingMore,required TResult Function()  success,required TResult Function()  error,required TResult Function()  empty,}) {final _that = this;
switch (_that) {
case ChallengesStatusInitial():
return initial();case ChallengesStatusLoading():
return loading();case ChallengesStatusLoadingAccept():
return loadingAccept();case ChallengesStatusLoadingMore():
return loadingMore();case ChallengesStatusSuccess():
return success();case ChallengesStatusError():
return error();case ChallengesStatusEmpty():
return empty();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  loadingAccept,TResult? Function()?  loadingMore,TResult? Function()?  success,TResult? Function()?  error,TResult? Function()?  empty,}) {final _that = this;
switch (_that) {
case ChallengesStatusInitial() when initial != null:
return initial();case ChallengesStatusLoading() when loading != null:
return loading();case ChallengesStatusLoadingAccept() when loadingAccept != null:
return loadingAccept();case ChallengesStatusLoadingMore() when loadingMore != null:
return loadingMore();case ChallengesStatusSuccess() when success != null:
return success();case ChallengesStatusError() when error != null:
return error();case ChallengesStatusEmpty() when empty != null:
return empty();case _:
  return null;

}
}

}

/// @nodoc


class ChallengesStatusInitial implements ChallengesStatus {
  const ChallengesStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengesStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChallengesStatus.initial()';
}


}




/// @nodoc


class ChallengesStatusLoading implements ChallengesStatus {
  const ChallengesStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengesStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChallengesStatus.loading()';
}


}




/// @nodoc


class ChallengesStatusLoadingAccept implements ChallengesStatus {
  const ChallengesStatusLoadingAccept();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengesStatusLoadingAccept);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChallengesStatus.loadingAccept()';
}


}




/// @nodoc


class ChallengesStatusLoadingMore implements ChallengesStatus {
  const ChallengesStatusLoadingMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengesStatusLoadingMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChallengesStatus.loadingMore()';
}


}




/// @nodoc


class ChallengesStatusSuccess implements ChallengesStatus {
  const ChallengesStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengesStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChallengesStatus.success()';
}


}




/// @nodoc


class ChallengesStatusError implements ChallengesStatus {
  const ChallengesStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengesStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChallengesStatus.error()';
}


}




/// @nodoc


class ChallengesStatusEmpty implements ChallengesStatus {
  const ChallengesStatusEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengesStatusEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChallengesStatus.empty()';
}


}




// dart format on
