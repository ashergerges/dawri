// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_orders_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyOrdersState {

 MyOrderTab get selectedTab;// ─── Tab counts (drive the badges) ───────────────────────────
 MyOrderCounts? get counts;// ─── Tab 0 → status 1 (current) ──────────────────────────────
 List<MyOrderModel> get current; int get currentPage; bool get currentHasMore; MyOrdersStatus get currentStatus;// ─── Tab 1 → status 2 (delivered) ────────────────────────────
 List<MyOrderModel> get delivered; int get deliveredPage; bool get deliveredHasMore; MyOrdersStatus get deliveredStatus;// ─── Tab 2 → status 3 (cancelled) ────────────────────────────
 List<MyOrderModel> get cancelled; int get cancelledPage; bool get cancelledHasMore; MyOrdersStatus get cancelledStatus;// ─── Mutations ───────────────────────────────────────────────
 Set<int> get cancellingIds;// ─── Details screen ──────────────────────────────────────────
 MyOrderModel? get details; MyOrdersStatus get detailsStatus;
/// Create a copy of MyOrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyOrdersStateCopyWith<MyOrdersState> get copyWith => _$MyOrdersStateCopyWithImpl<MyOrdersState>(this as MyOrdersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyOrdersState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.counts, counts) || other.counts == counts)&&const DeepCollectionEquality().equals(other.current, current)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.currentHasMore, currentHasMore) || other.currentHasMore == currentHasMore)&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&const DeepCollectionEquality().equals(other.delivered, delivered)&&(identical(other.deliveredPage, deliveredPage) || other.deliveredPage == deliveredPage)&&(identical(other.deliveredHasMore, deliveredHasMore) || other.deliveredHasMore == deliveredHasMore)&&(identical(other.deliveredStatus, deliveredStatus) || other.deliveredStatus == deliveredStatus)&&const DeepCollectionEquality().equals(other.cancelled, cancelled)&&(identical(other.cancelledPage, cancelledPage) || other.cancelledPage == cancelledPage)&&(identical(other.cancelledHasMore, cancelledHasMore) || other.cancelledHasMore == cancelledHasMore)&&(identical(other.cancelledStatus, cancelledStatus) || other.cancelledStatus == cancelledStatus)&&const DeepCollectionEquality().equals(other.cancellingIds, cancellingIds)&&(identical(other.details, details) || other.details == details)&&(identical(other.detailsStatus, detailsStatus) || other.detailsStatus == detailsStatus));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,counts,const DeepCollectionEquality().hash(current),currentPage,currentHasMore,currentStatus,const DeepCollectionEquality().hash(delivered),deliveredPage,deliveredHasMore,deliveredStatus,const DeepCollectionEquality().hash(cancelled),cancelledPage,cancelledHasMore,cancelledStatus,const DeepCollectionEquality().hash(cancellingIds),details,detailsStatus);

@override
String toString() {
  return 'MyOrdersState(selectedTab: $selectedTab, counts: $counts, current: $current, currentPage: $currentPage, currentHasMore: $currentHasMore, currentStatus: $currentStatus, delivered: $delivered, deliveredPage: $deliveredPage, deliveredHasMore: $deliveredHasMore, deliveredStatus: $deliveredStatus, cancelled: $cancelled, cancelledPage: $cancelledPage, cancelledHasMore: $cancelledHasMore, cancelledStatus: $cancelledStatus, cancellingIds: $cancellingIds, details: $details, detailsStatus: $detailsStatus)';
}


}

