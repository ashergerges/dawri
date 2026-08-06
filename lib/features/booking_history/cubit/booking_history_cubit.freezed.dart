// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_history_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingHistoryState {

 BookingTab get selectedTab;// Each tab is its own server query (status=1 / status=2), so the lists,
// paging and load state are tracked separately.
 List<BookingData> get upcoming; List<BookingData> get past; BookingHistoryStatus get upcomingStatus; BookingHistoryStatus get pastStatus; int get upcomingPage; int get pastPage;/// Cancellations in flight, by booking id.
 Set<int> get cancellingIds;
/// Create a copy of BookingHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingHistoryStateCopyWith<BookingHistoryState> get copyWith => _$BookingHistoryStateCopyWithImpl<BookingHistoryState>(this as BookingHistoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingHistoryState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&const DeepCollectionEquality().equals(other.upcoming, upcoming)&&const DeepCollectionEquality().equals(other.past, past)&&(identical(other.upcomingStatus, upcomingStatus) || other.upcomingStatus == upcomingStatus)&&(identical(other.pastStatus, pastStatus) || other.pastStatus == pastStatus)&&(identical(other.upcomingPage, upcomingPage) || other.upcomingPage == upcomingPage)&&(identical(other.pastPage, pastPage) || other.pastPage == pastPage)&&const DeepCollectionEquality().equals(other.cancellingIds, cancellingIds));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,const DeepCollectionEquality().hash(upcoming),const DeepCollectionEquality().hash(past),upcomingStatus,pastStatus,upcomingPage,pastPage,const DeepCollectionEquality().hash(cancellingIds));

@override
String toString() {
  return 'BookingHistoryState(selectedTab: $selectedTab, upcoming: $upcoming, past: $past, upcomingStatus: $upcomingStatus, pastStatus: $pastStatus, upcomingPage: $upcomingPage, pastPage: $pastPage, cancellingIds: $cancellingIds)';
}


}

