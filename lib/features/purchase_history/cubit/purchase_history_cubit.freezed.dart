// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_history_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchaseHistoryState {

 RecordTab get selectedTab; List<TransactionModel> get transactions; int get currentPage; bool get hasMore; PurchaseHistoryStatus get status;
/// Create a copy of PurchaseHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseHistoryStateCopyWith<PurchaseHistoryState> get copyWith => _$PurchaseHistoryStateCopyWithImpl<PurchaseHistoryState>(this as PurchaseHistoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseHistoryState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,const DeepCollectionEquality().hash(transactions),currentPage,hasMore,status);

@override
String toString() {
  return 'PurchaseHistoryState(selectedTab: $selectedTab, transactions: $transactions, currentPage: $currentPage, hasMore: $hasMore, status: $status)';
}


}

/// @nodoc
abstract mixin class $PurchaseHistoryStateCopyWith<$Res>  {
  factory $PurchaseHistoryStateCopyWith(PurchaseHistoryState value, $Res Function(PurchaseHistoryState) _then) = _$PurchaseHistoryStateCopyWithImpl;
@useResult
$Res call({
 RecordTab selectedTab, List<TransactionModel> transactions, int currentPage, bool hasMore, PurchaseHistoryStatus status
});


$PurchaseHistoryStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$PurchaseHistoryStateCopyWithImpl<$Res>
    implements $PurchaseHistoryStateCopyWith<$Res> {
  _$PurchaseHistoryStateCopyWithImpl(this._self, this._then);

  final PurchaseHistoryState _self;
  final $Res Function(PurchaseHistoryState) _then;

/// Create a copy of PurchaseHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTab = null,Object? transactions = null,Object? currentPage = null,Object? hasMore = null,Object? status = null,}) {
  return _then(_self.copyWith(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as RecordTab,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PurchaseHistoryStatus,
  ));
}
/// Create a copy of PurchaseHistoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PurchaseHistoryStatusCopyWith<$Res> get status {
  
  return $PurchaseHistoryStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [PurchaseHistoryState].
extension PurchaseHistoryStatePatterns on PurchaseHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseHistoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseHistoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseHistoryState value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseHistoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseHistoryState value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseHistoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RecordTab selectedTab,  List<TransactionModel> transactions,  int currentPage,  bool hasMore,  PurchaseHistoryStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseHistoryState() when $default != null:
return $default(_that.selectedTab,_that.transactions,_that.currentPage,_that.hasMore,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RecordTab selectedTab,  List<TransactionModel> transactions,  int currentPage,  bool hasMore,  PurchaseHistoryStatus status)  $default,) {final _that = this;
switch (_that) {
case _PurchaseHistoryState():
return $default(_that.selectedTab,_that.transactions,_that.currentPage,_that.hasMore,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RecordTab selectedTab,  List<TransactionModel> transactions,  int currentPage,  bool hasMore,  PurchaseHistoryStatus status)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseHistoryState() when $default != null:
return $default(_that.selectedTab,_that.transactions,_that.currentPage,_that.hasMore,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseHistoryState implements PurchaseHistoryState {
  const _PurchaseHistoryState({this.selectedTab = RecordTab.all, final  List<TransactionModel> transactions = const [], this.currentPage = 1, this.hasMore = true, this.status = const PurchaseHistoryStatus.initial()}): _transactions = transactions;
  

@override@JsonKey() final  RecordTab selectedTab;
 final  List<TransactionModel> _transactions;
@override@JsonKey() List<TransactionModel> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  PurchaseHistoryStatus status;

/// Create a copy of PurchaseHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseHistoryStateCopyWith<_PurchaseHistoryState> get copyWith => __$PurchaseHistoryStateCopyWithImpl<_PurchaseHistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseHistoryState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,const DeepCollectionEquality().hash(_transactions),currentPage,hasMore,status);

@override
String toString() {
  return 'PurchaseHistoryState(selectedTab: $selectedTab, transactions: $transactions, currentPage: $currentPage, hasMore: $hasMore, status: $status)';
}


}

/// @nodoc
abstract mixin class _$PurchaseHistoryStateCopyWith<$Res> implements $PurchaseHistoryStateCopyWith<$Res> {
  factory _$PurchaseHistoryStateCopyWith(_PurchaseHistoryState value, $Res Function(_PurchaseHistoryState) _then) = __$PurchaseHistoryStateCopyWithImpl;
@override @useResult
$Res call({
 RecordTab selectedTab, List<TransactionModel> transactions, int currentPage, bool hasMore, PurchaseHistoryStatus status
});


@override $PurchaseHistoryStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$PurchaseHistoryStateCopyWithImpl<$Res>
    implements _$PurchaseHistoryStateCopyWith<$Res> {
  __$PurchaseHistoryStateCopyWithImpl(this._self, this._then);

  final _PurchaseHistoryState _self;
  final $Res Function(_PurchaseHistoryState) _then;

/// Create a copy of PurchaseHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,Object? transactions = null,Object? currentPage = null,Object? hasMore = null,Object? status = null,}) {
  return _then(_PurchaseHistoryState(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as RecordTab,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PurchaseHistoryStatus,
  ));
}

/// Create a copy of PurchaseHistoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PurchaseHistoryStatusCopyWith<$Res> get status {
  
  return $PurchaseHistoryStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

/// @nodoc
mixin _$PurchaseHistoryStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseHistoryStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PurchaseHistoryStatus()';
}


}

/// @nodoc
class $PurchaseHistoryStatusCopyWith<$Res>  {
$PurchaseHistoryStatusCopyWith(PurchaseHistoryStatus _, $Res Function(PurchaseHistoryStatus) __);
}


/// Adds pattern-matching-related methods to [PurchaseHistoryStatus].
extension PurchaseHistoryStatusPatterns on PurchaseHistoryStatus {
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


class Initial implements PurchaseHistoryStatus {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PurchaseHistoryStatus.initial()';
}


}




/// @nodoc


class Loading implements PurchaseHistoryStatus {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PurchaseHistoryStatus.loading()';
}


}




/// @nodoc


class Error implements PurchaseHistoryStatus {
  const Error();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PurchaseHistoryStatus.error()';
}


}




/// @nodoc


class Success implements PurchaseHistoryStatus {
  const Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PurchaseHistoryStatus.success()';
}


}




// dart format on
