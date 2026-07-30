// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tickets_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TicketsState {

 int get selectedTabIndex;// ─── Upcoming matches (tab 0) ────────────────────────────
 List<UpcomingMatchModel> get upcomingMatches; TicketsStatus get upcomingStatus;// ─── My tickets (tab 1) ──────────────────────────────────
 List<MyTicketModel> get myTickets; TicketsStatus get myTicketsStatus;// ─── Booking quantity flow ───────────────────────────────
 UpcomingMatchModel? get selectedMatchForBooking; int get selectedQuantity; TicketsStatus get bookingStatus;// ─── Success modal ───────────────────────────────────────
 bool get showSuccessModal; UpcomingMatchModel? get lastBookedMatch;
/// Create a copy of TicketsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketsStateCopyWith<TicketsState> get copyWith => _$TicketsStateCopyWithImpl<TicketsState>(this as TicketsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketsState&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&const DeepCollectionEquality().equals(other.upcomingMatches, upcomingMatches)&&(identical(other.upcomingStatus, upcomingStatus) || other.upcomingStatus == upcomingStatus)&&const DeepCollectionEquality().equals(other.myTickets, myTickets)&&(identical(other.myTicketsStatus, myTicketsStatus) || other.myTicketsStatus == myTicketsStatus)&&(identical(other.selectedMatchForBooking, selectedMatchForBooking) || other.selectedMatchForBooking == selectedMatchForBooking)&&(identical(other.selectedQuantity, selectedQuantity) || other.selectedQuantity == selectedQuantity)&&(identical(other.bookingStatus, bookingStatus) || other.bookingStatus == bookingStatus)&&(identical(other.showSuccessModal, showSuccessModal) || other.showSuccessModal == showSuccessModal)&&(identical(other.lastBookedMatch, lastBookedMatch) || other.lastBookedMatch == lastBookedMatch));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTabIndex,const DeepCollectionEquality().hash(upcomingMatches),upcomingStatus,const DeepCollectionEquality().hash(myTickets),myTicketsStatus,selectedMatchForBooking,selectedQuantity,bookingStatus,showSuccessModal,lastBookedMatch);

@override
String toString() {
  return 'TicketsState(selectedTabIndex: $selectedTabIndex, upcomingMatches: $upcomingMatches, upcomingStatus: $upcomingStatus, myTickets: $myTickets, myTicketsStatus: $myTicketsStatus, selectedMatchForBooking: $selectedMatchForBooking, selectedQuantity: $selectedQuantity, bookingStatus: $bookingStatus, showSuccessModal: $showSuccessModal, lastBookedMatch: $lastBookedMatch)';
}


}