/// @nodoc
abstract mixin class $BookingHistoryStateCopyWith<$Res>  {
  factory $BookingHistoryStateCopyWith(BookingHistoryState value, $Res Function(BookingHistoryState) _then) = _$BookingHistoryStateCopyWithImpl;
@useResult
$Res call({
 BookingTab selectedTab, List<BookingData> upcoming, List<BookingData> past, BookingHistoryStatus upcomingStatus, BookingHistoryStatus pastStatus, int upcomingPage, int pastPage, Set<int> cancellingIds
});


$BookingHistoryStatusCopyWith<$Res> get upcomingStatus;$BookingHistoryStatusCopyWith<$Res> get pastStatus;

}
/// @nodoc
class _$BookingHistoryStateCopyWithImpl<$Res>
    implements $BookingHistoryStateCopyWith<$Res> {
  _$BookingHistoryStateCopyWithImpl(this._self, this._then);

  final BookingHistoryState _self;
  final $Res Function(BookingHistoryState) _then;

/// Create a copy of BookingHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTab = null,Object? upcoming = null,Object? past = null,Object? upcomingStatus = null,Object? pastStatus = null,Object? upcomingPage = null,Object? pastPage = null,Object? cancellingIds = null,}) {
  return _then(_self.copyWith(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as BookingTab,upcoming: null == upcoming ? _self.upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as List<BookingData>,past: null == past ? _self.past : past // ignore: cast_nullable_to_non_nullable
as List<BookingData>,upcomingStatus: null == upcomingStatus ? _self.upcomingStatus : upcomingStatus // ignore: cast_nullable_to_non_nullable
as BookingHistoryStatus,pastStatus: null == pastStatus ? _self.pastStatus : pastStatus // ignore: cast_nullable_to_non_nullable
as BookingHistoryStatus,upcomingPage: null == upcomingPage ? _self.upcomingPage : upcomingPage // ignore: cast_nullable_to_non_nullable
as int,pastPage: null == pastPage ? _self.pastPage : pastPage // ignore: cast_nullable_to_non_nullable
as int,cancellingIds: null == cancellingIds ? _self.cancellingIds : cancellingIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}
/// Create a copy of BookingHistoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingHistoryStatusCopyWith<$Res> get upcomingStatus {
  
  return $BookingHistoryStatusCopyWith<$Res>(_self.upcomingStatus, (value) {
    return _then(_self.copyWith(upcomingStatus: value));
  });
}/// Create a copy of BookingHistoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingHistoryStatusCopyWith<$Res> get pastStatus {
  
  return $BookingHistoryStatusCopyWith<$Res>(_self.pastStatus, (value) {
    return _then(_self.copyWith(pastStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingHistoryState].
extension BookingHistoryStatePatterns on BookingHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingHistoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingHistoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingHistoryState value)  $default,){
final _that = this;
switch (_that) {
case _BookingHistoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingHistoryState value)?  $default,){
final _that = this;
switch (_that) {
case _BookingHistoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookingTab selectedTab,  List<BookingData> upcoming,  List<BookingData> past,  BookingHistoryStatus upcomingStatus,  BookingHistoryStatus pastStatus,  int upcomingPage,  int pastPage,  Set<int> cancellingIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingHistoryState() when $default != null:
return $default(_that.selectedTab,_that.upcoming,_that.past,_that.upcomingStatus,_that.pastStatus,_that.upcomingPage,_that.pastPage,_that.cancellingIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookingTab selectedTab,  List<BookingData> upcoming,  List<BookingData> past,  BookingHistoryStatus upcomingStatus,  BookingHistoryStatus pastStatus,  int upcomingPage,  int pastPage,  Set<int> cancellingIds)  $default,) {final _that = this;
switch (_that) {
case _BookingHistoryState():
return $default(_that.selectedTab,_that.upcoming,_that.past,_that.upcomingStatus,_that.pastStatus,_that.upcomingPage,_that.pastPage,_that.cancellingIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookingTab selectedTab,  List<BookingData> upcoming,  List<BookingData> past,  BookingHistoryStatus upcomingStatus,  BookingHistoryStatus pastStatus,  int upcomingPage,  int pastPage,  Set<int> cancellingIds)?  $default,) {final _that = this;
switch (_that) {
case _BookingHistoryState() when $default != null:
return $default(_that.selectedTab,_that.upcoming,_that.past,_that.upcomingStatus,_that.pastStatus,_that.upcomingPage,_that.pastPage,_that.cancellingIds);case _:
  return null;

}
}

}

/// @nodoc


class _BookingHistoryState extends BookingHistoryState {
  const _BookingHistoryState({this.selectedTab = BookingTab.upcoming, final  List<BookingData> upcoming = const [], final  List<BookingData> past = const [], this.upcomingStatus = const BookingHistoryStatus.initial(), this.pastStatus = const BookingHistoryStatus.initial(), this.upcomingPage = 1, this.pastPage = 1, final  Set<int> cancellingIds = const <int>{}}): _upcoming = upcoming,_past = past,_cancellingIds = cancellingIds,super._();
  

@override@JsonKey() final  BookingTab selectedTab;
// Each tab is its own server query (status=1 / status=2), so the lists,
// paging and load state are tracked separately.
 final  List<BookingData> _upcoming;
// Each tab is its own server query (status=1 / status=2), so the lists,
// paging and load state are tracked separately.
@override@JsonKey() List<BookingData> get upcoming {
  if (_upcoming is EqualUnmodifiableListView) return _upcoming;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upcoming);
}

 final  List<BookingData> _past;
@override@JsonKey() List<BookingData> get past {
  if (_past is EqualUnmodifiableListView) return _past;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_past);
}

@override@JsonKey() final  BookingHistoryStatus upcomingStatus;
@override@JsonKey() final  BookingHistoryStatus pastStatus;
@override@JsonKey() final  int upcomingPage;
@override@JsonKey() final  int pastPage;
/// Cancellations in flight, by booking id.
 final  Set<int> _cancellingIds;
/// Cancellations in flight, by booking id.
@override@JsonKey() Set<int> get cancellingIds {
  if (_cancellingIds is EqualUnmodifiableSetView) return _cancellingIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_cancellingIds);
}


/// Create a copy of BookingHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingHistoryStateCopyWith<_BookingHistoryState> get copyWith => __$BookingHistoryStateCopyWithImpl<_BookingHistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingHistoryState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&const DeepCollectionEquality().equals(other._upcoming, _upcoming)&&const DeepCollectionEquality().equals(other._past, _past)&&(identical(other.upcomingStatus, upcomingStatus) || other.upcomingStatus == upcomingStatus)&&(identical(other.pastStatus, pastStatus) || other.pastStatus == pastStatus)&&(identical(other.upcomingPage, upcomingPage) || other.upcomingPage == upcomingPage)&&(identical(other.pastPage, pastPage) || other.pastPage == pastPage)&&const DeepCollectionEquality().equals(other._cancellingIds, _cancellingIds));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,const DeepCollectionEquality().hash(_upcoming),const DeepCollectionEquality().hash(_past),upcomingStatus,pastStatus,upcomingPage,pastPage,const DeepCollectionEquality().hash(_cancellingIds));

@override
String toString() {
  return 'BookingHistoryState(selectedTab: $selectedTab, upcoming: $upcoming, past: $past, upcomingStatus: $upcomingStatus, pastStatus: $pastStatus, upcomingPage: $upcomingPage, pastPage: $pastPage, cancellingIds: $cancellingIds)';
}


}

