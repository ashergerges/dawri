// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'championships_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChampionshipsState {

 int get activeTab;// ─── Available (status = 2) ─────────────────────────────
 List<ChampionshipModel> get availableItems; int get availablePage; PaginationModel? get availablePagination; ChampionshipsListStatus get availableStatus;// ─── Ongoing (status = 3) ────────────────────────────────
 List<ChampionshipModel> get ongoingItems; int get ongoingPage; PaginationModel? get ongoingPagination; ChampionshipsListStatus get ongoingStatus;// ─── Completed (status = 4) ──────────────────────────────
 List<ChampionshipModel> get completedItems; int get completedPage; PaginationModel? get completedPagination; ChampionshipsListStatus get completedStatus;
/// Create a copy of ChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChampionshipsStateCopyWith<ChampionshipsState> get copyWith => _$ChampionshipsStateCopyWithImpl<ChampionshipsState>(this as ChampionshipsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampionshipsState&&(identical(other.activeTab, activeTab) || other.activeTab == activeTab)&&const DeepCollectionEquality().equals(other.availableItems, availableItems)&&(identical(other.availablePage, availablePage) || other.availablePage == availablePage)&&(identical(other.availablePagination, availablePagination) || other.availablePagination == availablePagination)&&(identical(other.availableStatus, availableStatus) || other.availableStatus == availableStatus)&&const DeepCollectionEquality().equals(other.ongoingItems, ongoingItems)&&(identical(other.ongoingPage, ongoingPage) || other.ongoingPage == ongoingPage)&&(identical(other.ongoingPagination, ongoingPagination) || other.ongoingPagination == ongoingPagination)&&(identical(other.ongoingStatus, ongoingStatus) || other.ongoingStatus == ongoingStatus)&&const DeepCollectionEquality().equals(other.completedItems, completedItems)&&(identical(other.completedPage, completedPage) || other.completedPage == completedPage)&&(identical(other.completedPagination, completedPagination) || other.completedPagination == completedPagination)&&(identical(other.completedStatus, completedStatus) || other.completedStatus == completedStatus));
}


@override
int get hashCode => Object.hash(runtimeType,activeTab,const DeepCollectionEquality().hash(availableItems),availablePage,availablePagination,availableStatus,const DeepCollectionEquality().hash(ongoingItems),ongoingPage,ongoingPagination,ongoingStatus,const DeepCollectionEquality().hash(completedItems),completedPage,completedPagination,completedStatus);

@override
String toString() {
  return 'ChampionshipsState(activeTab: $activeTab, availableItems: $availableItems, availablePage: $availablePage, availablePagination: $availablePagination, availableStatus: $availableStatus, ongoingItems: $ongoingItems, ongoingPage: $ongoingPage, ongoingPagination: $ongoingPagination, ongoingStatus: $ongoingStatus, completedItems: $completedItems, completedPage: $completedPage, completedPagination: $completedPagination, completedStatus: $completedStatus)';
}


}