/// @nodoc
abstract mixin class $TicketsStateCopyWith<$Res>  {
  factory $TicketsStateCopyWith(TicketsState value, $Res Function(TicketsState) _then) = _$TicketsStateCopyWithImpl;
@useResult
$Res call({
 int selectedTabIndex, List<UpcomingMatchModel> upcomingMatches, TicketsStatus upcomingStatus, List<MyTicketModel> myTickets, TicketsStatus myTicketsStatus, UpcomingMatchModel? selectedMatchForBooking, int selectedQuantity, TicketsStatus bookingStatus, bool showSuccessModal, UpcomingMatchModel? lastBookedMatch
});


$TicketsStatusCopyWith<$Res> get upcomingStatus;$TicketsStatusCopyWith<$Res> get myTicketsStatus;$TicketsStatusCopyWith<$Res> get bookingStatus;

}
/// @nodoc
class _$TicketsStateCopyWithImpl<$Res>
    implements $TicketsStateCopyWith<$Res> {
  _$TicketsStateCopyWithImpl(this._self, this._then);

  final TicketsState _self;
  final $Res Function(TicketsState) _then;

/// Create a copy of TicketsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTabIndex = null,Object? upcomingMatches = null,Object? upcomingStatus = null,Object? myTickets = null,Object? myTicketsStatus = null,Object? selectedMatchForBooking = freezed,Object? selectedQuantity = null,Object? bookingStatus = null,Object? showSuccessModal = null,Object? lastBookedMatch = freezed,}) {
  return _then(_self.copyWith(
selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,upcomingMatches: null == upcomingMatches ? _self.upcomingMatches : upcomingMatches // ignore: cast_nullable_to_non_nullable
as List<UpcomingMatchModel>,upcomingStatus: null == upcomingStatus ? _self.upcomingStatus : upcomingStatus // ignore: cast_nullable_to_non_nullable
as TicketsStatus,myTickets: null == myTickets ? _self.myTickets : myTickets // ignore: cast_nullable_to_non_nullable
as List<MyTicketModel>,myTicketsStatus: null == myTicketsStatus ? _self.myTicketsStatus : myTicketsStatus // ignore: cast_nullable_to_non_nullable
as TicketsStatus,selectedMatchForBooking: freezed == selectedMatchForBooking ? _self.selectedMatchForBooking : selectedMatchForBooking // ignore: cast_nullable_to_non_nullable
as UpcomingMatchModel?,selectedQuantity: null == selectedQuantity ? _self.selectedQuantity : selectedQuantity // ignore: cast_nullable_to_non_nullable
as int,bookingStatus: null == bookingStatus ? _self.bookingStatus : bookingStatus // ignore: cast_nullable_to_non_nullable
as TicketsStatus,showSuccessModal: null == showSuccessModal ? _self.showSuccessModal : showSuccessModal // ignore: cast_nullable_to_non_nullable
as bool,lastBookedMatch: freezed == lastBookedMatch ? _self.lastBookedMatch : lastBookedMatch // ignore: cast_nullable_to_non_nullable
as UpcomingMatchModel?,
  ));
}
/// Create a copy of TicketsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketsStatusCopyWith<$Res> get upcomingStatus {
  
  return $TicketsStatusCopyWith<$Res>(_self.upcomingStatus, (value) {
    return _then(_self.copyWith(upcomingStatus: value));
  });
}/// Create a copy of TicketsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketsStatusCopyWith<$Res> get myTicketsStatus {
  
  return $TicketsStatusCopyWith<$Res>(_self.myTicketsStatus, (value) {
    return _then(_self.copyWith(myTicketsStatus: value));
  });
}/// Create a copy of TicketsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketsStatusCopyWith<$Res> get bookingStatus {
  
  return $TicketsStatusCopyWith<$Res>(_self.bookingStatus, (value) {
    return _then(_self.copyWith(bookingStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [TicketsState].
extension TicketsStatePatterns on TicketsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketsState value)  $default,){
final _that = this;
switch (_that) {
case _TicketsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketsState value)?  $default,){
final _that = this;
switch (_that) {
case _TicketsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int selectedTabIndex,  List<UpcomingMatchModel> upcomingMatches,  TicketsStatus upcomingStatus,  List<MyTicketModel> myTickets,  TicketsStatus myTicketsStatus,  UpcomingMatchModel? selectedMatchForBooking,  int selectedQuantity,  TicketsStatus bookingStatus,  bool showSuccessModal,  UpcomingMatchModel? lastBookedMatch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketsState() when $default != null:
return $default(_that.selectedTabIndex,_that.upcomingMatches,_that.upcomingStatus,_that.myTickets,_that.myTicketsStatus,_that.selectedMatchForBooking,_that.selectedQuantity,_that.bookingStatus,_that.showSuccessModal,_that.lastBookedMatch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int selectedTabIndex,  List<UpcomingMatchModel> upcomingMatches,  TicketsStatus upcomingStatus,  List<MyTicketModel> myTickets,  TicketsStatus myTicketsStatus,  UpcomingMatchModel? selectedMatchForBooking,  int selectedQuantity,  TicketsStatus bookingStatus,  bool showSuccessModal,  UpcomingMatchModel? lastBookedMatch)  $default,) {final _that = this;
switch (_that) {
case _TicketsState():
return $default(_that.selectedTabIndex,_that.upcomingMatches,_that.upcomingStatus,_that.myTickets,_that.myTicketsStatus,_that.selectedMatchForBooking,_that.selectedQuantity,_that.bookingStatus,_that.showSuccessModal,_that.lastBookedMatch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int selectedTabIndex,  List<UpcomingMatchModel> upcomingMatches,  TicketsStatus upcomingStatus,  List<MyTicketModel> myTickets,  TicketsStatus myTicketsStatus,  UpcomingMatchModel? selectedMatchForBooking,  int selectedQuantity,  TicketsStatus bookingStatus,  bool showSuccessModal,  UpcomingMatchModel? lastBookedMatch)?  $default,) {final _that = this;
switch (_that) {
case _TicketsState() when $default != null:
return $default(_that.selectedTabIndex,_that.upcomingMatches,_that.upcomingStatus,_that.myTickets,_that.myTicketsStatus,_that.selectedMatchForBooking,_that.selectedQuantity,_that.bookingStatus,_that.showSuccessModal,_that.lastBookedMatch);case _:
  return null;

}
}

}

/// @nodoc


class _TicketsState implements TicketsState {
  const _TicketsState({this.selectedTabIndex = 0, final  List<UpcomingMatchModel> upcomingMatches = const [], this.upcomingStatus = const TicketsStatus.initial(), final  List<MyTicketModel> myTickets = const [], this.myTicketsStatus = const TicketsStatus.initial(), this.selectedMatchForBooking, this.selectedQuantity = 1, this.bookingStatus = const TicketsStatus.initial(), this.showSuccessModal = false, this.lastBookedMatch}): _upcomingMatches = upcomingMatches,_myTickets = myTickets;
  

@override@JsonKey() final  int selectedTabIndex;
// ─── Upcoming matches (tab 0) ────────────────────────────
 final  List<UpcomingMatchModel> _upcomingMatches;
// ─── Upcoming matches (tab 0) ────────────────────────────
@override@JsonKey() List<UpcomingMatchModel> get upcomingMatches {
  if (_upcomingMatches is EqualUnmodifiableListView) return _upcomingMatches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upcomingMatches);
}

@override@JsonKey() final  TicketsStatus upcomingStatus;
// ─── My tickets (tab 1) ──────────────────────────────────
 final  List<MyTicketModel> _myTickets;
// ─── My tickets (tab 1) ──────────────────────────────────
@override@JsonKey() List<MyTicketModel> get myTickets {
  if (_myTickets is EqualUnmodifiableListView) return _myTickets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_myTickets);
}

@override@JsonKey() final  TicketsStatus myTicketsStatus;
// ─── Booking quantity flow ───────────────────────────────
@override final  UpcomingMatchModel? selectedMatchForBooking;
@override@JsonKey() final  int selectedQuantity;
@override@JsonKey() final  TicketsStatus bookingStatus;
// ─── Success modal ───────────────────────────────────────
@override@JsonKey() final  bool showSuccessModal;
@override final  UpcomingMatchModel? lastBookedMatch;

/// Create a copy of TicketsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketsStateCopyWith<_TicketsState> get copyWith => __$TicketsStateCopyWithImpl<_TicketsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketsState&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&const DeepCollectionEquality().equals(other._upcomingMatches, _upcomingMatches)&&(identical(other.upcomingStatus, upcomingStatus) || other.upcomingStatus == upcomingStatus)&&const DeepCollectionEquality().equals(other._myTickets, _myTickets)&&(identical(other.myTicketsStatus, myTicketsStatus) || other.myTicketsStatus == myTicketsStatus)&&(identical(other.selectedMatchForBooking, selectedMatchForBooking) || other.selectedMatchForBooking == selectedMatchForBooking)&&(identical(other.selectedQuantity, selectedQuantity) || other.selectedQuantity == selectedQuantity)&&(identical(other.bookingStatus, bookingStatus) || other.bookingStatus == bookingStatus)&&(identical(other.showSuccessModal, showSuccessModal) || other.showSuccessModal == showSuccessModal)&&(identical(other.lastBookedMatch, lastBookedMatch) || other.lastBookedMatch == lastBookedMatch));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTabIndex,const DeepCollectionEquality().hash(_upcomingMatches),upcomingStatus,const DeepCollectionEquality().hash(_myTickets),myTicketsStatus,selectedMatchForBooking,selectedQuantity,bookingStatus,showSuccessModal,lastBookedMatch);

@override
String toString() {
  return 'TicketsState(selectedTabIndex: $selectedTabIndex, upcomingMatches: $upcomingMatches, upcomingStatus: $upcomingStatus, myTickets: $myTickets, myTicketsStatus: $myTicketsStatus, selectedMatchForBooking: $selectedMatchForBooking, selectedQuantity: $selectedQuantity, bookingStatus: $bookingStatus, showSuccessModal: $showSuccessModal, lastBookedMatch: $lastBookedMatch)';
}


}

/// @nodoc
abstract mixin class _$TicketsStateCopyWith<$Res> implements $TicketsStateCopyWith<$Res> {
  factory _$TicketsStateCopyWith(_TicketsState value, $Res Function(_TicketsState) _then) = __$TicketsStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedTabIndex, List<UpcomingMatchModel> upcomingMatches, TicketsStatus upcomingStatus, List<MyTicketModel> myTickets, TicketsStatus myTicketsStatus, UpcomingMatchModel? selectedMatchForBooking, int selectedQuantity, TicketsStatus bookingStatus, bool showSuccessModal, UpcomingMatchModel? lastBookedMatch
});