/// @nodoc
abstract mixin class $MyOrdersStateCopyWith<$Res>  {
  factory $MyOrdersStateCopyWith(MyOrdersState value, $Res Function(MyOrdersState) _then) = _$MyOrdersStateCopyWithImpl;
@useResult
$Res call({
 MyOrderTab selectedTab, MyOrderCounts? counts, List<MyOrderModel> current, int currentPage, bool currentHasMore, MyOrdersStatus currentStatus, List<MyOrderModel> delivered, int deliveredPage, bool deliveredHasMore, MyOrdersStatus deliveredStatus, List<MyOrderModel> cancelled, int cancelledPage, bool cancelledHasMore, MyOrdersStatus cancelledStatus, Set<int> cancellingIds, MyOrderModel? details, MyOrdersStatus detailsStatus
});


$MyOrdersStatusCopyWith<$Res> get currentStatus;$MyOrdersStatusCopyWith<$Res> get deliveredStatus;$MyOrdersStatusCopyWith<$Res> get cancelledStatus;$MyOrdersStatusCopyWith<$Res> get detailsStatus;

}
/// @nodoc
class _$MyOrdersStateCopyWithImpl<$Res>
    implements $MyOrdersStateCopyWith<$Res> {
  _$MyOrdersStateCopyWithImpl(this._self, this._then);

  final MyOrdersState _self;
  final $Res Function(MyOrdersState) _then;

/// Create a copy of MyOrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTab = null,Object? counts = freezed,Object? current = null,Object? currentPage = null,Object? currentHasMore = null,Object? currentStatus = null,Object? delivered = null,Object? deliveredPage = null,Object? deliveredHasMore = null,Object? deliveredStatus = null,Object? cancelled = null,Object? cancelledPage = null,Object? cancelledHasMore = null,Object? cancelledStatus = null,Object? cancellingIds = null,Object? details = freezed,Object? detailsStatus = null,}) {
  return _then(_self.copyWith(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as MyOrderTab,counts: freezed == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as MyOrderCounts?,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as List<MyOrderModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,currentHasMore: null == currentHasMore ? _self.currentHasMore : currentHasMore // ignore: cast_nullable_to_non_nullable
as bool,currentStatus: null == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as MyOrdersStatus,delivered: null == delivered ? _self.delivered : delivered // ignore: cast_nullable_to_non_nullable
as List<MyOrderModel>,deliveredPage: null == deliveredPage ? _self.deliveredPage : deliveredPage // ignore: cast_nullable_to_non_nullable
as int,deliveredHasMore: null == deliveredHasMore ? _self.deliveredHasMore : deliveredHasMore // ignore: cast_nullable_to_non_nullable
as bool,deliveredStatus: null == deliveredStatus ? _self.deliveredStatus : deliveredStatus // ignore: cast_nullable_to_non_nullable
as MyOrdersStatus,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as List<MyOrderModel>,cancelledPage: null == cancelledPage ? _self.cancelledPage : cancelledPage // ignore: cast_nullable_to_non_nullable
as int,cancelledHasMore: null == cancelledHasMore ? _self.cancelledHasMore : cancelledHasMore // ignore: cast_nullable_to_non_nullable
as bool,cancelledStatus: null == cancelledStatus ? _self.cancelledStatus : cancelledStatus // ignore: cast_nullable_to_non_nullable
as MyOrdersStatus,cancellingIds: null == cancellingIds ? _self.cancellingIds : cancellingIds // ignore: cast_nullable_to_non_nullable
as Set<int>,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as MyOrderModel?,detailsStatus: null == detailsStatus ? _self.detailsStatus : detailsStatus // ignore: cast_nullable_to_non_nullable
as MyOrdersStatus,
  ));
}
/// Create a copy of MyOrdersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyOrdersStatusCopyWith<$Res> get currentStatus {
  
  return $MyOrdersStatusCopyWith<$Res>(_self.currentStatus, (value) {
    return _then(_self.copyWith(currentStatus: value));
  });
}/// Create a copy of MyOrdersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyOrdersStatusCopyWith<$Res> get deliveredStatus {
  
  return $MyOrdersStatusCopyWith<$Res>(_self.deliveredStatus, (value) {
    return _then(_self.copyWith(deliveredStatus: value));
  });
}/// Create a copy of MyOrdersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyOrdersStatusCopyWith<$Res> get cancelledStatus {
  
  return $MyOrdersStatusCopyWith<$Res>(_self.cancelledStatus, (value) {
    return _then(_self.copyWith(cancelledStatus: value));
  });
}/// Create a copy of MyOrdersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyOrdersStatusCopyWith<$Res> get detailsStatus {
  
  return $MyOrdersStatusCopyWith<$Res>(_self.detailsStatus, (value) {
    return _then(_self.copyWith(detailsStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyOrdersState].
extension MyOrdersStatePatterns on MyOrdersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyOrdersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyOrdersState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyOrdersState value)  $default,){
final _that = this;
switch (_that) {
case _MyOrdersState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyOrdersState value)?  $default,){
final _that = this;
switch (_that) {
case _MyOrdersState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MyOrderTab selectedTab,  MyOrderCounts? counts,  List<MyOrderModel> current,  int currentPage,  bool currentHasMore,  MyOrdersStatus currentStatus,  List<MyOrderModel> delivered,  int deliveredPage,  bool deliveredHasMore,  MyOrdersStatus deliveredStatus,  List<MyOrderModel> cancelled,  int cancelledPage,  bool cancelledHasMore,  MyOrdersStatus cancelledStatus,  Set<int> cancellingIds,  MyOrderModel? details,  MyOrdersStatus detailsStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyOrdersState() when $default != null:
return $default(_that.selectedTab,_that.counts,_that.current,_that.currentPage,_that.currentHasMore,_that.currentStatus,_that.delivered,_that.deliveredPage,_that.deliveredHasMore,_that.deliveredStatus,_that.cancelled,_that.cancelledPage,_that.cancelledHasMore,_that.cancelledStatus,_that.cancellingIds,_that.details,_that.detailsStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MyOrderTab selectedTab,  MyOrderCounts? counts,  List<MyOrderModel> current,  int currentPage,  bool currentHasMore,  MyOrdersStatus currentStatus,  List<MyOrderModel> delivered,  int deliveredPage,  bool deliveredHasMore,  MyOrdersStatus deliveredStatus,  List<MyOrderModel> cancelled,  int cancelledPage,  bool cancelledHasMore,  MyOrdersStatus cancelledStatus,  Set<int> cancellingIds,  MyOrderModel? details,  MyOrdersStatus detailsStatus)  $default,) {final _that = this;
switch (_that) {
case _MyOrdersState():
return $default(_that.selectedTab,_that.counts,_that.current,_that.currentPage,_that.currentHasMore,_that.currentStatus,_that.delivered,_that.deliveredPage,_that.deliveredHasMore,_that.deliveredStatus,_that.cancelled,_that.cancelledPage,_that.cancelledHasMore,_that.cancelledStatus,_that.cancellingIds,_that.details,_that.detailsStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MyOrderTab selectedTab,  MyOrderCounts? counts,  List<MyOrderModel> current,  int currentPage,  bool currentHasMore,  MyOrdersStatus currentStatus,  List<MyOrderModel> delivered,  int deliveredPage,  bool deliveredHasMore,  MyOrdersStatus deliveredStatus,  List<MyOrderModel> cancelled,  int cancelledPage,  bool cancelledHasMore,  MyOrdersStatus cancelledStatus,  Set<int> cancellingIds,  MyOrderModel? details,  MyOrdersStatus detailsStatus)?  $default,) {final _that = this;
switch (_that) {
case _MyOrdersState() when $default != null:
return $default(_that.selectedTab,_that.counts,_that.current,_that.currentPage,_that.currentHasMore,_that.currentStatus,_that.delivered,_that.deliveredPage,_that.deliveredHasMore,_that.deliveredStatus,_that.cancelled,_that.cancelledPage,_that.cancelledHasMore,_that.cancelledStatus,_that.cancellingIds,_that.details,_that.detailsStatus);case _:
  return null;

}
}

}

/// @nodoc


class _MyOrdersState extends MyOrdersState {
  const _MyOrdersState({this.selectedTab = MyOrderTab.current, this.counts, final  List<MyOrderModel> current = const [], this.currentPage = 1, this.currentHasMore = true, this.currentStatus = const MyOrdersStatus.initial(), final  List<MyOrderModel> delivered = const [], this.deliveredPage = 1, this.deliveredHasMore = true, this.deliveredStatus = const MyOrdersStatus.initial(), final  List<MyOrderModel> cancelled = const [], this.cancelledPage = 1, this.cancelledHasMore = true, this.cancelledStatus = const MyOrdersStatus.initial(), final  Set<int> cancellingIds = const <int>{}, this.details, this.detailsStatus = const MyOrdersStatus.initial()}): _current = current,_delivered = delivered,_cancelled = cancelled,_cancellingIds = cancellingIds,super._();
  

@override@JsonKey() final  MyOrderTab selectedTab;
// ─── Tab counts (drive the badges) ───────────────────────────
@override final  MyOrderCounts? counts;
// ─── Tab 0 → status 1 (current) ──────────────────────────────
 final  List<MyOrderModel> _current;
// ─── Tab 0 → status 1 (current) ──────────────────────────────
@override@JsonKey() List<MyOrderModel> get current {
  if (_current is EqualUnmodifiableListView) return _current;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_current);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool currentHasMore;
@override@JsonKey() final  MyOrdersStatus currentStatus;
// ─── Tab 1 → status 2 (delivered) ────────────────────────────
 final  List<MyOrderModel> _delivered;
// ─── Tab 1 → status 2 (delivered) ────────────────────────────
@override@JsonKey() List<MyOrderModel> get delivered {
  if (_delivered is EqualUnmodifiableListView) return _delivered;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_delivered);
}

@override@JsonKey() final  int deliveredPage;
@override@JsonKey() final  bool deliveredHasMore;
@override@JsonKey() final  MyOrdersStatus deliveredStatus;
// ─── Tab 2 → status 3 (cancelled) ────────────────────────────
 final  List<MyOrderModel> _cancelled;
// ─── Tab 2 → status 3 (cancelled) ────────────────────────────
@override@JsonKey() List<MyOrderModel> get cancelled {
  if (_cancelled is EqualUnmodifiableListView) return _cancelled;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cancelled);
}

@override@JsonKey() final  int cancelledPage;
@override@JsonKey() final  bool cancelledHasMore;
@override@JsonKey() final  MyOrdersStatus cancelledStatus;
// ─── Mutations ───────────────────────────────────────────────
 final  Set<int> _cancellingIds;
// ─── Mutations ───────────────────────────────────────────────
@override@JsonKey() Set<int> get cancellingIds {
  if (_cancellingIds is EqualUnmodifiableSetView) return _cancellingIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_cancellingIds);
}

