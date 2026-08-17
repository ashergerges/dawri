// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_challenges_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyChallengesState {

 MyChallengeTab get selectedTab;// ─── Tab counts (drive the badges) ───────────────────────────
 MyChallengeCounts? get counts;// ─── Tab 0 → status 1 (pending) ──────────────────────────────
 List<MyChallengeModel> get pending; int get pendingPage; bool get pendingHasMore; MyChallengesStatus get pendingStatus;// ─── Tab 1 → status 2 (upcoming) ─────────────────────────────
 List<MyChallengeModel> get upcoming; int get upcomingPage; bool get upcomingHasMore; MyChallengesStatus get upcomingStatus;// ─── Tab 2 → status 3 (ended) ────────────────────────────────
 List<MyChallengeModel> get ended; int get endedPage; bool get endedHasMore; MyChallengesStatus get endedStatus;// ─── Mutations ───────────────────────────────────────────────
 Set<int> get cancellingIds; bool get isSubmittingResult;// ─── Details screen ──────────────────────────────────────────
 MyChallengeModel? get details; MyChallengesStatus get detailsStatus;
/// Create a copy of MyChallengesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyChallengesStateCopyWith<MyChallengesState> get copyWith => _$MyChallengesStateCopyWithImpl<MyChallengesState>(this as MyChallengesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyChallengesState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.counts, counts) || other.counts == counts)&&const DeepCollectionEquality().equals(other.pending, pending)&&(identical(other.pendingPage, pendingPage) || other.pendingPage == pendingPage)&&(identical(other.pendingHasMore, pendingHasMore) || other.pendingHasMore == pendingHasMore)&&(identical(other.pendingStatus, pendingStatus) || other.pendingStatus == pendingStatus)&&const DeepCollectionEquality().equals(other.upcoming, upcoming)&&(identical(other.upcomingPage, upcomingPage) || other.upcomingPage == upcomingPage)&&(identical(other.upcomingHasMore, upcomingHasMore) || other.upcomingHasMore == upcomingHasMore)&&(identical(other.upcomingStatus, upcomingStatus) || other.upcomingStatus == upcomingStatus)&&const DeepCollectionEquality().equals(other.ended, ended)&&(identical(other.endedPage, endedPage) || other.endedPage == endedPage)&&(identical(other.endedHasMore, endedHasMore) || other.endedHasMore == endedHasMore)&&(identical(other.endedStatus, endedStatus) || other.endedStatus == endedStatus)&&const DeepCollectionEquality().equals(other.cancellingIds, cancellingIds)&&(identical(other.isSubmittingResult, isSubmittingResult) || other.isSubmittingResult == isSubmittingResult)&&(identical(other.details, details) || other.details == details)&&(identical(other.detailsStatus, detailsStatus) || other.detailsStatus == detailsStatus));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,counts,const DeepCollectionEquality().hash(pending),pendingPage,pendingHasMore,pendingStatus,const DeepCollectionEquality().hash(upcoming),upcomingPage,upcomingHasMore,upcomingStatus,const DeepCollectionEquality().hash(ended),endedPage,endedHasMore,endedStatus,const DeepCollectionEquality().hash(cancellingIds),isSubmittingResult,details,detailsStatus);

@override
String toString() {
  return 'MyChallengesState(selectedTab: $selectedTab, counts: $counts, pending: $pending, pendingPage: $pendingPage, pendingHasMore: $pendingHasMore, pendingStatus: $pendingStatus, upcoming: $upcoming, upcomingPage: $upcomingPage, upcomingHasMore: $upcomingHasMore, upcomingStatus: $upcomingStatus, ended: $ended, endedPage: $endedPage, endedHasMore: $endedHasMore, endedStatus: $endedStatus, cancellingIds: $cancellingIds, isSubmittingResult: $isSubmittingResult, details: $details, detailsStatus: $detailsStatus)';
}


}