@override $TicketsStatusCopyWith<$Res> get upcomingStatus;@override $TicketsStatusCopyWith<$Res> get myTicketsStatus;@override $TicketsStatusCopyWith<$Res> get bookingStatus;

}
/// @nodoc
class __$TicketsStateCopyWithImpl<$Res>
    implements _$TicketsStateCopyWith<$Res> {
  __$TicketsStateCopyWithImpl(this._self, this._then);

  final _TicketsState _self;
  final $Res Function(_TicketsState) _then;

/// Create a copy of TicketsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTabIndex = null,Object? upcomingMatches = null,Object? upcomingStatus = null,Object? myTickets = null,Object? myTicketsStatus = null,Object? selectedMatchForBooking = freezed,Object? selectedQuantity = null,Object? bookingStatus = null,Object? showSuccessModal = null,Object? lastBookedMatch = freezed,}) {
  return _then(_TicketsState(
selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,upcomingMatches: null == upcomingMatches ? _self._upcomingMatches : upcomingMatches // ignore: cast_nullable_to_non_nullable
as List<UpcomingMatchModel>,upcomingStatus: null == upcomingStatus ? _self.upcomingStatus : upcomingStatus // ignore: cast_nullable_to_non_nullable
as TicketsStatus,myTickets: null == myTickets ? _self._myTickets : myTickets // ignore: cast_nullable_to_non_nullable
as List<MyTicketModel>,myTicketsStatus: null == myTicketsStatus ? _self.myTicketsStatus : myTicketsStatus // ignore: cast_nullable_to_non_nullable
as TicketsStatus,selectedMatchForBooking: freezed == selectedMatchForBooking ? _self.selectedMatchForBooking : selectedMatchForBooking // ignore: cast_nullable_to_non_nullable
as UpcomingMatchModel?,selectedQuantity: null == selectedQuantity ? _self.selectedQuantity : selectedQuantity // ignore: cast_nullable_to_non_nullable
as int,bookingStatus: null == bookingStatus ? _self.bookingStatus : bookingStatus // ignore: cast_nullable_to_non_nullable
as TicketsStatus,showSuccessModal: null == showSuccessModal ? _self.showSuccessModal : showSuccessModal // ignore: cast_nullable_to_non_nullable
as bool,lastBookedMatch: freezed == lastBookedMatch ? _self.lastBookedMatch : lastBookedMatch // ignore: cast_nullable_to_non_nullable
as UpcomingMatchModel?,
  ));
}