// ─── Details screen ──────────────────────────────────────────
@override final  MyOrderModel? details;
@override@JsonKey() final  MyOrdersStatus detailsStatus;

/// Create a copy of MyOrdersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyOrdersStateCopyWith<_MyOrdersState> get copyWith => __$MyOrdersStateCopyWithImpl<_MyOrdersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyOrdersState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.counts, counts) || other.counts == counts)&&const DeepCollectionEquality().equals(other._current, _current)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.currentHasMore, currentHasMore) || other.currentHasMore == currentHasMore)&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&const DeepCollectionEquality().equals(other._delivered, _delivered)&&(identical(other.deliveredPage, deliveredPage) || other.deliveredPage == deliveredPage)&&(identical(other.deliveredHasMore, deliveredHasMore) || other.deliveredHasMore == deliveredHasMore)&&(identical(other.deliveredStatus, deliveredStatus) || other.deliveredStatus == deliveredStatus)&&const DeepCollectionEquality().equals(other._cancelled, _cancelled)&&(identical(other.cancelledPage, cancelledPage) || other.cancelledPage == cancelledPage)&&(identical(other.cancelledHasMore, cancelledHasMore) || other.cancelledHasMore == cancelledHasMore)&&(identical(other.cancelledStatus, cancelledStatus) || other.cancelledStatus == cancelledStatus)&&const DeepCollectionEquality().equals(other._cancellingIds, _cancellingIds)&&(identical(other.details, details) || other.details == details)&&(identical(other.detailsStatus, detailsStatus) || other.detailsStatus == detailsStatus));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,counts,const DeepCollectionEquality().hash(_current),currentPage,currentHasMore,currentStatus,const DeepCollectionEquality().hash(_delivered),deliveredPage,deliveredHasMore,deliveredStatus,const DeepCollectionEquality().hash(_cancelled),cancelledPage,cancelledHasMore,cancelledStatus,const DeepCollectionEquality().hash(_cancellingIds),details,detailsStatus);