/// @nodoc
abstract mixin class $MyChallengesStateCopyWith<$Res>  {
  factory $MyChallengesStateCopyWith(MyChallengesState value, $Res Function(MyChallengesState) _then) = _$MyChallengesStateCopyWithImpl;
@useResult
$Res call({
 MyChallengeTab selectedTab, MyChallengeCounts? counts, List<MyChallengeModel> pending, int pendingPage, bool pendingHasMore, MyChallengesStatus pendingStatus, List<MyChallengeModel> upcoming, int upcomingPage, bool upcomingHasMore, MyChallengesStatus upcomingStatus, List<MyChallengeModel> ended, int endedPage, bool endedHasMore, MyChallengesStatus endedStatus, Set<int> cancellingIds, bool isSubmittingResult, MyChallengeModel? details, MyChallengesStatus detailsStatus
});


$MyChallengesStatusCopyWith<$Res> get pendingStatus;$MyChallengesStatusCopyWith<$Res> get upcomingStatus;$MyChallengesStatusCopyWith<$Res> get endedStatus;$MyChallengesStatusCopyWith<$Res> get detailsStatus;

}
/// @nodoc
class _$MyChallengesStateCopyWithImpl<$Res>
    implements $MyChallengesStateCopyWith<$Res> {
  _$MyChallengesStateCopyWithImpl(this._self, this._then);

  final MyChallengesState _self;
  final $Res Function(MyChallengesState) _then;

/// Create a copy of MyChallengesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTab = null,Object? counts = freezed,Object? pending = null,Object? pendingPage = null,Object? pendingHasMore = null,Object? pendingStatus = null,Object? upcoming = null,Object? upcomingPage = null,Object? upcomingHasMore = null,Object? upcomingStatus = null,Object? ended = null,Object? endedPage = null,Object? endedHasMore = null,Object? endedStatus = null,Object? cancellingIds = null,Object? isSubmittingResult = null,Object? details = freezed,Object? detailsStatus = null,}) {
  return _then(_self.copyWith(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as MyChallengeTab,counts: freezed == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as MyChallengeCounts?,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as List<MyChallengeModel>,pendingPage: null == pendingPage ? _self.pendingPage : pendingPage // ignore: cast_nullable_to_non_nullable
as int,pendingHasMore: null == pendingHasMore ? _self.pendingHasMore : pendingHasMore // ignore: cast_nullable_to_non_nullable
as bool,pendingStatus: null == pendingStatus ? _self.pendingStatus : pendingStatus // ignore: cast_nullable_to_non_nullable
as MyChallengesStatus,upcoming: null == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as List<MyChallengeModel>,upcomingPage: null == upcomingPage ? _self.upcomingPage : upcomingPage // ignore: cast_nullable_to_non_nullable
as int,upcomingHasMore: null == upcomingHasMore ? _self.upcomingHasMore : upcomingHasMore // ignore: cast_nullable_to_non_nullable
as bool,upcomingStatus: null == upcomingStatus ? _self.upcomingStatus : upcomingStatus // ignore: cast_nullable_to_non_nullable
as MyChallengesStatus,ended: null == ended ? _self.ended : ended // ignore: cast_nullable_to_non_nullable
as List<MyChallengeModel>,endedPage: null == endedPage ? _self.endedPage : endedPage // ignore: cast_nullable_to_non_nullable
as int,endedHasMore: null == endedHasMore ? _self.endedHasMore : endedHasMore // ignore: cast_nullable_to_non_nullable
as bool,endedStatus: null == endedStatus ? _self.endedStatus : endedStatus // ignore: cast_nullable_to_non_nullable
as MyChallengesStatus,cancellingIds: null == cancellingIds ? _self.cancellingIds : cancellingIds // ignore: cast_nullable_to_non_nullable
as Set<int>,isSubmittingResult: null == isSubmittingResult ? _self.isSubmittingResult : isSubmittingResult // ignore: cast_nullable_to_non_nullable
as bool,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as MyChallengeModel?,detailsStatus: null == detailsStatus ? _self.detailsStatus : detailsStatus // ignore: cast_nullable_to_non_nullable
as MyChallengesStatus,
  ));
}
/// Create a copy of MyChallengesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChallengesStatusCopyWith<$Res> get pendingStatus {
  
  return $MyChallengesStatusCopyWith<$Res>(_self.pendingStatus, (value) {
    return _then(_self.copyWith(pendingStatus: value));
  });
}/// Create a copy of MyChallengesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChallengesStatusCopyWith<$Res> get upcomingStatus {
  
  return $MyChallengesStatusCopyWith<$Res>(_self.upcomingStatus, (value) {
    return _then(_self.copyWith(upcomingStatus: value));
  });
}/// Create a copy of MyChallengesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChallengesStatusCopyWith<$Res> get endedStatus {
  
  return $MyChallengesStatusCopyWith<$Res>(_self.endedStatus, (value) {
    return _then(_self.copyWith(endedStatus: value));
  });
}/// Create a copy of MyChallengesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChallengesStatusCopyWith<$Res> get detailsStatus {
  
  return $MyChallengesStatusCopyWith<$Res>(_self.detailsStatus, (value) {
    return _then(_self.copyWith(detailsStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyChallengesState].
extension MyChallengesStatePatterns on MyChallengesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyChallengesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyChallengesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyChallengesState value)  $default,){
final _that = this;
switch (_that) {
case _MyChallengesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyChallengesState value)?  $default,){
final _that = this;
switch (_that) {
case _MyChallengesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MyChallengeTab selectedTab,  MyChallengeCounts? counts,  List<MyChallengeModel> pending,  int pendingPage,  bool pendingHasMore,  MyChallengesStatus pendingStatus,  List<MyChallengeModel> upcoming,  int upcomingPage,  bool upcomingHasMore,  MyChallengesStatus upcomingStatus,  List<MyChallengeModel> ended,  int endedPage,  bool endedHasMore,  MyChallengesStatus endedStatus,  Set<int> cancellingIds,  bool isSubmittingResult,  MyChallengeModel? details,  MyChallengesStatus detailsStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyChallengesState() when $default != null:
return $default(_that.selectedTab,_that.counts,_that.pending,_that.pendingPage,_that.pendingHasMore,_that.pendingStatus,_that.upcoming,_that.upcomingPage,_that.upcomingHasMore,_that.upcomingStatus,_that.ended,_that.endedPage,_that.endedHasMore,_that.endedStatus,_that.cancellingIds,_that.isSubmittingResult,_that.details,_that.detailsStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MyChallengeTab selectedTab,  MyChallengeCounts? counts,  List<MyChallengeModel> pending,  int pendingPage,  bool pendingHasMore,  MyChallengesStatus pendingStatus,  List<MyChallengeModel> upcoming,  int upcomingPage,  bool upcomingHasMore,  MyChallengesStatus upcomingStatus,  List<MyChallengeModel> ended,  int endedPage,  bool endedHasMore,  MyChallengesStatus endedStatus,  Set<int> cancellingIds,  bool isSubmittingResult,  MyChallengeModel? details,  MyChallengesStatus detailsStatus)  $default,) {final _that = this;
switch (_that) {
case _MyChallengesState():
return $default(_that.selectedTab,_that.counts,_that.pending,_that.pendingPage,_that.pendingHasMore,_that.pendingStatus,_that.upcoming,_that.upcomingPage,_that.upcomingHasMore,_that.upcomingStatus,_that.ended,_that.endedPage,_that.endedHasMore,_that.endedStatus,_that.cancellingIds,_that.isSubmittingResult,_that.details,_that.detailsStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MyChallengeTab selectedTab,  MyChallengeCounts? counts,  List<MyChallengeModel> pending,  int pendingPage,  bool pendingHasMore,  MyChallengesStatus pendingStatus,  List<MyChallengeModel> upcoming,  int upcomingPage,  bool upcomingHasMore,  MyChallengesStatus upcomingStatus,  List<MyChallengeModel> ended,  int endedPage,  bool endedHasMore,  MyChallengesStatus endedStatus,  Set<int> cancellingIds,  bool isSubmittingResult,  MyChallengeModel? details,  MyChallengesStatus detailsStatus)?  $default,) {final _that = this;
switch (_that) {
case _MyChallengesState() when $default != null:
return $default(_that.selectedTab,_that.counts,_that.pending,_that.pendingPage,_that.pendingHasMore,_that.pendingStatus,_that.upcoming,_that.upcomingPage,_that.upcomingHasMore,_that.upcomingStatus,_that.ended,_that.endedPage,_that.endedHasMore,_that.endedStatus,_that.cancellingIds,_that.isSubmittingResult,_that.details,_that.detailsStatus);case _:
  return null;

}
}

}

/// @nodoc


class _MyChallengesState extends MyChallengesState {
  const _MyChallengesState({this.selectedTab = MyChallengeTab.pending, this.counts, final  List<MyChallengeModel> pending = const [], this.pendingPage = 1, this.pendingHasMore = true, this.pendingStatus = const MyChallengesStatus.initial(), final  List<MyChallengeModel> upcoming = const [], this.upcomingPage = 1, this.upcomingHasMore = true, this.upcomingStatus = const MyChallengesStatus.initial(), final  List<MyChallengeModel> ended = const [], this.endedPage = 1, this.endedHasMore = true, this.endedStatus = const MyChallengesStatus.initial(), final  Set<int> cancellingIds = const <int>{}, this.isSubmittingResult = false, this.details, this.detailsStatus = const MyChallengesStatus.initial()}): _pending = pending,_upcoming = upcoming,_ended = ended,_cancellingIds = cancellingIds,super._();
  

@override@JsonKey() final  MyChallengeTab selectedTab;
// ─── Tab counts (drive the badges) ───────────────────────────
@override final  MyChallengeCounts? counts;
// ─── Tab 0 → status 1 (pending) ──────────────────────────────
 final  List<MyChallengeModel> _pending;
// ─── Tab 0 → status 1 (pending) ──────────────────────────────
@override@JsonKey() List<MyChallengeModel> get pending {
  if (_pending is EqualUnmodifiableListView) return _pending;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pending);
}

@override@JsonKey() final  int pendingPage;
@override@JsonKey() final  bool pendingHasMore;
@override@JsonKey() final  MyChallengesStatus pendingStatus;
// ─── Tab 1 → status 2 (upcoming) ─────────────────────────────
 final  List<MyChallengeModel> _upcoming;
// ─── Tab 1 → status 2 (upcoming) ─────────────────────────────
@override@JsonKey() List<MyChallengeModel> get upcoming {
  if (_upcoming is EqualUnmodifiableListView) return _upcoming;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upcoming);
}

@override@JsonKey() final  int upcomingPage;
@override@JsonKey() final  bool upcomingHasMore;
@override@JsonKey() final  MyChallengesStatus upcomingStatus;
// ─── Tab 2 → status 3 (ended) ────────────────────────────────
 final  List<MyChallengeModel> _ended;
// ─── Tab 2 → status 3 (ended) ────────────────────────────────
@override@JsonKey() List<MyChallengeModel> get ended {
  if (_ended is EqualUnmodifiableListView) return _ended;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ended);
}