/// @nodoc
abstract mixin class $ChampionshipsStateCopyWith<$Res>  {
  factory $ChampionshipsStateCopyWith(ChampionshipsState value, $Res Function(ChampionshipsState) _then) = _$ChampionshipsStateCopyWithImpl;
@useResult
$Res call({
 int activeTab, List<ChampionshipModel> availableItems, int availablePage, PaginationModel? availablePagination, ChampionshipsListStatus availableStatus, List<ChampionshipModel> ongoingItems, int ongoingPage, PaginationModel? ongoingPagination, ChampionshipsListStatus ongoingStatus, List<ChampionshipModel> completedItems, int completedPage, PaginationModel? completedPagination, ChampionshipsListStatus completedStatus
});


$ChampionshipsListStatusCopyWith<$Res> get availableStatus;$ChampionshipsListStatusCopyWith<$Res> get ongoingStatus;$ChampionshipsListStatusCopyWith<$Res> get completedStatus;

}
/// @nodoc
class _$ChampionshipsStateCopyWithImpl<$Res>
    implements $ChampionshipsStateCopyWith<$Res> {
  _$ChampionshipsStateCopyWithImpl(this._self, this._then);

  final ChampionshipsState _self;
  final $Res Function(ChampionshipsState) _then;

/// Create a copy of ChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeTab = null,Object? availableItems = null,Object? availablePage = null,Object? availablePagination = freezed,Object? availableStatus = null,Object? ongoingItems = null,Object? ongoingPage = null,Object? ongoingPagination = freezed,Object? ongoingStatus = null,Object? completedItems = null,Object? completedPage = null,Object? completedPagination = freezed,Object? completedStatus = null,}) {
  return _then(_self.copyWith(
activeTab: null == activeTab ? _self.activeTab : activeTab // ignore: cast_nullable_to_non_nullable
as int,availableItems: null == availableItems ? _self.availableItems : availableItems // ignore: cast_nullable_to_non_nullable
as List<ChampionshipModel>,availablePage: null == availablePage ? _self.availablePage : availablePage // ignore: cast_nullable_to_non_nullable
as int,availablePagination: freezed == availablePagination ? _self.availablePagination : availablePagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,availableStatus: null == availableStatus ? _self.availableStatus : availableStatus // ignore: cast_nullable_to_non_nullable
as ChampionshipsListStatus,ongoingItems: null == ongoingItems ? _self.ongoingItems : ongoingItems // ignore: cast_nullable_to_non_nullable
as List<ChampionshipModel>,ongoingPage: null == ongoingPage ? _self.ongoingPage : ongoingPage // ignore: cast_nullable_to_non_nullable
as int,ongoingPagination: freezed == ongoingPagination ? _self.ongoingPagination : ongoingPagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,ongoingStatus: null == ongoingStatus ? _self.ongoingStatus : ongoingStatus // ignore: cast_nullable_to_non_nullable
as ChampionshipsListStatus,completedItems: null == completedItems ? _self.completedItems : completedItems // ignore: cast_nullable_to_non_nullable
as List<ChampionshipModel>,completedPage: null == completedPage ? _self.completedPage : completedPage // ignore: cast_nullable_to_non_nullable
as int,completedPagination: freezed == completedPagination ? _self.completedPagination : completedPagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,completedStatus: null == completedStatus ? _self.completedStatus : completedStatus // ignore: cast_nullable_to_non_nullable
as ChampionshipsListStatus,
  ));
}
/// Create a copy of ChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChampionshipsListStatusCopyWith<$Res> get availableStatus {
  
  return $ChampionshipsListStatusCopyWith<$Res>(_self.availableStatus, (value) {
    return _then(_self.copyWith(availableStatus: value));
  });
}/// Create a copy of ChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChampionshipsListStatusCopyWith<$Res> get ongoingStatus {
  
  return $ChampionshipsListStatusCopyWith<$Res>(_self.ongoingStatus, (value) {
    return _then(_self.copyWith(ongoingStatus: value));
  });
}/// Create a copy of ChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChampionshipsListStatusCopyWith<$Res> get completedStatus {
  
  return $ChampionshipsListStatusCopyWith<$Res>(_self.completedStatus, (value) {
    return _then(_self.copyWith(completedStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChampionshipsState].
extension ChampionshipsStatePatterns on ChampionshipsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChampionshipsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChampionshipsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChampionshipsState value)  $default,){
final _that = this;
switch (_that) {
case _ChampionshipsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChampionshipsState value)?  $default,){
final _that = this;
switch (_that) {
case _ChampionshipsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int activeTab,  List<ChampionshipModel> availableItems,  int availablePage,  PaginationModel? availablePagination,  ChampionshipsListStatus availableStatus,  List<ChampionshipModel> ongoingItems,  int ongoingPage,  PaginationModel? ongoingPagination,  ChampionshipsListStatus ongoingStatus,  List<ChampionshipModel> completedItems,  int completedPage,  PaginationModel? completedPagination,  ChampionshipsListStatus completedStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChampionshipsState() when $default != null:
return $default(_that.activeTab,_that.availableItems,_that.availablePage,_that.availablePagination,_that.availableStatus,_that.ongoingItems,_that.ongoingPage,_that.ongoingPagination,_that.ongoingStatus,_that.completedItems,_that.completedPage,_that.completedPagination,_that.completedStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int activeTab,  List<ChampionshipModel> availableItems,  int availablePage,  PaginationModel? availablePagination,  ChampionshipsListStatus availableStatus,  List<ChampionshipModel> ongoingItems,  int ongoingPage,  PaginationModel? ongoingPagination,  ChampionshipsListStatus ongoingStatus,  List<ChampionshipModel> completedItems,  int completedPage,  PaginationModel? completedPagination,  ChampionshipsListStatus completedStatus)  $default,) {final _that = this;
switch (_that) {
case _ChampionshipsState():
return $default(_that.activeTab,_that.availableItems,_that.availablePage,_that.availablePagination,_that.availableStatus,_that.ongoingItems,_that.ongoingPage,_that.ongoingPagination,_that.ongoingStatus,_that.completedItems,_that.completedPage,_that.completedPagination,_that.completedStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int activeTab,  List<ChampionshipModel> availableItems,  int availablePage,  PaginationModel? availablePagination,  ChampionshipsListStatus availableStatus,  List<ChampionshipModel> ongoingItems,  int ongoingPage,  PaginationModel? ongoingPagination,  ChampionshipsListStatus ongoingStatus,  List<ChampionshipModel> completedItems,  int completedPage,  PaginationModel? completedPagination,  ChampionshipsListStatus completedStatus)?  $default,) {final _that = this;
switch (_that) {
case _ChampionshipsState() when $default != null:
return $default(_that.activeTab,_that.availableItems,_that.availablePage,_that.availablePagination,_that.availableStatus,_that.ongoingItems,_that.ongoingPage,_that.ongoingPagination,_that.ongoingStatus,_that.completedItems,_that.completedPage,_that.completedPagination,_that.completedStatus);case _:
  return null;

}
}

}

/// @nodoc


class _ChampionshipsState implements ChampionshipsState {
  const _ChampionshipsState({this.activeTab = 0, final  List<ChampionshipModel> availableItems = const [], this.availablePage = 1, this.availablePagination, this.availableStatus = const ChampionshipsListStatus.initial(), final  List<ChampionshipModel> ongoingItems = const [], this.ongoingPage = 1, this.ongoingPagination, this.ongoingStatus = const ChampionshipsListStatus.initial(), final  List<ChampionshipModel> completedItems = const [], this.completedPage = 1, this.completedPagination, this.completedStatus = const ChampionshipsListStatus.initial()}): _availableItems = availableItems,_ongoingItems = ongoingItems,_completedItems = completedItems;
  

@override@JsonKey() final  int activeTab;
// ─── Available (status = 2) ─────────────────────────────
 final  List<ChampionshipModel> _availableItems;
// ─── Available (status = 2) ─────────────────────────────
@override@JsonKey() List<ChampionshipModel> get availableItems {
  if (_availableItems is EqualUnmodifiableListView) return _availableItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableItems);
}

@override@JsonKey() final  int availablePage;
@override final  PaginationModel? availablePagination;
@override@JsonKey() final  ChampionshipsListStatus availableStatus;
// ─── Ongoing (status = 3) ────────────────────────────────
 final  List<ChampionshipModel> _ongoingItems;
// ─── Ongoing (status = 3) ────────────────────────────────
@override@JsonKey() List<ChampionshipModel> get ongoingItems {
  if (_ongoingItems is EqualUnmodifiableListView) return _ongoingItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ongoingItems);
}

@override@JsonKey() final  int ongoingPage;
@override final  PaginationModel? ongoingPagination;
@override@JsonKey() final  ChampionshipsListStatus ongoingStatus;
// ─── Completed (status = 4) ──────────────────────────────
 final  List<ChampionshipModel> _completedItems;
// ─── Completed (status = 4) ──────────────────────────────
@override@JsonKey() List<ChampionshipModel> get completedItems {
  if (_completedItems is EqualUnmodifiableListView) return _completedItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedItems);
}

