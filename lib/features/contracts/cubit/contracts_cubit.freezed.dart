// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contracts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractsState {

 int get selectedTabIndex;// ─── Summary (independent of the tabs) ───────────────────
 ContractsSummaryModel? get summary; ContractsStatus get summaryStatus;// ─── Pending (status = 1) ────────────────────────────────
 List<ContractModel> get pendingContracts; int get pendingPage; ContractsPaginationModel? get pendingPagination; ContractsStatus get pendingStatus;// ─── Active (status = 2) ─────────────────────────────────
 List<ContractModel> get activeContracts; int get activePage; ContractsPaginationModel? get activePagination; ContractsStatus get activeStatus;// ─── Rejected (status = 3) ───────────────────────────────
 List<ContractModel> get rejectedContracts; int get rejectedPage; ContractsPaginationModel? get rejectedPagination; ContractsStatus get rejectedStatus;// ─── Accept / reject request ─────────────────────────────
 ContractsStatus get responseStatus; int? get respondingContractId;
/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractsStateCopyWith<ContractsState> get copyWith => _$ContractsStateCopyWithImpl<ContractsState>(this as ContractsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractsState&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.summaryStatus, summaryStatus) || other.summaryStatus == summaryStatus)&&const DeepCollectionEquality().equals(other.pendingContracts, pendingContracts)&&(identical(other.pendingPage, pendingPage) || other.pendingPage == pendingPage)&&(identical(other.pendingPagination, pendingPagination) || other.pendingPagination == pendingPagination)&&(identical(other.pendingStatus, pendingStatus) || other.pendingStatus == pendingStatus)&&const DeepCollectionEquality().equals(other.activeContracts, activeContracts)&&(identical(other.activePage, activePage) || other.activePage == activePage)&&(identical(other.activePagination, activePagination) || other.activePagination == activePagination)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&const DeepCollectionEquality().equals(other.rejectedContracts, rejectedContracts)&&(identical(other.rejectedPage, rejectedPage) || other.rejectedPage == rejectedPage)&&(identical(other.rejectedPagination, rejectedPagination) || other.rejectedPagination == rejectedPagination)&&(identical(other.rejectedStatus, rejectedStatus) || other.rejectedStatus == rejectedStatus)&&(identical(other.responseStatus, responseStatus) || other.responseStatus == responseStatus)&&(identical(other.respondingContractId, respondingContractId) || other.respondingContractId == respondingContractId));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTabIndex,summary,summaryStatus,const DeepCollectionEquality().hash(pendingContracts),pendingPage,pendingPagination,pendingStatus,const DeepCollectionEquality().hash(activeContracts),activePage,activePagination,activeStatus,const DeepCollectionEquality().hash(rejectedContracts),rejectedPage,rejectedPagination,rejectedStatus,responseStatus,respondingContractId);

@override
String toString() {
  return 'ContractsState(selectedTabIndex: $selectedTabIndex, summary: $summary, summaryStatus: $summaryStatus, pendingContracts: $pendingContracts, pendingPage: $pendingPage, pendingPagination: $pendingPagination, pendingStatus: $pendingStatus, activeContracts: $activeContracts, activePage: $activePage, activePagination: $activePagination, activeStatus: $activeStatus, rejectedContracts: $rejectedContracts, rejectedPage: $rejectedPage, rejectedPagination: $rejectedPagination, rejectedStatus: $rejectedStatus, responseStatus: $responseStatus, respondingContractId: $respondingContractId)';
}


}