@override@JsonKey() final  int endedPage;
@override@JsonKey() final  bool endedHasMore;
@override@JsonKey() final  MyChallengesStatus endedStatus;
// ─── Mutations ───────────────────────────────────────────────
 final  Set<int> _cancellingIds;
// ─── Mutations ───────────────────────────────────────────────
@override@JsonKey() Set<int> get cancellingIds {
  if (_cancellingIds is EqualUnmodifiableSetView) return _cancellingIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_cancellingIds);
}

@override@JsonKey() final  bool isSubmittingResult;
// ─── Details screen ──────────────────────────────────────────
@override final  MyChallengeModel? details;
@override@JsonKey() final  MyChallengesStatus detailsStatus;

/// Create a copy of MyChallengesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyChallengesStateCopyWith<_MyChallengesState> get copyWith => __$MyChallengesStateCopyWithImpl<_MyChallengesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyChallengesState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.counts, counts) || other.counts == counts)&&const DeepCollectionEquality().equals(other._pending, _pending)&&(identical(other.pendingPage, pendingPage) || other.pendingPage == pendingPage)&&(identical(other.pendingHasMore, pendingHasMore) || other.pendingHasMore == pendingHasMore)&&(identical(other.pendingStatus, pendingStatus) || other.pendingStatus == pendingStatus)&&const DeepCollectionEquality().equals(other._upcoming, _upcoming)&&(identical(other.upcomingPage, upcomingPage) || other.upcomingPage == upcomingPage)&&(identical(other.upcomingHasMore, upcomingHasMore) || other.upcomingHasMore == upcomingHasMore)&&(identical(other.upcomingStatus, upcomingStatus) || other.upcomingStatus == upcomingStatus)&&const DeepCollectionEquality().equals(other._ended, _ended)&&(identical(other.endedPage, endedPage) || other.endedPage == endedPage)&&(identical(other.endedHasMore, endedHasMore) || other.endedHasMore == endedHasMore)&&(identical(other.endedStatus, endedStatus) || other.endedStatus == endedStatus)&&const DeepCollectionEquality().equals(other._cancellingIds, _cancellingIds)&&(identical(other.isSubmittingResult, isSubmittingResult) || other.isSubmittingResult == isSubmittingResult)&&(identical(other.details, details) || other.details == details)&&(identical(other.detailsStatus, detailsStatus) || other.detailsStatus == detailsStatus));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,counts,const DeepCollectionEquality().hash(_pending),pendingPage,pendingHasMore,pendingStatus,const DeepCollectionEquality().hash(_upcoming),upcomingPage,upcomingHasMore,upcomingStatus,const DeepCollectionEquality().hash(_ended),endedPage,endedHasMore,endedStatus,const DeepCollectionEquality().hash(_cancellingIds),isSubmittingResult,details,detailsStatus);