@override@JsonKey() final  int completedPage;
@override final  PaginationModel? completedPagination;
@override@JsonKey() final  ChampionshipsListStatus completedStatus;

/// Create a copy of ChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChampionshipsStateCopyWith<_ChampionshipsState> get copyWith => __$ChampionshipsStateCopyWithImpl<_ChampionshipsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChampionshipsState&&(identical(other.activeTab, activeTab) || other.activeTab == activeTab)&&const DeepCollectionEquality().equals(other._availableItems, _availableItems)&&(identical(other.availablePage, availablePage) || other.availablePage == availablePage)&&(identical(other.availablePagination, availablePagination) || other.availablePagination == availablePagination)&&(identical(other.availableStatus, availableStatus) || other.availableStatus == availableStatus)&&const DeepCollectionEquality().equals(other._ongoingItems, _ongoingItems)&&(identical(other.ongoingPage, ongoingPage) || other.ongoingPage == ongoingPage)&&(identical(other.ongoingPagination, ongoingPagination) || other.ongoingPagination == ongoingPagination)&&(identical(other.ongoingStatus, ongoingStatus) || other.ongoingStatus == ongoingStatus)&&const DeepCollectionEquality().equals(other._completedItems, _completedItems)&&(identical(other.completedPage, completedPage) || other.completedPage == completedPage)&&(identical(other.completedPagination, completedPagination) || other.completedPagination == completedPagination)&&(identical(other.completedStatus, completedStatus) || other.completedStatus == completedStatus));
}