/// @nodoc
abstract mixin class $ContractsStateCopyWith<$Res>  {
  factory $ContractsStateCopyWith(ContractsState value, $Res Function(ContractsState) _then) = _$ContractsStateCopyWithImpl;
@useResult
$Res call({
 int selectedTabIndex, ContractsSummaryModel? summary, ContractsStatus summaryStatus, List<ContractModel> pendingContracts, int pendingPage, ContractsPaginationModel? pendingPagination, ContractsStatus pendingStatus, List<ContractModel> activeContracts, int activePage, ContractsPaginationModel? activePagination, ContractsStatus activeStatus, List<ContractModel> rejectedContracts, int rejectedPage, ContractsPaginationModel? rejectedPagination, ContractsStatus rejectedStatus, ContractsStatus responseStatus, int? respondingContractId
});


$ContractsStatusCopyWith<$Res> get summaryStatus;$ContractsStatusCopyWith<$Res> get pendingStatus;$ContractsStatusCopyWith<$Res> get activeStatus;$ContractsStatusCopyWith<$Res> get rejectedStatus;$ContractsStatusCopyWith<$Res> get responseStatus;

}
/// @nodoc
class _$ContractsStateCopyWithImpl<$Res>
    implements $ContractsStateCopyWith<$Res> {
  _$ContractsStateCopyWithImpl(this._self, this._then);

  final ContractsState _self;
  final $Res Function(ContractsState) _then;

/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTabIndex = null,Object? summary = freezed,Object? summaryStatus = null,Object? pendingContracts = null,Object? pendingPage = null,Object? pendingPagination = freezed,Object? pendingStatus = null,Object? activeContracts = null,Object? activePage = null,Object? activePagination = freezed,Object? activeStatus = null,Object? rejectedContracts = null,Object? rejectedPage = null,Object? rejectedPagination = freezed,Object? rejectedStatus = null,Object? responseStatus = null,Object? respondingContractId = freezed,}) {
  return _then(_self.copyWith(
selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ContractsSummaryModel?,summaryStatus: null == summaryStatus ? _self.summaryStatus : summaryStatus // ignore: cast_nullable_to_non_nullable
as ContractsStatus,pendingContracts: null == pendingContracts ? _self.pendingContracts : pendingContracts // ignore: cast_nullable_to_non_nullable
as List<ContractModel>,pendingPage: null == pendingPage ? _self.pendingPage : pendingPage // ignore: cast_nullable_to_non_nullable
as int,pendingPagination: freezed == pendingPagination ? _self.pendingPagination : pendingPagination // ignore: cast_nullable_to_non_nullable
as ContractsPaginationModel?,pendingStatus: null == pendingStatus ? _self.pendingStatus : pendingStatus // ignore: cast_nullable_to_non_nullable
as ContractsStatus,activeContracts: null == activeContracts ? _self.activeContracts : activeContracts // ignore: cast_nullable_to_non_nullable
as List<ContractModel>,activePage: null == activePage ? _self.activePage : activePage // ignore: cast_nullable_to_non_nullable
as int,activePagination: freezed == activePagination ? _self.activePagination : activePagination // ignore: cast_nullable_to_non_nullable
as ContractsPaginationModel?,activeStatus: null == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as ContractsStatus,rejectedContracts: null == rejectedContracts ? _self.rejectedContracts : rejectedContracts // ignore: cast_nullable_to_non_nullable
as List<ContractModel>,rejectedPage: null == rejectedPage ? _self.rejectedPage : rejectedPage // ignore: cast_nullable_to_non_nullable
as int,rejectedPagination: freezed == rejectedPagination ? _self.rejectedPagination : rejectedPagination // ignore: cast_nullable_to_non_nullable
as ContractsPaginationModel?,rejectedStatus: null == rejectedStatus ? _self.rejectedStatus : rejectedStatus // ignore: cast_nullable_to_non_nullable
as ContractsStatus,responseStatus: null == responseStatus ? _self.responseStatus : responseStatus // ignore: cast_nullable_to_non_nullable
as ContractsStatus,respondingContractId: freezed == respondingContractId ? _self.respondingContractId : respondingContractId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractsStatusCopyWith<$Res> get summaryStatus {
  
  return $ContractsStatusCopyWith<$Res>(_self.summaryStatus, (value) {
    return _then(_self.copyWith(summaryStatus: value));
  });
}/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractsStatusCopyWith<$Res> get pendingStatus {
  
  return $ContractsStatusCopyWith<$Res>(_self.pendingStatus, (value) {
    return _then(_self.copyWith(pendingStatus: value));
  });
}/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractsStatusCopyWith<$Res> get activeStatus {
  
  return $ContractsStatusCopyWith<$Res>(_self.activeStatus, (value) {
    return _then(_self.copyWith(activeStatus: value));
  });
}/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractsStatusCopyWith<$Res> get rejectedStatus {
  
  return $ContractsStatusCopyWith<$Res>(_self.rejectedStatus, (value) {
    return _then(_self.copyWith(rejectedStatus: value));
  });
}/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractsStatusCopyWith<$Res> get responseStatus {
  
  return $ContractsStatusCopyWith<$Res>(_self.responseStatus, (value) {
    return _then(_self.copyWith(responseStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContractsState].
extension ContractsStatePatterns on ContractsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractsState value)  $default,){
final _that = this;
switch (_that) {
case _ContractsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractsState value)?  $default,){
final _that = this;
switch (_that) {
case _ContractsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int selectedTabIndex,  ContractsSummaryModel? summary,  ContractsStatus summaryStatus,  List<ContractModel> pendingContracts,  int pendingPage,  ContractsPaginationModel? pendingPagination,  ContractsStatus pendingStatus,  List<ContractModel> activeContracts,  int activePage,  ContractsPaginationModel? activePagination,  ContractsStatus activeStatus,  List<ContractModel> rejectedContracts,  int rejectedPage,  ContractsPaginationModel? rejectedPagination,  ContractsStatus rejectedStatus,  ContractsStatus responseStatus,  int? respondingContractId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractsState() when $default != null:
return $default(_that.selectedTabIndex,_that.summary,_that.summaryStatus,_that.pendingContracts,_that.pendingPage,_that.pendingPagination,_that.pendingStatus,_that.activeContracts,_that.activePage,_that.activePagination,_that.activeStatus,_that.rejectedContracts,_that.rejectedPage,_that.rejectedPagination,_that.rejectedStatus,_that.responseStatus,_that.respondingContractId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int selectedTabIndex,  ContractsSummaryModel? summary,  ContractsStatus summaryStatus,  List<ContractModel> pendingContracts,  int pendingPage,  ContractsPaginationModel? pendingPagination,  ContractsStatus pendingStatus,  List<ContractModel> activeContracts,  int activePage,  ContractsPaginationModel? activePagination,  ContractsStatus activeStatus,  List<ContractModel> rejectedContracts,  int rejectedPage,  ContractsPaginationModel? rejectedPagination,  ContractsStatus rejectedStatus,  ContractsStatus responseStatus,  int? respondingContractId)  $default,) {final _that = this;
switch (_that) {
case _ContractsState():
return $default(_that.selectedTabIndex,_that.summary,_that.summaryStatus,_that.pendingContracts,_that.pendingPage,_that.pendingPagination,_that.pendingStatus,_that.activeContracts,_that.activePage,_that.activePagination,_that.activeStatus,_that.rejectedContracts,_that.rejectedPage,_that.rejectedPagination,_that.rejectedStatus,_that.responseStatus,_that.respondingContractId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int selectedTabIndex,  ContractsSummaryModel? summary,  ContractsStatus summaryStatus,  List<ContractModel> pendingContracts,  int pendingPage,  ContractsPaginationModel? pendingPagination,  ContractsStatus pendingStatus,  List<ContractModel> activeContracts,  int activePage,  ContractsPaginationModel? activePagination,  ContractsStatus activeStatus,  List<ContractModel> rejectedContracts,  int rejectedPage,  ContractsPaginationModel? rejectedPagination,  ContractsStatus rejectedStatus,  ContractsStatus responseStatus,  int? respondingContractId)?  $default,) {final _that = this;
switch (_that) {
case _ContractsState() when $default != null:
return $default(_that.selectedTabIndex,_that.summary,_that.summaryStatus,_that.pendingContracts,_that.pendingPage,_that.pendingPagination,_that.pendingStatus,_that.activeContracts,_that.activePage,_that.activePagination,_that.activeStatus,_that.rejectedContracts,_that.rejectedPage,_that.rejectedPagination,_that.rejectedStatus,_that.responseStatus,_that.respondingContractId);case _:
  return null;

}
}

}

/// @nodoc


class _ContractsState extends ContractsState {
  const _ContractsState({this.selectedTabIndex = 0, this.summary, this.summaryStatus = const ContractsStatus.initial(), final  List<ContractModel> pendingContracts = const [], this.pendingPage = 1, this.pendingPagination, this.pendingStatus = const ContractsStatus.initial(), final  List<ContractModel> activeContracts = const [], this.activePage = 1, this.activePagination, this.activeStatus = const ContractsStatus.initial(), final  List<ContractModel> rejectedContracts = const [], this.rejectedPage = 1, this.rejectedPagination, this.rejectedStatus = const ContractsStatus.initial(), this.responseStatus = const ContractsStatus.initial(), this.respondingContractId}): _pendingContracts = pendingContracts,_activeContracts = activeContracts,_rejectedContracts = rejectedContracts,super._();
  

@override@JsonKey() final  int selectedTabIndex;
// ─── Summary (independent of the tabs) ───────────────────
@override final  ContractsSummaryModel? summary;
@override@JsonKey() final  ContractsStatus summaryStatus;
// ─── Pending (status = 1) ────────────────────────────────
 final  List<ContractModel> _pendingContracts;
// ─── Pending (status = 1) ────────────────────────────────
@override@JsonKey() List<ContractModel> get pendingContracts {
  if (_pendingContracts is EqualUnmodifiableListView) return _pendingContracts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pendingContracts);
}

@override@JsonKey() final  int pendingPage;
@override final  ContractsPaginationModel? pendingPagination;
@override@JsonKey() final  ContractsStatus pendingStatus;
// ─── Active (status = 2) ─────────────────────────────────
 final  List<ContractModel> _activeContracts;
// ─── Active (status = 2) ─────────────────────────────────
@override@JsonKey() List<ContractModel> get activeContracts {
  if (_activeContracts is EqualUnmodifiableListView) return _activeContracts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeContracts);
}

@override@JsonKey() final  int activePage;
@override final  ContractsPaginationModel? activePagination;
@override@JsonKey() final  ContractsStatus activeStatus;
// ─── Rejected (status = 3) ───────────────────────────────
 final  List<ContractModel> _rejectedContracts;
// ─── Rejected (status = 3) ───────────────────────────────
@override@JsonKey() List<ContractModel> get rejectedContracts {
  if (_rejectedContracts is EqualUnmodifiableListView) return _rejectedContracts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rejectedContracts);
}

@override@JsonKey() final  int rejectedPage;
@override final  ContractsPaginationModel? rejectedPagination;
@override@JsonKey() final  ContractsStatus rejectedStatus;
// ─── Accept / reject request ─────────────────────────────
@override@JsonKey() final  ContractsStatus responseStatus;
@override final  int? respondingContractId;

/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractsStateCopyWith<_ContractsState> get copyWith => __$ContractsStateCopyWithImpl<_ContractsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractsState&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.summaryStatus, summaryStatus) || other.summaryStatus == summaryStatus)&&const DeepCollectionEquality().equals(other._pendingContracts, _pendingContracts)&&(identical(other.pendingPage, pendingPage) || other.pendingPage == pendingPage)&&(identical(other.pendingPagination, pendingPagination) || other.pendingPagination == pendingPagination)&&(identical(other.pendingStatus, pendingStatus) || other.pendingStatus == pendingStatus)&&const DeepCollectionEquality().equals(other._activeContracts, _activeContracts)&&(identical(other.activePage, activePage) || other.activePage == activePage)&&(identical(other.activePagination, activePagination) || other.activePagination == activePagination)&&(identical(other.activeStatus, activeStatus) || other.activeStatus == activeStatus)&&const DeepCollectionEquality().equals(other._rejectedContracts, _rejectedContracts)&&(identical(other.rejectedPage, rejectedPage) || other.rejectedPage == rejectedPage)&&(identical(other.rejectedPagination, rejectedPagination) || other.rejectedPagination == rejectedPagination)&&(identical(other.rejectedStatus, rejectedStatus) || other.rejectedStatus == rejectedStatus)&&(identical(other.responseStatus, responseStatus) || other.responseStatus == responseStatus)&&(identical(other.respondingContractId, respondingContractId) || other.respondingContractId == respondingContractId));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTabIndex,summary,summaryStatus,const DeepCollectionEquality().hash(_pendingContracts),pendingPage,pendingPagination,pendingStatus,const DeepCollectionEquality().hash(_activeContracts),activePage,activePagination,activeStatus,const DeepCollectionEquality().hash(_rejectedContracts),rejectedPage,rejectedPagination,rejectedStatus,responseStatus,respondingContractId);

