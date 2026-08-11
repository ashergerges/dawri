// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reserve_now_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReserveNowState {

// ─── Date ────────────────────────────────────────────────
/// The same week strip the stadiums list shows, so the booking date can be
/// changed here instead of going back.
 List<DateOption> get dates; int get selectedDateIndex;// ─── Stadium details ─────────────────────────────────────
 StadiumDetailsModel? get stadium; ReserveStatus get stadiumStatus;// ─── Durations ───────────────────────────────────────────
 List<BookingDurationModel> get durations; ReserveStatus get durationsStatus; BookingDurationModel? get selectedDuration;// ─── Slots ───────────────────────────────────────────────
 List<BookingSlotModel> get slots; ReserveStatus get slotsStatus; BookingSlotModel? get selectedSlot;// ─── Payment (static) ────────────────────────────────────
 int get selectedPaymentIndex;// ─── Booking submission ──────────────────────────────────
 ReserveStatus get bookingStatus; String? get bookingMessage;
/// Create a copy of ReserveNowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReserveNowStateCopyWith<ReserveNowState> get copyWith => _$ReserveNowStateCopyWithImpl<ReserveNowState>(this as ReserveNowState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReserveNowState&&const DeepCollectionEquality().equals(other.dates, dates)&&(identical(other.selectedDateIndex, selectedDateIndex) || other.selectedDateIndex == selectedDateIndex)&&(identical(other.stadium, stadium) || other.stadium == stadium)&&(identical(other.stadiumStatus, stadiumStatus) || other.stadiumStatus == stadiumStatus)&&const DeepCollectionEquality().equals(other.durations, durations)&&(identical(other.durationsStatus, durationsStatus) || other.durationsStatus == durationsStatus)&&(identical(other.selectedDuration, selectedDuration) || other.selectedDuration == selectedDuration)&&const DeepCollectionEquality().equals(other.slots, slots)&&(identical(other.slotsStatus, slotsStatus) || other.slotsStatus == slotsStatus)&&(identical(other.selectedSlot, selectedSlot) || other.selectedSlot == selectedSlot)&&(identical(other.selectedPaymentIndex, selectedPaymentIndex) || other.selectedPaymentIndex == selectedPaymentIndex)&&(identical(other.bookingStatus, bookingStatus) || other.bookingStatus == bookingStatus)&&(identical(other.bookingMessage, bookingMessage) || other.bookingMessage == bookingMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(dates),selectedDateIndex,stadium,stadiumStatus,const DeepCollectionEquality().hash(durations),durationsStatus,selectedDuration,const DeepCollectionEquality().hash(slots),slotsStatus,selectedSlot,selectedPaymentIndex,bookingStatus,bookingMessage);

@override
String toString() {
  return 'ReserveNowState(dates: $dates, selectedDateIndex: $selectedDateIndex, stadium: $stadium, stadiumStatus: $stadiumStatus, durations: $durations, durationsStatus: $durationsStatus, selectedDuration: $selectedDuration, slots: $slots, slotsStatus: $slotsStatus, selectedSlot: $selectedSlot, selectedPaymentIndex: $selectedPaymentIndex, bookingStatus: $bookingStatus, bookingMessage: $bookingMessage)';
}


}