@override
String toString() {
  return 'MyChallengesState(selectedTab: $selectedTab, counts: $counts, pending: $pending, pendingPage: $pendingPage, pendingHasMore: $pendingHasMore, pendingStatus: $pendingStatus, upcoming: $upcoming, upcomingPage: $upcomingPage, upcomingHasMore: $upcomingHasMore, upcomingStatus: $upcomingStatus, ended: $ended, endedPage: $endedPage, endedHasMore: $endedHasMore, endedStatus: $endedStatus, cancellingIds: $cancellingIds, isSubmittingResult: $isSubmittingResult, details: $details, detailsStatus: $detailsStatus)';
}


}

/// @nodoc
abstract mixin class _$MyChallengesStateCopyWith<$Res> implements $MyChallengesStateCopyWith<$Res> {
  factory _$MyChallengesStateCopyWith(_MyChallengesState value, $Res Function(_MyChallengesState) _then) = __$MyChallengesStateCopyWithImpl;
@override @useResult
$Res call({
 MyChallengeTab selectedTab, MyChallengeCounts? counts, List<MyChallengeModel> pending, int pendingPage, bool pendingHasMore, MyChallengesStatus pendingStatus, List<MyChallengeModel> upcoming, int upcomingPage, bool upcomingHasMore, MyChallengesStatus upcomingStatus, List<MyChallengeModel> ended, int endedPage, bool endedHasMore, MyChallengesStatus endedStatus, Set<int> cancellingIds, bool isSubmittingResult, MyChallengeModel? details, MyChallengesStatus detailsStatus
});


@override $MyChallengesStatusCopyWith<$Res> get pendingStatus;@override $MyChallengesStatusCopyWith<$Res> get upcomingStatus;@override $MyChallengesStatusCopyWith<$Res> get endedStatus;@override $MyChallengesStatusCopyWith<$Res> get detailsStatus;

}
/// @nodoc
class __$MyChallengesStateCopyWithImpl<$Res>
    implements _$MyChallengesStateCopyWith<$Res> {
  __$MyChallengesStateCopyWithImpl(this._self, this._then);

  final _MyChallengesState _self;
  final $Res Function(_MyChallengesState) _then;

/// Create a copy of MyChallengesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,Object? counts = freezed,Object? pending = null,Object? pendingPage = null,Object? pendingHasMore = null,Object? pendingStatus = null,Object? upcoming = null,Object? upcomingPage = null,Object? upcomingHasMore = null,Object? upcomingStatus = null,Object? ended = null,Object? endedPage = null,Object? endedHasMore = null,Object? endedStatus = null,Object? cancellingIds = null,Object? isSubmittingResult = null,Object? details = freezed,Object? detailsStatus = null,}) {
  return _then(_MyChallengesState(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as MyChallengeTab,counts: freezed == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as MyChallengeCounts?,pending: null == pending ? _self._pending : pending // ignore: cast_nullable_to_non_nullable
as List<MyChallengeModel>,pendingPage: null == pendingPage ? _self.pendingPage : pendingPage // ignore: cast_nullable_to_non_nullable
as int,pendingHasMore: null == pendingHasMore ? _self.pendingHasMore : pendingHasMore // ignore: cast_nullable_to_non_nullable
as bool,pendingStatus: null == pendingStatus ? _self.pendingStatus : pendingStatus // ignore: cast_nullable_to_non_nullable
as MyChallengesStatus,upcoming: null == upcoming ? _self._upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as List<MyChallengeModel>,upcomingPage: null == upcomingPage ? _self.upcomingPage : upcomingPage // ignore: cast_nullable_to_non_nullable
as int,upcomingHasMore: null == upcomingHasMore ? _self.upcomingHasMore : upcomingHasMore // ignore: cast_nullable_to_non_nullable
as bool,upcomingStatus: null == upcomingStatus ? _self.upcomingStatus : upcomingStatus // ignore: cast_nullable_to_non_nullable
as MyChallengesStatus,ended: null == ended ? _self._ended : ended // ignore: cast_nullable_to_non_nullable
as List<MyChallengeModel>,endedPage: null == endedPage ? _self.endedPage : endedPage // ignore: cast_nullable_to_non_nullable
as int,endedHasMore: null == endedHasMore ? _self.endedHasMore : endedHasMore // ignore: cast_nullable_to_non_nullable
as bool,endedStatus: null == endedStatus ? _self.endedStatus : endedStatus // ignore: cast_nullable_to_non_nullable
as MyChallengesStatus,cancellingIds: null == cancellingIds ? _self._cancellingIds : cancellingIds // ignore: cast_nullable_to_non_nullable
as Set<int>,isSubmittingResult: null == isSubmittingResult ? _self.isSubmittingResult : isSubmittingResult // ignore: cast_nullable_to_non_nullable
as bool,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as MyChallengeModel?,detailsStatus: null == detailsStatus ? _self.detailsStatus : detailsStatus // ignore: cast_nullable_to_non_nullable
as MyChallengesStatus,
  ));
}