@override
String toString() {
  return 'MyOrdersState(selectedTab: $selectedTab, counts: $counts, current: $current, currentPage: $currentPage, currentHasMore: $currentHasMore, currentStatus: $currentStatus, delivered: $delivered, deliveredPage: $deliveredPage, deliveredHasMore: $deliveredHasMore, deliveredStatus: $deliveredStatus, cancelled: $cancelled, cancelledPage: $cancelledPage, cancelledHasMore: $cancelledHasMore, cancelledStatus: $cancelledStatus, cancellingIds: $cancellingIds, details: $details, detailsStatus: $detailsStatus)';
}


}

/// @nodoc
abstract mixin class _$MyOrdersStateCopyWith<$Res> implements $MyOrdersStateCopyWith<$Res> {
  factory _$MyOrdersStateCopyWith(_MyOrdersState value, $Res Function(_MyOrdersState) _then) = __$MyOrdersStateCopyWithImpl;
@override @useResult
$Res call({
 MyOrderTab selectedTab, MyOrderCounts? counts, List<MyOrderModel> current, int currentPage, bool currentHasMore, MyOrdersStatus currentStatus, List<MyOrderModel> delivered, int deliveredPage, bool deliveredHasMore, MyOrdersStatus deliveredStatus, List<MyOrderModel> cancelled, int cancelledPage, bool cancelledHasMore, MyOrdersStatus cancelledStatus, Set<int> cancellingIds, MyOrderModel? details, MyOrdersStatus detailsStatus
});


@override $MyOrdersStatusCopyWith<$Res> get currentStatus;@override $MyOrdersStatusCopyWith<$Res> get deliveredStatus;@override $MyOrdersStatusCopyWith<$Res> get cancelledStatus;@override $MyOrdersStatusCopyWith<$Res> get detailsStatus;

}
/// @nodoc
class __$MyOrdersStateCopyWithImpl<$Res>
    implements _$MyOrdersStateCopyWith<$Res> {
  __$MyOrdersStateCopyWithImpl(this._self, this._then);

  final _MyOrdersState _self;
  final $Res Function(_MyOrdersState) _then;

/// Create a copy of MyOrdersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,Object? counts = freezed,Object? current = null,Object? currentPage = null,Object? currentHasMore = null,Object? currentStatus = null,Object? delivered = null,Object? deliveredPage = null,Object? deliveredHasMore = null,Object? deliveredStatus = null,Object? cancelled = null,Object? cancelledPage = null,Object? cancelledHasMore = null,Object? cancelledStatus = null,Object? cancellingIds = null,Object? details = freezed,Object? detailsStatus = null,}) {
  return _then(_MyOrdersState(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as MyOrderTab,counts: freezed == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as MyOrderCounts?,current: null == current ? _self._current : current // ignore: cast_nullable_to_non_nullable
as List<MyOrderModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,currentHasMore: null == currentHasMore ? _self.currentHasMore : currentHasMore // ignore: cast_nullable_to_non_nullable
as bool,currentStatus: null == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as MyOrdersStatus,delivered: null == delivered ? _self._delivered : delivered // ignore: cast_nullable_to_non_nullable
as List<MyOrderModel>,deliveredPage: null == deliveredPage ? _self.deliveredPage : deliveredPage // ignore: cast_nullable_to_non_nullable
as int,deliveredHasMore: null == deliveredHasMore ? _self.deliveredHasMore : deliveredHasMore // ignore: cast_nullable_to_non_nullable
as bool,deliveredStatus: null == deliveredStatus ? _self.deliveredStatus : deliveredStatus // ignore: cast_nullable_to_non_nullable
as MyOrdersStatus,cancelled: null == cancelled ? _self._cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as List<MyOrderModel>,cancelledPage: null == cancelledPage ? _self.cancelledPage : cancelledPage // ignore: cast_nullable_to_non_nullable
as int,cancelledHasMore: null == cancelledHasMore ? _self.cancelledHasMore : cancelledHasMore // ignore: cast_nullable_to_non_nullable
as bool,cancelledStatus: null == cancelledStatus ? _self.cancelledStatus : cancelledStatus // ignore: cast_nullable_to_non_nullable
as MyOrdersStatus,cancellingIds: null == cancellingIds ? _self._cancellingIds : cancellingIds // ignore: cast_nullable_to_non_nullable
as Set<int>,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as MyOrderModel?,detailsStatus: null == detailsStatus ? _self.detailsStatus : detailsStatus // ignore: cast_nullable_to_non_nullable
as MyOrdersStatus,
  ));
}