@override
int get hashCode => Object.hash(runtimeType,activeTab,const DeepCollectionEquality().hash(_availableItems),availablePage,availablePagination,availableStatus,const DeepCollectionEquality().hash(_ongoingItems),ongoingPage,ongoingPagination,ongoingStatus,const DeepCollectionEquality().hash(_completedItems),completedPage,completedPagination,completedStatus);

@override
String toString() {
  return 'ChampionshipsState(activeTab: $activeTab, availableItems: $availableItems, availablePage: $availablePage, availablePagination: $availablePagination, availableStatus: $availableStatus, ongoingItems: $ongoingItems, ongoingPage: $ongoingPage, ongoingPagination: $ongoingPagination, ongoingStatus: $ongoingStatus, completedItems: $completedItems, completedPage: $completedPage, completedPagination: $completedPagination, completedStatus: $completedStatus)';
}


}

/// @nodoc
abstract mixin class _$ChampionshipsStateCopyWith<$Res> implements $ChampionshipsStateCopyWith<$Res> {
  factory _$ChampionshipsStateCopyWith(_ChampionshipsState value, $Res Function(_ChampionshipsState) _then) = __$ChampionshipsStateCopyWithImpl;
@override @useResult
$Res call({
 int activeTab, List<ChampionshipModel> availableItems, int availablePage, PaginationModel? availablePagination, ChampionshipsListStatus availableStatus, List<ChampionshipModel> ongoingItems, int ongoingPage, PaginationModel? ongoingPagination, ChampionshipsListStatus ongoingStatus, List<ChampionshipModel> completedItems, int completedPage, PaginationModel? completedPagination, ChampionshipsListStatus completedStatus
});


@override $ChampionshipsListStatusCopyWith<$Res> get availableStatus;@override $ChampionshipsListStatusCopyWith<$Res> get ongoingStatus;@override $ChampionshipsListStatusCopyWith<$Res> get completedStatus;

}
/// @nodoc
class __$ChampionshipsStateCopyWithImpl<$Res>
    implements _$ChampionshipsStateCopyWith<$Res> {
  __$ChampionshipsStateCopyWithImpl(this._self, this._then);

  final _ChampionshipsState _self;
  final $Res Function(_ChampionshipsState) _then;

/// Create a copy of ChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeTab = null,Object? availableItems = null,Object? availablePage = null,Object? availablePagination = freezed,Object? availableStatus = null,Object? ongoingItems = null,Object? ongoingPage = null,Object? ongoingPagination = freezed,Object? ongoingStatus = null,Object? completedItems = null,Object? completedPage = null,Object? completedPagination = freezed,Object? completedStatus = null,}) {
  return _then(_ChampionshipsState(
activeTab: null == activeTab ? _self.activeTab : activeTab // ignore: cast_nullable_to_non_nullable
as int,availableItems: null == availableItems ? _self._availableItems : availableItems // ignore: cast_nullable_to_non_nullable
as List<ChampionshipModel>,availablePage: null == availablePage ? _self.availablePage : availablePage // ignore: cast_nullable_to_non_nullable
as int,availablePagination: freezed == availablePagination ? _self.availablePagination : availablePagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,availableStatus: null == availableStatus ? _self.availableStatus : availableStatus // ignore: cast_nullable_to_non_nullable
as ChampionshipsListStatus,ongoingItems: null == ongoingItems ? _self._ongoingItems : ongoingItems // ignore: cast_nullable_to_non_nullable
as List<ChampionshipModel>,ongoingPage: null == ongoingPage ? _self.ongoingPage : ongoingPage // ignore: cast_nullable_to_non_nullable
as int,ongoingPagination: freezed == ongoingPagination ? _self.ongoingPagination : ongoingPagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,ongoingStatus: null == ongoingStatus ? _self.ongoingStatus : ongoingStatus // ignore: cast_nullable_to_non_nullable
as ChampionshipsListStatus,completedItems: null == completedItems ? _self._completedItems : completedItems // ignore: cast_nullable_to_non_nullable
as List<ChampionshipModel>,completedPage: null == completedPage ? _self.completedPage : completedPage // ignore: cast_nullable_to_non_nullable
as int,completedPagination: freezed == completedPagination ? _self.completedPagination : completedPagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,completedStatus: null == completedStatus ? _self.completedStatus : completedStatus // ignore: cast_nullable_to_non_nullable
as ChampionshipsListStatus,
  ));
}