/// Create a copy of MyChallengesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChallengesStatusCopyWith<$Res> get pendingStatus {
  
  return $MyChallengesStatusCopyWith<$Res>(_self.pendingStatus, (value) {
    return _then(_self.copyWith(pendingStatus: value));
  });
}/// Create a copy of MyChallengesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChallengesStatusCopyWith<$Res> get upcomingStatus {
  
  return $MyChallengesStatusCopyWith<$Res>(_self.upcomingStatus, (value) {
    return _then(_self.copyWith(upcomingStatus: value));
  });
}/// Create a copy of MyChallengesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChallengesStatusCopyWith<$Res> get endedStatus {
  
  return $MyChallengesStatusCopyWith<$Res>(_self.endedStatus, (value) {
    return _then(_self.copyWith(endedStatus: value));
  });
}/// Create a copy of MyChallengesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyChallengesStatusCopyWith<$Res> get detailsStatus {
  
  return $MyChallengesStatusCopyWith<$Res>(_self.detailsStatus, (value) {
    return _then(_self.copyWith(detailsStatus: value));
  });
}
}

/// @nodoc
mixin _$MyChallengesStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyChallengesStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyChallengesStatus()';
}


}

/// @nodoc
class $MyChallengesStatusCopyWith<$Res>  {
$MyChallengesStatusCopyWith(MyChallengesStatus _, $Res Function(MyChallengesStatus) __);
}