/// @nodoc
abstract mixin class _$BookingHistoryStateCopyWith<$Res> implements $BookingHistoryStateCopyWith<$Res> {
  factory _$BookingHistoryStateCopyWith(_BookingHistoryState value, $Res Function(_BookingHistoryState) _then) = __$BookingHistoryStateCopyWithImpl;
@override @useResult
$Res call({
 BookingTab selectedTab, List<BookingData> upcoming, List<BookingData> past, BookingHistoryStatus upcomingStatus, BookingHistoryStatus pastStatus, int upcomingPage, int pastPage, Set<int> cancellingIds
});


@override $BookingHistoryStatusCopyWith<$Res> get upcomingStatus;@override $BookingHistoryStatusCopyWith<$Res> get pastStatus;

}
/// @nodoc
class __$BookingHistoryStateCopyWithImpl<$Res>
    implements _$BookingHistoryStateCopyWith<$Res> {
  __$BookingHistoryStateCopyWithImpl(this._self, this._then);

  final _BookingHistoryState _self;
  final $Res Function(_BookingHistoryState) _then;

/// Create a copy of BookingHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,Object? upcoming = null,Object? past = null,Object? upcomingStatus = null,Object? pastStatus = null,Object? upcomingPage = null,Object? pastPage = null,Object? cancellingIds = null,}) {
  return _then(_BookingHistoryState(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as BookingTab,upcoming: null == upcoming ? _self._upcoming : upcoming // ignore: cast_nullable_to_non_nullable
as List<BookingData>,past: null == past ? _self._past : past // ignore: cast_nullable_to_non_nullable
as List<BookingData>,upcomingStatus: null == upcomingStatus ? _self.upcomingStatus : upcomingStatus // ignore: cast_nullable_to_non_nullable
as BookingHistoryStatus,pastStatus: null == pastStatus ? _self.pastStatus : pastStatus // ignore: cast_nullable_to_non_nullable
as BookingHistoryStatus,upcomingPage: null == upcomingPage ? _self.upcomingPage : upcomingPage // ignore: cast_nullable_to_non_nullable
as int,pastPage: null == pastPage ? _self.pastPage : pastPage // ignore: cast_nullable_to_non_nullable
as int,cancellingIds: null == cancellingIds ? _self._cancellingIds : cancellingIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}

/// Create a copy of BookingHistoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingHistoryStatusCopyWith<$Res> get upcomingStatus {
  
  return $BookingHistoryStatusCopyWith<$Res>(_self.upcomingStatus, (value) {
    return _then(_self.copyWith(upcomingStatus: value));
  });
}/// Create a copy of BookingHistoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingHistoryStatusCopyWith<$Res> get pastStatus {
  
  return $BookingHistoryStatusCopyWith<$Res>(_self.pastStatus, (value) {
    return _then(_self.copyWith(pastStatus: value));
  });
}
}

