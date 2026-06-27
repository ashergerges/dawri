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

 RecordTab get selectedTab;
/// Create a copy of PurchaseHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseHistoryStateCopyWith<PurchaseHistoryState> get copyWith => _$PurchaseHistoryStateCopyWithImpl<PurchaseHistoryState>(this as PurchaseHistoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseHistoryState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab);

@override
String toString() {
  return 'PurchaseHistoryState(selectedTab: $selectedTab)';
}


}

/// @nodoc
abstract mixin class $PurchaseHistoryStateCopyWith<$Res>  {
  factory $PurchaseHistoryStateCopyWith(PurchaseHistoryState value, $Res Function(PurchaseHistoryState) _then) = _$PurchaseHistoryStateCopyWithImpl;
@useResult
$Res call({
 RecordTab selectedTab
});




}
/// @nodoc
class _$PurchaseHistoryStateCopyWithImpl<$Res>
    implements $PurchaseHistoryStateCopyWith<$Res> {
  _$PurchaseHistoryStateCopyWithImpl(this._self, this._then);

  final PurchaseHistoryState _self;
  final $Res Function(PurchaseHistoryState) _then;

/// Create a copy of PurchaseHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTab = null,}) {
  return _then(_self.copyWith(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as RecordTab,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RecordTab selectedTab)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseHistoryState() when $default != null:
return $default(_that.selectedTab);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RecordTab selectedTab)  $default,) {final _that = this;
switch (_that) {
case _PurchaseHistoryState():
return $default(_that.selectedTab);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RecordTab selectedTab)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseHistoryState() when $default != null:
return $default(_that.selectedTab);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseHistoryState implements PurchaseHistoryState {
  const _PurchaseHistoryState({this.selectedTab = RecordTab.all});
  

@override@JsonKey() final  RecordTab selectedTab;

/// Create a copy of PurchaseHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseHistoryStateCopyWith<_PurchaseHistoryState> get copyWith => __$PurchaseHistoryStateCopyWithImpl<_PurchaseHistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseHistoryState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab);

@override
String toString() {
  return 'PurchaseHistoryState(selectedTab: $selectedTab)';
}


}

/// @nodoc
abstract mixin class _$PurchaseHistoryStateCopyWith<$Res> implements $PurchaseHistoryStateCopyWith<$Res> {
  factory _$PurchaseHistoryStateCopyWith(_PurchaseHistoryState value, $Res Function(_PurchaseHistoryState) _then) = __$PurchaseHistoryStateCopyWithImpl;
@override @useResult
$Res call({
 RecordTab selectedTab
});




}
/// @nodoc
class __$PurchaseHistoryStateCopyWithImpl<$Res>
    implements _$PurchaseHistoryStateCopyWith<$Res> {
  __$PurchaseHistoryStateCopyWithImpl(this._self, this._then);

  final _PurchaseHistoryState _self;
  final $Res Function(_PurchaseHistoryState) _then;

/// Create a copy of PurchaseHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,}) {
  return _then(_PurchaseHistoryState(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as RecordTab,
  ));
}


}

// dart format on