@override
String toString() {
  return 'ContractsState(selectedTabIndex: $selectedTabIndex, summary: $summary, summaryStatus: $summaryStatus, pendingContracts: $pendingContracts, pendingPage: $pendingPage, pendingPagination: $pendingPagination, pendingStatus: $pendingStatus, activeContracts: $activeContracts, activePage: $activePage, activePagination: $activePagination, activeStatus: $activeStatus, rejectedContracts: $rejectedContracts, rejectedPage: $rejectedPage, rejectedPagination: $rejectedPagination, rejectedStatus: $rejectedStatus, responseStatus: $responseStatus, respondingContractId: $respondingContractId)';
}


}

/// @nodoc
abstract mixin class _$ContractsStateCopyWith<$Res> implements $ContractsStateCopyWith<$Res> {
  factory _$ContractsStateCopyWith(_ContractsState value, $Res Function(_ContractsState) _then) = __$ContractsStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedTabIndex, ContractsSummaryModel? summary, ContractsStatus summaryStatus, List<ContractModel> pendingContracts, int pendingPage, ContractsPaginationModel? pendingPagination, ContractsStatus pendingStatus, List<ContractModel> activeContracts, int activePage, ContractsPaginationModel? activePagination, ContractsStatus activeStatus, List<ContractModel> rejectedContracts, int rejectedPage, ContractsPaginationModel? rejectedPagination, ContractsStatus rejectedStatus, ContractsStatus responseStatus, int? respondingContractId
});