/// @nodoc
mixin _$BookingHistoryStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingHistoryStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingHistoryStatus()';
}


}

/// @nodoc
class $BookingHistoryStatusCopyWith<$Res>  {
$BookingHistoryStatusCopyWith(BookingHistoryStatus _, $Res Function(BookingHistoryStatus) __);
}


/// Adds pattern-matching-related methods to [BookingHistoryStatus].
extension BookingHistoryStatusPatterns on BookingHistoryStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BookingHistoryStatusInitial value)?  initial,TResult Function( BookingHistoryStatusLoading value)?  loading,TResult Function( BookingHistoryStatusSuccess value)?  success,TResult Function( BookingHistoryStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BookingHistoryStatusInitial() when initial != null:
return initial(_that);case BookingHistoryStatusLoading() when loading != null:
return loading(_that);case BookingHistoryStatusSuccess() when success != null:
return success(_that);case BookingHistoryStatusError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BookingHistoryStatusInitial value)  initial,required TResult Function( BookingHistoryStatusLoading value)  loading,required TResult Function( BookingHistoryStatusSuccess value)  success,required TResult Function( BookingHistoryStatusError value)  error,}){
final _that = this;
switch (_that) {
case BookingHistoryStatusInitial():
return initial(_that);case BookingHistoryStatusLoading():
return loading(_that);case BookingHistoryStatusSuccess():
return success(_that);case BookingHistoryStatusError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BookingHistoryStatusInitial value)?  initial,TResult? Function( BookingHistoryStatusLoading value)?  loading,TResult? Function( BookingHistoryStatusSuccess value)?  success,TResult? Function( BookingHistoryStatusError value)?  error,}){
final _that = this;
switch (_that) {
case BookingHistoryStatusInitial() when initial != null:
return initial(_that);case BookingHistoryStatusLoading() when loading != null:
return loading(_that);case BookingHistoryStatusSuccess() when success != null:
return success(_that);case BookingHistoryStatusError() when error != null:
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
case BookingHistoryStatusInitial() when initial != null:
return initial();case BookingHistoryStatusLoading() when loading != null:
return loading();case BookingHistoryStatusSuccess() when success != null:
return success();case BookingHistoryStatusError() when error != null:
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
case BookingHistoryStatusInitial():
return initial();case BookingHistoryStatusLoading():
return loading();case BookingHistoryStatusSuccess():
return success();case BookingHistoryStatusError():
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
case BookingHistoryStatusInitial() when initial != null:
return initial();case BookingHistoryStatusLoading() when loading != null:
return loading();case BookingHistoryStatusSuccess() when success != null:
return success();case BookingHistoryStatusError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class BookingHistoryStatusInitial implements BookingHistoryStatus {
  const BookingHistoryStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingHistoryStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingHistoryStatus.initial()';
}


}




/// @nodoc


class BookingHistoryStatusLoading implements BookingHistoryStatus {
  const BookingHistoryStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingHistoryStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingHistoryStatus.loading()';
}


}




/// @nodoc


class BookingHistoryStatusSuccess implements BookingHistoryStatus {
  const BookingHistoryStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingHistoryStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingHistoryStatus.success()';
}


}




/// @nodoc


class BookingHistoryStatusError implements BookingHistoryStatus {
  const BookingHistoryStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingHistoryStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingHistoryStatus.error()';
}


}




// dart format on