/// Create a copy of TicketsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketsStatusCopyWith<$Res> get upcomingStatus {
  
  return $TicketsStatusCopyWith<$Res>(_self.upcomingStatus, (value) {
    return _then(_self.copyWith(upcomingStatus: value));
  });
}/// Create a copy of TicketsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketsStatusCopyWith<$Res> get myTicketsStatus {
  
  return $TicketsStatusCopyWith<$Res>(_self.myTicketsStatus, (value) {
    return _then(_self.copyWith(myTicketsStatus: value));
  });
}/// Create a copy of TicketsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TicketsStatusCopyWith<$Res> get bookingStatus {
  
  return $TicketsStatusCopyWith<$Res>(_self.bookingStatus, (value) {
    return _then(_self.copyWith(bookingStatus: value));
  });
}
}

/// @nodoc
mixin _$TicketsStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketsStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TicketsStatus()';
}


}

/// @nodoc
class $TicketsStatusCopyWith<$Res>  {
$TicketsStatusCopyWith(TicketsStatus _, $Res Function(TicketsStatus) __);
}


/// Adds pattern-matching-related methods to [TicketsStatus].
extension TicketsStatusPatterns on TicketsStatus {
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


class Initial implements TicketsStatus {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TicketsStatus.initial()';
}


}




/// @nodoc


class Loading implements TicketsStatus {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TicketsStatus.loading()';
}


}




/// @nodoc


class Error implements TicketsStatus {
  const Error();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TicketsStatus.error()';
}


}




/// @nodoc


class Success implements TicketsStatus {
  const Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TicketsStatus.success()';
}


}




// dart format on