/// Create a copy of MyOrdersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyOrdersStatusCopyWith<$Res> get currentStatus {
  
  return $MyOrdersStatusCopyWith<$Res>(_self.currentStatus, (value) {
    return _then(_self.copyWith(currentStatus: value));
  });
}/// Create a copy of MyOrdersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyOrdersStatusCopyWith<$Res> get deliveredStatus {
  
  return $MyOrdersStatusCopyWith<$Res>(_self.deliveredStatus, (value) {
    return _then(_self.copyWith(deliveredStatus: value));
  });
}/// Create a copy of MyOrdersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyOrdersStatusCopyWith<$Res> get cancelledStatus {
  
  return $MyOrdersStatusCopyWith<$Res>(_self.cancelledStatus, (value) {
    return _then(_self.copyWith(cancelledStatus: value));
  });
}/// Create a copy of MyOrdersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyOrdersStatusCopyWith<$Res> get detailsStatus {
  
  return $MyOrdersStatusCopyWith<$Res>(_self.detailsStatus, (value) {
    return _then(_self.copyWith(detailsStatus: value));
  });
}
}

/// @nodoc
mixin _$MyOrdersStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyOrdersStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyOrdersStatus()';
}


}

/// @nodoc
class $MyOrdersStatusCopyWith<$Res>  {
$MyOrdersStatusCopyWith(MyOrdersStatus _, $Res Function(MyOrdersStatus) __);
}