@override $ContractsStatusCopyWith<$Res> get summaryStatus;@override $ContractsStatusCopyWith<$Res> get pendingStatus;@override $ContractsStatusCopyWith<$Res> get activeStatus;@override $ContractsStatusCopyWith<$Res> get rejectedStatus;@override $ContractsStatusCopyWith<$Res> get responseStatus;

}
/// @nodoc
class __$ContractsStateCopyWithImpl<$Res>
    implements _$ContractsStateCopyWith<$Res> {
  __$ContractsStateCopyWithImpl(this._self, this._then);

  final _ContractsState _self;
  final $Res Function(_ContractsState) _then;

/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTabIndex = null,Object? summary = freezed,Object? summaryStatus = null,Object? pendingContracts = null,Object? pendingPage = null,Object? pendingPagination = freezed,Object? pendingStatus = null,Object? activeContracts = null,Object? activePage = null,Object? activePagination = freezed,Object? activeStatus = null,Object? rejectedContracts = null,Object? rejectedPage = null,Object? rejectedPagination = freezed,Object? rejectedStatus = null,Object? responseStatus = null,Object? respondingContractId = freezed,}) {
  return _then(_ContractsState(
selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ContractsSummaryModel?,summaryStatus: null == summaryStatus ? _self.summaryStatus : summaryStatus // ignore: cast_nullable_to_non_nullable
as ContractsStatus,pendingContracts: null == pendingContracts ? _self._pendingContracts : pendingContracts // ignore: cast_nullable_to_non_nullable
as List<ContractModel>,pendingPage: null == pendingPage ? _self.pendingPage : pendingPage // ignore: cast_nullable_to_non_nullable
as int,pendingPagination: freezed == pendingPagination ? _self.pendingPagination : pendingPagination // ignore: cast_nullable_to_non_nullable
as ContractsPaginationModel?,pendingStatus: null == pendingStatus ? _self.pendingStatus : pendingStatus // ignore: cast_nullable_to_non_nullable
as ContractsStatus,activeContracts: null == activeContracts ? _self._activeContracts : activeContracts // ignore: cast_nullable_to_non_nullable
as List<ContractModel>,activePage: null == activePage ? _self.activePage : activePage // ignore: cast_nullable_to_non_nullable
as int,activePagination: freezed == activePagination ? _self.activePagination : activePagination // ignore: cast_nullable_to_non_nullable
as ContractsPaginationModel?,activeStatus: null == activeStatus ? _self.activeStatus : activeStatus // ignore: cast_nullable_to_non_nullable
as ContractsStatus,rejectedContracts: null == rejectedContracts ? _self._rejectedContracts : rejectedContracts // ignore: cast_nullable_to_non_nullable
as List<ContractModel>,rejectedPage: null == rejectedPage ? _self.rejectedPage : rejectedPage // ignore: cast_nullable_to_non_nullable
as int,rejectedPagination: freezed == rejectedPagination ? _self.rejectedPagination : rejectedPagination // ignore: cast_nullable_to_non_nullable
as ContractsPaginationModel?,rejectedStatus: null == rejectedStatus ? _self.rejectedStatus : rejectedStatus // ignore: cast_nullable_to_non_nullable
as ContractsStatus,responseStatus: null == responseStatus ? _self.responseStatus : responseStatus // ignore: cast_nullable_to_non_nullable
as ContractsStatus,respondingContractId: freezed == respondingContractId ? _self.respondingContractId : respondingContractId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractsStatusCopyWith<$Res> get summaryStatus {
  
  return $ContractsStatusCopyWith<$Res>(_self.summaryStatus, (value) {
    return _then(_self.copyWith(summaryStatus: value));
  });
}/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractsStatusCopyWith<$Res> get pendingStatus {
  
  return $ContractsStatusCopyWith<$Res>(_self.pendingStatus, (value) {
    return _then(_self.copyWith(pendingStatus: value));
  });
}/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractsStatusCopyWith<$Res> get activeStatus {
  
  return $ContractsStatusCopyWith<$Res>(_self.activeStatus, (value) {
    return _then(_self.copyWith(activeStatus: value));
  });
}/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractsStatusCopyWith<$Res> get rejectedStatus {
  
  return $ContractsStatusCopyWith<$Res>(_self.rejectedStatus, (value) {
    return _then(_self.copyWith(rejectedStatus: value));
  });
}/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractsStatusCopyWith<$Res> get responseStatus {
  
  return $ContractsStatusCopyWith<$Res>(_self.responseStatus, (value) {
    return _then(_self.copyWith(responseStatus: value));
  });
}
}

/// @nodoc
mixin _$ContractsStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractsStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractsStatus()';
}


}

