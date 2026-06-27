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

 int get selectedTabIndex; List<PendingContractModel> get pendingContracts; List<ActiveContractModel> get activeContracts; List<HistoryContractModel> get historyContracts;
/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractsStateCopyWith<ContractsState> get copyWith => _$ContractsStateCopyWithImpl<ContractsState>(this as ContractsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractsState&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&const DeepCollectionEquality().equals(other.pendingContracts, pendingContracts)&&const DeepCollectionEquality().equals(other.activeContracts, activeContracts)&&const DeepCollectionEquality().equals(other.historyContracts, historyContracts));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTabIndex,const DeepCollectionEquality().hash(pendingContracts),const DeepCollectionEquality().hash(activeContracts),const DeepCollectionEquality().hash(historyContracts));

@override
String toString() {
  return 'ContractsState(selectedTabIndex: $selectedTabIndex, pendingContracts: $pendingContracts, activeContracts: $activeContracts, historyContracts: $historyContracts)';
}


}

/// @nodoc
abstract mixin class $ContractsStateCopyWith<$Res>  {
  factory $ContractsStateCopyWith(ContractsState value, $Res Function(ContractsState) _then) = _$ContractsStateCopyWithImpl;
@useResult
$Res call({
 int selectedTabIndex, List<PendingContractModel> pendingContracts, List<ActiveContractModel> activeContracts, List<HistoryContractModel> historyContracts
});




}
/// @nodoc
class _$ContractsStateCopyWithImpl<$Res>
    implements $ContractsStateCopyWith<$Res> {
  _$ContractsStateCopyWithImpl(this._self, this._then);

  final ContractsState _self;
  final $Res Function(ContractsState) _then;

/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTabIndex = null,Object? pendingContracts = null,Object? activeContracts = null,Object? historyContracts = null,}) {
  return _then(_self.copyWith(
selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,pendingContracts: null == pendingContracts ? _self.pendingContracts : pendingContracts // ignore: cast_nullable_to_non_nullable
as List<PendingContractModel>,activeContracts: null == activeContracts ? _self.activeContracts : activeContracts // ignore: cast_nullable_to_non_nullable
as List<ActiveContractModel>,historyContracts: null == historyContracts ? _self.historyContracts : historyContracts // ignore: cast_nullable_to_non_nullable
as List<HistoryContractModel>,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int selectedTabIndex,  List<PendingContractModel> pendingContracts,  List<ActiveContractModel> activeContracts,  List<HistoryContractModel> historyContracts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractsState() when $default != null:
return $default(_that.selectedTabIndex,_that.pendingContracts,_that.activeContracts,_that.historyContracts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int selectedTabIndex,  List<PendingContractModel> pendingContracts,  List<ActiveContractModel> activeContracts,  List<HistoryContractModel> historyContracts)  $default,) {final _that = this;
switch (_that) {
case _ContractsState():
return $default(_that.selectedTabIndex,_that.pendingContracts,_that.activeContracts,_that.historyContracts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int selectedTabIndex,  List<PendingContractModel> pendingContracts,  List<ActiveContractModel> activeContracts,  List<HistoryContractModel> historyContracts)?  $default,) {final _that = this;
switch (_that) {
case _ContractsState() when $default != null:
return $default(_that.selectedTabIndex,_that.pendingContracts,_that.activeContracts,_that.historyContracts);case _:
  return null;

}
}

}

/// @nodoc


class _ContractsState implements ContractsState {
  const _ContractsState({this.selectedTabIndex = 0, final  List<PendingContractModel> pendingContracts = ContractsMockData.pendingContracts, final  List<ActiveContractModel> activeContracts = ContractsMockData.activeContracts, final  List<HistoryContractModel> historyContracts = ContractsMockData.historyContracts}): _pendingContracts = pendingContracts,_activeContracts = activeContracts,_historyContracts = historyContracts;
  

@override@JsonKey() final  int selectedTabIndex;
 final  List<PendingContractModel> _pendingContracts;
@override@JsonKey() List<PendingContractModel> get pendingContracts {
  if (_pendingContracts is EqualUnmodifiableListView) return _pendingContracts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pendingContracts);
}

 final  List<ActiveContractModel> _activeContracts;
@override@JsonKey() List<ActiveContractModel> get activeContracts {
  if (_activeContracts is EqualUnmodifiableListView) return _activeContracts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeContracts);
}

 final  List<HistoryContractModel> _historyContracts;
@override@JsonKey() List<HistoryContractModel> get historyContracts {
  if (_historyContracts is EqualUnmodifiableListView) return _historyContracts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_historyContracts);
}


/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractsStateCopyWith<_ContractsState> get copyWith => __$ContractsStateCopyWithImpl<_ContractsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractsState&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&const DeepCollectionEquality().equals(other._pendingContracts, _pendingContracts)&&const DeepCollectionEquality().equals(other._activeContracts, _activeContracts)&&const DeepCollectionEquality().equals(other._historyContracts, _historyContracts));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTabIndex,const DeepCollectionEquality().hash(_pendingContracts),const DeepCollectionEquality().hash(_activeContracts),const DeepCollectionEquality().hash(_historyContracts));

@override
String toString() {
  return 'ContractsState(selectedTabIndex: $selectedTabIndex, pendingContracts: $pendingContracts, activeContracts: $activeContracts, historyContracts: $historyContracts)';
}


}

/// @nodoc
abstract mixin class _$ContractsStateCopyWith<$Res> implements $ContractsStateCopyWith<$Res> {
  factory _$ContractsStateCopyWith(_ContractsState value, $Res Function(_ContractsState) _then) = __$ContractsStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedTabIndex, List<PendingContractModel> pendingContracts, List<ActiveContractModel> activeContracts, List<HistoryContractModel> historyContracts
});




}
/// @nodoc
class __$ContractsStateCopyWithImpl<$Res>
    implements _$ContractsStateCopyWith<$Res> {
  __$ContractsStateCopyWithImpl(this._self, this._then);

  final _ContractsState _self;
  final $Res Function(_ContractsState) _then;

/// Create a copy of ContractsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTabIndex = null,Object? pendingContracts = null,Object? activeContracts = null,Object? historyContracts = null,}) {
  return _then(_ContractsState(
selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,pendingContracts: null == pendingContracts ? _self._pendingContracts : pendingContracts // ignore: cast_nullable_to_non_nullable
as List<PendingContractModel>,activeContracts: null == activeContracts ? _self._activeContracts : activeContracts // ignore: cast_nullable_to_non_nullable
as List<ActiveContractModel>,historyContracts: null == historyContracts ? _self._historyContracts : historyContracts // ignore: cast_nullable_to_non_nullable
as List<HistoryContractModel>,
  ));
}


}

// dart format on