/// @nodoc
abstract mixin class $ReserveNowStateCopyWith<$Res>  {
  factory $ReserveNowStateCopyWith(ReserveNowState value, $Res Function(ReserveNowState) _then) = _$ReserveNowStateCopyWithImpl;
@useResult
$Res call({
 List<DateOption> dates, int selectedDateIndex, StadiumDetailsModel? stadium, ReserveStatus stadiumStatus, List<BookingDurationModel> durations, ReserveStatus durationsStatus, BookingDurationModel? selectedDuration, List<BookingSlotModel> slots, ReserveStatus slotsStatus, BookingSlotModel? selectedSlot, int selectedPaymentIndex, ReserveStatus bookingStatus, String? bookingMessage
});


$ReserveStatusCopyWith<$Res> get stadiumStatus;$ReserveStatusCopyWith<$Res> get durationsStatus;$ReserveStatusCopyWith<$Res> get slotsStatus;$ReserveStatusCopyWith<$Res> get bookingStatus;

}
/// @nodoc
class _$ReserveNowStateCopyWithImpl<$Res>
    implements $ReserveNowStateCopyWith<$Res> {
  _$ReserveNowStateCopyWithImpl(this._self, this._then);

  final ReserveNowState _self;
  final $Res Function(ReserveNowState) _then;

/// Create a copy of ReserveNowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dates = null,Object? selectedDateIndex = null,Object? stadium = freezed,Object? stadiumStatus = null,Object? durations = null,Object? durationsStatus = null,Object? selectedDuration = freezed,Object? slots = null,Object? slotsStatus = null,Object? selectedSlot = freezed,Object? selectedPaymentIndex = null,Object? bookingStatus = null,Object? bookingMessage = freezed,}) {
  return _then(_self.copyWith(
dates: null == dates ? _self.dates : dates // ignore: cast_nullable_to_non_nullable
as List<DateOption>,selectedDateIndex: null == selectedDateIndex ? _self.selectedDateIndex : selectedDateIndex // ignore: cast_nullable_to_non_nullable
as int,stadium: freezed == stadium ? _self.stadium : stadium // ignore: cast_nullable_to_non_nullable
as StadiumDetailsModel?,stadiumStatus: null == stadiumStatus ? _self.stadiumStatus : stadiumStatus // ignore: cast_nullable_to_non_nullable
as ReserveStatus,durations: null == durations ? _self.durations : durations // ignore: cast_nullable_to_non_nullable
as List<BookingDurationModel>,durationsStatus: null == durationsStatus ? _self.durationsStatus : durationsStatus // ignore: cast_nullable_to_non_nullable
as ReserveStatus,selectedDuration: freezed == selectedDuration ? _self.selectedDuration : selectedDuration // ignore: cast_nullable_to_non_nullable
as BookingDurationModel?,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<BookingSlotModel>,slotsStatus: null == slotsStatus ? _self.slotsStatus : slotsStatus // ignore: cast_nullable_to_non_nullable
as ReserveStatus,selectedSlot: freezed == selectedSlot ? _self.selectedSlot : selectedSlot // ignore: cast_nullable_to_non_nullable
as BookingSlotModel?,selectedPaymentIndex: null == selectedPaymentIndex ? _self.selectedPaymentIndex : selectedPaymentIndex // ignore: cast_nullable_to_non_nullable
as int,bookingStatus: null == bookingStatus ? _self.bookingStatus : bookingStatus // ignore: cast_nullable_to_non_nullable
as ReserveStatus,bookingMessage: freezed == bookingMessage ? _self.bookingMessage : bookingMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ReserveNowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReserveStatusCopyWith<$Res> get stadiumStatus {
  
  return $ReserveStatusCopyWith<$Res>(_self.stadiumStatus, (value) {
    return _then(_self.copyWith(stadiumStatus: value));
  });
}/// Create a copy of ReserveNowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReserveStatusCopyWith<$Res> get durationsStatus {
  
  return $ReserveStatusCopyWith<$Res>(_self.durationsStatus, (value) {
    return _then(_self.copyWith(durationsStatus: value));
  });
}/// Create a copy of ReserveNowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReserveStatusCopyWith<$Res> get slotsStatus {
  
  return $ReserveStatusCopyWith<$Res>(_self.slotsStatus, (value) {
    return _then(_self.copyWith(slotsStatus: value));
  });
}/// Create a copy of ReserveNowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReserveStatusCopyWith<$Res> get bookingStatus {
  
  return $ReserveStatusCopyWith<$Res>(_self.bookingStatus, (value) {
    return _then(_self.copyWith(bookingStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReserveNowState].
extension ReserveNowStatePatterns on ReserveNowState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReserveNowState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReserveNowState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReserveNowState value)  $default,){
final _that = this;
switch (_that) {
case _ReserveNowState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReserveNowState value)?  $default,){
final _that = this;
switch (_that) {
case _ReserveNowState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DateOption> dates,  int selectedDateIndex,  StadiumDetailsModel? stadium,  ReserveStatus stadiumStatus,  List<BookingDurationModel> durations,  ReserveStatus durationsStatus,  BookingDurationModel? selectedDuration,  List<BookingSlotModel> slots,  ReserveStatus slotsStatus,  BookingSlotModel? selectedSlot,  int selectedPaymentIndex,  ReserveStatus bookingStatus,  String? bookingMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReserveNowState() when $default != null:
return $default(_that.dates,_that.selectedDateIndex,_that.stadium,_that.stadiumStatus,_that.durations,_that.durationsStatus,_that.selectedDuration,_that.slots,_that.slotsStatus,_that.selectedSlot,_that.selectedPaymentIndex,_that.bookingStatus,_that.bookingMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DateOption> dates,  int selectedDateIndex,  StadiumDetailsModel? stadium,  ReserveStatus stadiumStatus,  List<BookingDurationModel> durations,  ReserveStatus durationsStatus,  BookingDurationModel? selectedDuration,  List<BookingSlotModel> slots,  ReserveStatus slotsStatus,  BookingSlotModel? selectedSlot,  int selectedPaymentIndex,  ReserveStatus bookingStatus,  String? bookingMessage)  $default,) {final _that = this;
switch (_that) {
case _ReserveNowState():
return $default(_that.dates,_that.selectedDateIndex,_that.stadium,_that.stadiumStatus,_that.durations,_that.durationsStatus,_that.selectedDuration,_that.slots,_that.slotsStatus,_that.selectedSlot,_that.selectedPaymentIndex,_that.bookingStatus,_that.bookingMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DateOption> dates,  int selectedDateIndex,  StadiumDetailsModel? stadium,  ReserveStatus stadiumStatus,  List<BookingDurationModel> durations,  ReserveStatus durationsStatus,  BookingDurationModel? selectedDuration,  List<BookingSlotModel> slots,  ReserveStatus slotsStatus,  BookingSlotModel? selectedSlot,  int selectedPaymentIndex,  ReserveStatus bookingStatus,  String? bookingMessage)?  $default,) {final _that = this;
switch (_that) {
case _ReserveNowState() when $default != null:
return $default(_that.dates,_that.selectedDateIndex,_that.stadium,_that.stadiumStatus,_that.durations,_that.durationsStatus,_that.selectedDuration,_that.slots,_that.slotsStatus,_that.selectedSlot,_that.selectedPaymentIndex,_that.bookingStatus,_that.bookingMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ReserveNowState extends ReserveNowState {
  const _ReserveNowState({final  List<DateOption> dates = const [], this.selectedDateIndex = 0, this.stadium, this.stadiumStatus = const ReserveStatus.initial(), final  List<BookingDurationModel> durations = const [], this.durationsStatus = const ReserveStatus.initial(), this.selectedDuration, final  List<BookingSlotModel> slots = const [], this.slotsStatus = const ReserveStatus.initial(), this.selectedSlot, this.selectedPaymentIndex = 0, this.bookingStatus = const ReserveStatus.initial(), this.bookingMessage}): _dates = dates,_durations = durations,_slots = slots,super._();
  

// ─── Date ────────────────────────────────────────────────
/// The same week strip the stadiums list shows, so the booking date can be
/// changed here instead of going back.
 final  List<DateOption> _dates;
// ─── Date ────────────────────────────────────────────────
/// The same week strip the stadiums list shows, so the booking date can be
/// changed here instead of going back.
@override@JsonKey() List<DateOption> get dates {
  if (_dates is EqualUnmodifiableListView) return _dates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dates);
}

@override@JsonKey() final  int selectedDateIndex;
// ─── Stadium details ─────────────────────────────────────
@override final  StadiumDetailsModel? stadium;
@override@JsonKey() final  ReserveStatus stadiumStatus;
// ─── Durations ───────────────────────────────────────────
 final  List<BookingDurationModel> _durations;
// ─── Durations ───────────────────────────────────────────
@override@JsonKey() List<BookingDurationModel> get durations {
  if (_durations is EqualUnmodifiableListView) return _durations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_durations);
}

@override@JsonKey() final  ReserveStatus durationsStatus;
@override final  BookingDurationModel? selectedDuration;
// ─── Slots ───────────────────────────────────────────────
 final  List<BookingSlotModel> _slots;
// ─── Slots ───────────────────────────────────────────────
@override@JsonKey() List<BookingSlotModel> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}

@override@JsonKey() final  ReserveStatus slotsStatus;
@override final  BookingSlotModel? selectedSlot;
// ─── Payment (static) ────────────────────────────────────
@override@JsonKey() final  int selectedPaymentIndex;
// ─── Booking submission ──────────────────────────────────
@override@JsonKey() final  ReserveStatus bookingStatus;
@override final  String? bookingMessage;

/// Create a copy of ReserveNowState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReserveNowStateCopyWith<_ReserveNowState> get copyWith => __$ReserveNowStateCopyWithImpl<_ReserveNowState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReserveNowState&&const DeepCollectionEquality().equals(other._dates, _dates)&&(identical(other.selectedDateIndex, selectedDateIndex) || other.selectedDateIndex == selectedDateIndex)&&(identical(other.stadium, stadium) || other.stadium == stadium)&&(identical(other.stadiumStatus, stadiumStatus) || other.stadiumStatus == stadiumStatus)&&const DeepCollectionEquality().equals(other._durations, _durations)&&(identical(other.durationsStatus, durationsStatus) || other.durationsStatus == durationsStatus)&&(identical(other.selectedDuration, selectedDuration) || other.selectedDuration == selectedDuration)&&const DeepCollectionEquality().equals(other._slots, _slots)&&(identical(other.slotsStatus, slotsStatus) || other.slotsStatus == slotsStatus)&&(identical(other.selectedSlot, selectedSlot) || other.selectedSlot == selectedSlot)&&(identical(other.selectedPaymentIndex, selectedPaymentIndex) || other.selectedPaymentIndex == selectedPaymentIndex)&&(identical(other.bookingStatus, bookingStatus) || other.bookingStatus == bookingStatus)&&(identical(other.bookingMessage, bookingMessage) || other.bookingMessage == bookingMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_dates),selectedDateIndex,stadium,stadiumStatus,const DeepCollectionEquality().hash(_durations),durationsStatus,selectedDuration,const DeepCollectionEquality().hash(_slots),slotsStatus,selectedSlot,selectedPaymentIndex,bookingStatus,bookingMessage);

@override
String toString() {
  return 'ReserveNowState(dates: $dates, selectedDateIndex: $selectedDateIndex, stadium: $stadium, stadiumStatus: $stadiumStatus, durations: $durations, durationsStatus: $durationsStatus, selectedDuration: $selectedDuration, slots: $slots, slotsStatus: $slotsStatus, selectedSlot: $selectedSlot, selectedPaymentIndex: $selectedPaymentIndex, bookingStatus: $bookingStatus, bookingMessage: $bookingMessage)';
}


}

/// @nodoc
abstract mixin class _$ReserveNowStateCopyWith<$Res> implements $ReserveNowStateCopyWith<$Res> {
  factory _$ReserveNowStateCopyWith(_ReserveNowState value, $Res Function(_ReserveNowState) _then) = __$ReserveNowStateCopyWithImpl;
@override @useResult
$Res call({
 List<DateOption> dates, int selectedDateIndex, StadiumDetailsModel? stadium, ReserveStatus stadiumStatus, List<BookingDurationModel> durations, ReserveStatus durationsStatus, BookingDurationModel? selectedDuration, List<BookingSlotModel> slots, ReserveStatus slotsStatus, BookingSlotModel? selectedSlot, int selectedPaymentIndex, ReserveStatus bookingStatus, String? bookingMessage
});


@override $ReserveStatusCopyWith<$Res> get stadiumStatus;@override $ReserveStatusCopyWith<$Res> get durationsStatus;@override $ReserveStatusCopyWith<$Res> get slotsStatus;@override $ReserveStatusCopyWith<$Res> get bookingStatus;

}
/// @nodoc
class __$ReserveNowStateCopyWithImpl<$Res>
    implements _$ReserveNowStateCopyWith<$Res> {
  __$ReserveNowStateCopyWithImpl(this._self, this._then);

  final _ReserveNowState _self;
  final $Res Function(_ReserveNowState) _then;

/// Create a copy of ReserveNowState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dates = null,Object? selectedDateIndex = null,Object? stadium = freezed,Object? stadiumStatus = null,Object? durations = null,Object? durationsStatus = null,Object? selectedDuration = freezed,Object? slots = null,Object? slotsStatus = null,Object? selectedSlot = freezed,Object? selectedPaymentIndex = null,Object? bookingStatus = null,Object? bookingMessage = freezed,}) {
  return _then(_ReserveNowState(
dates: null == dates ? _self._dates : dates // ignore: cast_nullable_to_non_nullable
as List<DateOption>,selectedDateIndex: null == selectedDateIndex ? _self.selectedDateIndex : selectedDateIndex // ignore: cast_nullable_to_non_nullable
as int,stadium: freezed == stadium ? _self.stadium : stadium // ignore: cast_nullable_to_non_nullable
as StadiumDetailsModel?,stadiumStatus: null == stadiumStatus ? _self.stadiumStatus : stadiumStatus // ignore: cast_nullable_to_non_nullable
as ReserveStatus,durations: null == durations ? _self._durations : durations // ignore: cast_nullable_to_non_nullable
as List<BookingDurationModel>,durationsStatus: null == durationsStatus ? _self.durationsStatus : durationsStatus // ignore: cast_nullable_to_non_nullable
as ReserveStatus,selectedDuration: freezed == selectedDuration ? _self.selectedDuration : selectedDuration // ignore: cast_nullable_to_non_nullable
as BookingDurationModel?,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<BookingSlotModel>,slotsStatus: null == slotsStatus ? _self.slotsStatus : slotsStatus // ignore: cast_nullable_to_non_nullable
as ReserveStatus,selectedSlot: freezed == selectedSlot ? _self.selectedSlot : selectedSlot // ignore: cast_nullable_to_non_nullable
as BookingSlotModel?,selectedPaymentIndex: null == selectedPaymentIndex ? _self.selectedPaymentIndex : selectedPaymentIndex // ignore: cast_nullable_to_non_nullable
as int,bookingStatus: null == bookingStatus ? _self.bookingStatus : bookingStatus // ignore: cast_nullable_to_non_nullable
as ReserveStatus,bookingMessage: freezed == bookingMessage ? _self.bookingMessage : bookingMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ReserveNowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReserveStatusCopyWith<$Res> get stadiumStatus {
  
  return $ReserveStatusCopyWith<$Res>(_self.stadiumStatus, (value) {
    return _then(_self.copyWith(stadiumStatus: value));
  });
}/// Create a copy of ReserveNowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReserveStatusCopyWith<$Res> get durationsStatus {
  
  return $ReserveStatusCopyWith<$Res>(_self.durationsStatus, (value) {
    return _then(_self.copyWith(durationsStatus: value));
  });
}/// Create a copy of ReserveNowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReserveStatusCopyWith<$Res> get slotsStatus {
  
  return $ReserveStatusCopyWith<$Res>(_self.slotsStatus, (value) {
    return _then(_self.copyWith(slotsStatus: value));
  });
}/// Create a copy of ReserveNowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReserveStatusCopyWith<$Res> get bookingStatus {
  
  return $ReserveStatusCopyWith<$Res>(_self.bookingStatus, (value) {
    return _then(_self.copyWith(bookingStatus: value));
  });
}
}

/// @nodoc
mixin _$ReserveStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReserveStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReserveStatus()';
}


}

/// @nodoc
class $ReserveStatusCopyWith<$Res>  {
$ReserveStatusCopyWith(ReserveStatus _, $Res Function(ReserveStatus) __);
}


/// Adds pattern-matching-related methods to [ReserveStatus].
extension ReserveStatusPatterns on ReserveStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ReserveStatusInitial value)?  initial,TResult Function( ReserveStatusLoading value)?  loading,TResult Function( ReserveStatusSuccess value)?  success,TResult Function( ReserveStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ReserveStatusInitial() when initial != null:
return initial(_that);case ReserveStatusLoading() when loading != null:
return loading(_that);case ReserveStatusSuccess() when success != null:
return success(_that);case ReserveStatusError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ReserveStatusInitial value)  initial,required TResult Function( ReserveStatusLoading value)  loading,required TResult Function( ReserveStatusSuccess value)  success,required TResult Function( ReserveStatusError value)  error,}){
final _that = this;
switch (_that) {
case ReserveStatusInitial():
return initial(_that);case ReserveStatusLoading():
return loading(_that);case ReserveStatusSuccess():
return success(_that);case ReserveStatusError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ReserveStatusInitial value)?  initial,TResult? Function( ReserveStatusLoading value)?  loading,TResult? Function( ReserveStatusSuccess value)?  success,TResult? Function( ReserveStatusError value)?  error,}){
final _that = this;
switch (_that) {
case ReserveStatusInitial() when initial != null:
return initial(_that);case ReserveStatusLoading() when loading != null:
return loading(_that);case ReserveStatusSuccess() when success != null:
return success(_that);case ReserveStatusError() when error != null:
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
case ReserveStatusInitial() when initial != null:
return initial();case ReserveStatusLoading() when loading != null:
return loading();case ReserveStatusSuccess() when success != null:
return success();case ReserveStatusError() when error != null:
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
case ReserveStatusInitial():
return initial();case ReserveStatusLoading():
return loading();case ReserveStatusSuccess():
return success();case ReserveStatusError():
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
case ReserveStatusInitial() when initial != null:
return initial();case ReserveStatusLoading() when loading != null:
return loading();case ReserveStatusSuccess() when success != null:
return success();case ReserveStatusError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class ReserveStatusInitial implements ReserveStatus {
  const ReserveStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReserveStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReserveStatus.initial()';
}


}




/// @nodoc


class ReserveStatusLoading implements ReserveStatus {
  const ReserveStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReserveStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReserveStatus.loading()';
}


}




/// @nodoc


class ReserveStatusSuccess implements ReserveStatus {
  const ReserveStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReserveStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReserveStatus.success()';
}


}




/// @nodoc


class ReserveStatusError implements ReserveStatus {
  const ReserveStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReserveStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReserveStatus.error()';
}


}




// dart format on