/// Adds pattern-matching-related methods to [MyChallengesStatus].
extension MyChallengesStatusPatterns on MyChallengesStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MyChallengesStatusInitial value)?  initial,TResult Function( MyChallengesStatusLoading value)?  loading,TResult Function( MyChallengesStatusSuccess value)?  success,TResult Function( MyChallengesStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MyChallengesStatusInitial() when initial != null:
return initial(_that);case MyChallengesStatusLoading() when loading != null:
return loading(_that);case MyChallengesStatusSuccess() when success != null:
return success(_that);case MyChallengesStatusError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MyChallengesStatusInitial value)  initial,required TResult Function( MyChallengesStatusLoading value)  loading,required TResult Function( MyChallengesStatusSuccess value)  success,required TResult Function( MyChallengesStatusError value)  error,}){
final _that = this;
switch (_that) {
case MyChallengesStatusInitial():
return initial(_that);case MyChallengesStatusLoading():
return loading(_that);case MyChallengesStatusSuccess():
return success(_that);case MyChallengesStatusError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MyChallengesStatusInitial value)?  initial,TResult? Function( MyChallengesStatusLoading value)?  loading,TResult? Function( MyChallengesStatusSuccess value)?  success,TResult? Function( MyChallengesStatusError value)?  error,}){
final _that = this;
switch (_that) {
case MyChallengesStatusInitial() when initial != null:
return initial(_that);case MyChallengesStatusLoading() when loading != null:
return loading(_that);case MyChallengesStatusSuccess() when success != null:
return success(_that);case MyChallengesStatusError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MyChallengesStatusInitial() when initial != null:
return initial();case MyChallengesStatusLoading() when loading != null:
return loading();case MyChallengesStatusSuccess() when success != null:
return success();case MyChallengesStatusError() when error != null:
return error();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case MyChallengesStatusInitial():
return initial();case MyChallengesStatusLoading():
return loading();case MyChallengesStatusSuccess():
return success();case MyChallengesStatusError():
return error();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case MyChallengesStatusInitial() when initial != null:
return initial();case MyChallengesStatusLoading() when loading != null:
return loading();case MyChallengesStatusSuccess() when success != null:
return success();case MyChallengesStatusError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class MyChallengesStatusInitial implements MyChallengesStatus {
  const MyChallengesStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyChallengesStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyChallengesStatus.initial()';
}


}




/// @nodoc


class MyChallengesStatusLoading implements MyChallengesStatus {
  const MyChallengesStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyChallengesStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyChallengesStatus.loading()';
}


}




/// @nodoc


class MyChallengesStatusSuccess implements MyChallengesStatus {
  const MyChallengesStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyChallengesStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyChallengesStatus.success()';
}


}




/// @nodoc


class MyChallengesStatusError implements MyChallengesStatus {
  const MyChallengesStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyChallengesStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyChallengesStatus.error()';
}


}




// dart format on