/// Adds pattern-matching-related methods to [MyOrdersStatus].
extension MyOrdersStatusPatterns on MyOrdersStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MyOrdersStatusInitial value)?  initial,TResult Function( MyOrdersStatusLoading value)?  loading,TResult Function( MyOrdersStatusSuccess value)?  success,TResult Function( MyOrdersStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MyOrdersStatusInitial() when initial != null:
return initial(_that);case MyOrdersStatusLoading() when loading != null:
return loading(_that);case MyOrdersStatusSuccess() when success != null:
return success(_that);case MyOrdersStatusError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MyOrdersStatusInitial value)  initial,required TResult Function( MyOrdersStatusLoading value)  loading,required TResult Function( MyOrdersStatusSuccess value)  success,required TResult Function( MyOrdersStatusError value)  error,}){
final _that = this;
switch (_that) {
case MyOrdersStatusInitial():
return initial(_that);case MyOrdersStatusLoading():
return loading(_that);case MyOrdersStatusSuccess():
return success(_that);case MyOrdersStatusError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MyOrdersStatusInitial value)?  initial,TResult? Function( MyOrdersStatusLoading value)?  loading,TResult? Function( MyOrdersStatusSuccess value)?  success,TResult? Function( MyOrdersStatusError value)?  error,}){
final _that = this;
switch (_that) {
case MyOrdersStatusInitial() when initial != null:
return initial(_that);case MyOrdersStatusLoading() when loading != null:
return loading(_that);case MyOrdersStatusSuccess() when success != null:
return success(_that);case MyOrdersStatusError() when error != null:
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
case MyOrdersStatusInitial() when initial != null:
return initial();case MyOrdersStatusLoading() when loading != null:
return loading();case MyOrdersStatusSuccess() when success != null:
return success();case MyOrdersStatusError() when error != null:
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
case MyOrdersStatusInitial():
return initial();case MyOrdersStatusLoading():
return loading();case MyOrdersStatusSuccess():
return success();case MyOrdersStatusError():
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
case MyOrdersStatusInitial() when initial != null:
return initial();case MyOrdersStatusLoading() when loading != null:
return loading();case MyOrdersStatusSuccess() when success != null:
return success();case MyOrdersStatusError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class MyOrdersStatusInitial implements MyOrdersStatus {
  const MyOrdersStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyOrdersStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyOrdersStatus.initial()';
}


}




/// @nodoc


class MyOrdersStatusLoading implements MyOrdersStatus {
  const MyOrdersStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyOrdersStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyOrdersStatus.loading()';
}


}




/// @nodoc


class MyOrdersStatusSuccess implements MyOrdersStatus {
  const MyOrdersStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyOrdersStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyOrdersStatus.success()';
}


}




/// @nodoc


class MyOrdersStatusError implements MyOrdersStatus {
  const MyOrdersStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyOrdersStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyOrdersStatus.error()';
}


}




// dart format on