/// Create a copy of ChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChampionshipsListStatusCopyWith<$Res> get availableStatus {
  
  return $ChampionshipsListStatusCopyWith<$Res>(_self.availableStatus, (value) {
    return _then(_self.copyWith(availableStatus: value));
  });
}/// Create a copy of ChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChampionshipsListStatusCopyWith<$Res> get ongoingStatus {
  
  return $ChampionshipsListStatusCopyWith<$Res>(_self.ongoingStatus, (value) {
    return _then(_self.copyWith(ongoingStatus: value));
  });
}/// Create a copy of ChampionshipsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChampionshipsListStatusCopyWith<$Res> get completedStatus {
  
  return $ChampionshipsListStatusCopyWith<$Res>(_self.completedStatus, (value) {
    return _then(_self.copyWith(completedStatus: value));
  });
}
}

/// @nodoc
mixin _$ChampionshipsListStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChampionshipsListStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampionshipsListStatus()';
}


}

/// @nodoc
class $ChampionshipsListStatusCopyWith<$Res>  {
$ChampionshipsListStatusCopyWith(ChampionshipsListStatus _, $Res Function(ChampionshipsListStatus) __);
}


/// Adds pattern-matching-related methods to [ChampionshipsListStatus].
extension ChampionshipsListStatusPatterns on ChampionshipsListStatus {
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


class Initial implements ChampionshipsListStatus {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampionshipsListStatus.initial()';
}


}




/// @nodoc


class Loading implements ChampionshipsListStatus {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampionshipsListStatus.loading()';
}


}




/// @nodoc


class Error implements ChampionshipsListStatus {
  const Error();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampionshipsListStatus.error()';
}


}




/// @nodoc


class Success implements ChampionshipsListStatus {
  const Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChampionshipsListStatus.success()';
}


}




// dart format on