/// @nodoc
class $ContractsStatusCopyWith<$Res>  {
$ContractsStatusCopyWith(ContractsStatus _, $Res Function(ContractsStatus) __);
}


/// Adds pattern-matching-related methods to [ContractsStatus].
extension ContractsStatusPatterns on ContractsStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ContractsStatusInitial value)?  initial,TResult Function( ContractsStatusLoading value)?  loading,TResult Function( ContractsStatusError value)?  error,TResult Function( ContractsStatusSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ContractsStatusInitial() when initial != null:
return initial(_that);case ContractsStatusLoading() when loading != null:
return loading(_that);case ContractsStatusError() when error != null:
return error(_that);case ContractsStatusSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ContractsStatusInitial value)  initial,required TResult Function( ContractsStatusLoading value)  loading,required TResult Function( ContractsStatusError value)  error,required TResult Function( ContractsStatusSuccess value)  success,}){
final _that = this;
switch (_that) {
case ContractsStatusInitial():
return initial(_that);case ContractsStatusLoading():
return loading(_that);case ContractsStatusError():
return error(_that);case ContractsStatusSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ContractsStatusInitial value)?  initial,TResult? Function( ContractsStatusLoading value)?  loading,TResult? Function( ContractsStatusError value)?  error,TResult? Function( ContractsStatusSuccess value)?  success,}){
final _that = this;
switch (_that) {
case ContractsStatusInitial() when initial != null:
return initial(_that);case ContractsStatusLoading() when loading != null:
return loading(_that);case ContractsStatusError() when error != null:
return error(_that);case ContractsStatusSuccess() when success != null:
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
case ContractsStatusInitial() when initial != null:
return initial();case ContractsStatusLoading() when loading != null:
return loading();case ContractsStatusError() when error != null:
return error();case ContractsStatusSuccess() when success != null:
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
case ContractsStatusInitial():
return initial();case ContractsStatusLoading():
return loading();case ContractsStatusError():
return error();case ContractsStatusSuccess():
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
case ContractsStatusInitial() when initial != null:
return initial();case ContractsStatusLoading() when loading != null:
return loading();case ContractsStatusError() when error != null:
return error();case ContractsStatusSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class ContractsStatusInitial implements ContractsStatus {
  const ContractsStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractsStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractsStatus.initial()';
}


}




/// @nodoc


class ContractsStatusLoading implements ContractsStatus {
  const ContractsStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractsStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractsStatus.loading()';
}


}




/// @nodoc


class ContractsStatusError implements ContractsStatus {
  const ContractsStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractsStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractsStatus.error()';
}


}




/// @nodoc


class ContractsStatusSuccess implements ContractsStatus {
  const ContractsStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractsStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractsStatus.success()';
}


}




// dart format on
