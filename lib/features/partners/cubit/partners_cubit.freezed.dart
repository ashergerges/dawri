// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partners_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PartnersState {

// ─── Tabs (participant types) ────────────────────────────
 List<ParticipantTypeModel> get types; PartnersStatus get typesStatus; int get selectedTypeId;// ─── List ────────────────────────────────────────────────
 List<ParticipantIndividualModel> get individuals; List<ParticipantTeamModel> get teams; PartnersStatus get listStatus; int get page; String get searchQuery;// ─── Join requests in flight ─────────────────────────────
 Set<int> get joiningTeamIds;
/// Create a copy of PartnersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnersStateCopyWith<PartnersState> get copyWith => _$PartnersStateCopyWithImpl<PartnersState>(this as PartnersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnersState&&const DeepCollectionEquality().equals(other.types, types)&&(identical(other.typesStatus, typesStatus) || other.typesStatus == typesStatus)&&(identical(other.selectedTypeId, selectedTypeId) || other.selectedTypeId == selectedTypeId)&&const DeepCollectionEquality().equals(other.individuals, individuals)&&const DeepCollectionEquality().equals(other.teams, teams)&&(identical(other.listStatus, listStatus) || other.listStatus == listStatus)&&(identical(other.page, page) || other.page == page)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other.joiningTeamIds, joiningTeamIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(types),typesStatus,selectedTypeId,const DeepCollectionEquality().hash(individuals),const DeepCollectionEquality().hash(teams),listStatus,page,searchQuery,const DeepCollectionEquality().hash(joiningTeamIds));

@override
String toString() {
  return 'PartnersState(types: $types, typesStatus: $typesStatus, selectedTypeId: $selectedTypeId, individuals: $individuals, teams: $teams, listStatus: $listStatus, page: $page, searchQuery: $searchQuery, joiningTeamIds: $joiningTeamIds)';
}


}

/// @nodoc
abstract mixin class $PartnersStateCopyWith<$Res>  {
  factory $PartnersStateCopyWith(PartnersState value, $Res Function(PartnersState) _then) = _$PartnersStateCopyWithImpl;
@useResult
$Res call({
 List<ParticipantTypeModel> types, PartnersStatus typesStatus, int selectedTypeId, List<ParticipantIndividualModel> individuals, List<ParticipantTeamModel> teams, PartnersStatus listStatus, int page, String searchQuery, Set<int> joiningTeamIds
});


$PartnersStatusCopyWith<$Res> get typesStatus;$PartnersStatusCopyWith<$Res> get listStatus;

}
/// @nodoc
class _$PartnersStateCopyWithImpl<$Res>
    implements $PartnersStateCopyWith<$Res> {
  _$PartnersStateCopyWithImpl(this._self, this._then);

  final PartnersState _self;
  final $Res Function(PartnersState) _then;

/// Create a copy of PartnersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? types = null,Object? typesStatus = null,Object? selectedTypeId = null,Object? individuals = null,Object? teams = null,Object? listStatus = null,Object? page = null,Object? searchQuery = null,Object? joiningTeamIds = null,}) {
  return _then(_self.copyWith(
types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<ParticipantTypeModel>,typesStatus: null == typesStatus ? _self.typesStatus : typesStatus // ignore: cast_nullable_to_non_nullable
as PartnersStatus,selectedTypeId: null == selectedTypeId ? _self.selectedTypeId : selectedTypeId // ignore: cast_nullable_to_non_nullable
as int,individuals: null == individuals ? _self.individuals : individuals // ignore: cast_nullable_to_non_nullable
as List<ParticipantIndividualModel>,teams: null == teams ? _self.teams : teams // ignore: cast_nullable_to_non_nullable
as List<ParticipantTeamModel>,listStatus: null == listStatus ? _self.listStatus : listStatus // ignore: cast_nullable_to_non_nullable
as PartnersStatus,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,joiningTeamIds: null == joiningTeamIds ? _self.joiningTeamIds : joiningTeamIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}
/// Create a copy of PartnersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartnersStatusCopyWith<$Res> get typesStatus {
  
  return $PartnersStatusCopyWith<$Res>(_self.typesStatus, (value) {
    return _then(_self.copyWith(typesStatus: value));
  });
}/// Create a copy of PartnersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartnersStatusCopyWith<$Res> get listStatus {
  
  return $PartnersStatusCopyWith<$Res>(_self.listStatus, (value) {
    return _then(_self.copyWith(listStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartnersState].
extension PartnersStatePatterns on PartnersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartnersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartnersState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartnersState value)  $default,){
final _that = this;
switch (_that) {
case _PartnersState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartnersState value)?  $default,){
final _that = this;
switch (_that) {
case _PartnersState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ParticipantTypeModel> types,  PartnersStatus typesStatus,  int selectedTypeId,  List<ParticipantIndividualModel> individuals,  List<ParticipantTeamModel> teams,  PartnersStatus listStatus,  int page,  String searchQuery,  Set<int> joiningTeamIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartnersState() when $default != null:
return $default(_that.types,_that.typesStatus,_that.selectedTypeId,_that.individuals,_that.teams,_that.listStatus,_that.page,_that.searchQuery,_that.joiningTeamIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ParticipantTypeModel> types,  PartnersStatus typesStatus,  int selectedTypeId,  List<ParticipantIndividualModel> individuals,  List<ParticipantTeamModel> teams,  PartnersStatus listStatus,  int page,  String searchQuery,  Set<int> joiningTeamIds)  $default,) {final _that = this;
switch (_that) {
case _PartnersState():
return $default(_that.types,_that.typesStatus,_that.selectedTypeId,_that.individuals,_that.teams,_that.listStatus,_that.page,_that.searchQuery,_that.joiningTeamIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ParticipantTypeModel> types,  PartnersStatus typesStatus,  int selectedTypeId,  List<ParticipantIndividualModel> individuals,  List<ParticipantTeamModel> teams,  PartnersStatus listStatus,  int page,  String searchQuery,  Set<int> joiningTeamIds)?  $default,) {final _that = this;
switch (_that) {
case _PartnersState() when $default != null:
return $default(_that.types,_that.typesStatus,_that.selectedTypeId,_that.individuals,_that.teams,_that.listStatus,_that.page,_that.searchQuery,_that.joiningTeamIds);case _:
  return null;

}
}

}

/// @nodoc


class _PartnersState extends PartnersState {
  const _PartnersState({final  List<ParticipantTypeModel> types = const [], this.typesStatus = const PartnersStatus.initial(), this.selectedTypeId = 0, final  List<ParticipantIndividualModel> individuals = const [], final  List<ParticipantTeamModel> teams = const [], this.listStatus = const PartnersStatus.initial(), this.page = 1, this.searchQuery = '', final  Set<int> joiningTeamIds = const <int>{}}): _types = types,_individuals = individuals,_teams = teams,_joiningTeamIds = joiningTeamIds,super._();
  

// ─── Tabs (participant types) ────────────────────────────
 final  List<ParticipantTypeModel> _types;
// ─── Tabs (participant types) ────────────────────────────
@override@JsonKey() List<ParticipantTypeModel> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}

@override@JsonKey() final  PartnersStatus typesStatus;
@override@JsonKey() final  int selectedTypeId;
// ─── List ────────────────────────────────────────────────
 final  List<ParticipantIndividualModel> _individuals;
// ─── List ────────────────────────────────────────────────
@override@JsonKey() List<ParticipantIndividualModel> get individuals {
  if (_individuals is EqualUnmodifiableListView) return _individuals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_individuals);
}

 final  List<ParticipantTeamModel> _teams;
@override@JsonKey() List<ParticipantTeamModel> get teams {
  if (_teams is EqualUnmodifiableListView) return _teams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teams);
}

@override@JsonKey() final  PartnersStatus listStatus;
@override@JsonKey() final  int page;
@override@JsonKey() final  String searchQuery;
// ─── Join requests in flight ─────────────────────────────
 final  Set<int> _joiningTeamIds;
// ─── Join requests in flight ─────────────────────────────
@override@JsonKey() Set<int> get joiningTeamIds {
  if (_joiningTeamIds is EqualUnmodifiableSetView) return _joiningTeamIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_joiningTeamIds);
}


/// Create a copy of PartnersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartnersStateCopyWith<_PartnersState> get copyWith => __$PartnersStateCopyWithImpl<_PartnersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartnersState&&const DeepCollectionEquality().equals(other._types, _types)&&(identical(other.typesStatus, typesStatus) || other.typesStatus == typesStatus)&&(identical(other.selectedTypeId, selectedTypeId) || other.selectedTypeId == selectedTypeId)&&const DeepCollectionEquality().equals(other._individuals, _individuals)&&const DeepCollectionEquality().equals(other._teams, _teams)&&(identical(other.listStatus, listStatus) || other.listStatus == listStatus)&&(identical(other.page, page) || other.page == page)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other._joiningTeamIds, _joiningTeamIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_types),typesStatus,selectedTypeId,const DeepCollectionEquality().hash(_individuals),const DeepCollectionEquality().hash(_teams),listStatus,page,searchQuery,const DeepCollectionEquality().hash(_joiningTeamIds));

@override
String toString() {
  return 'PartnersState(types: $types, typesStatus: $typesStatus, selectedTypeId: $selectedTypeId, individuals: $individuals, teams: $teams, listStatus: $listStatus, page: $page, searchQuery: $searchQuery, joiningTeamIds: $joiningTeamIds)';
}


}

/// @nodoc
abstract mixin class _$PartnersStateCopyWith<$Res> implements $PartnersStateCopyWith<$Res> {
  factory _$PartnersStateCopyWith(_PartnersState value, $Res Function(_PartnersState) _then) = __$PartnersStateCopyWithImpl;
@override @useResult
$Res call({
 List<ParticipantTypeModel> types, PartnersStatus typesStatus, int selectedTypeId, List<ParticipantIndividualModel> individuals, List<ParticipantTeamModel> teams, PartnersStatus listStatus, int page, String searchQuery, Set<int> joiningTeamIds
});


@override $PartnersStatusCopyWith<$Res> get typesStatus;@override $PartnersStatusCopyWith<$Res> get listStatus;

}
/// @nodoc
class __$PartnersStateCopyWithImpl<$Res>
    implements _$PartnersStateCopyWith<$Res> {
  __$PartnersStateCopyWithImpl(this._self, this._then);

  final _PartnersState _self;
  final $Res Function(_PartnersState) _then;

/// Create a copy of PartnersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? types = null,Object? typesStatus = null,Object? selectedTypeId = null,Object? individuals = null,Object? teams = null,Object? listStatus = null,Object? page = null,Object? searchQuery = null,Object? joiningTeamIds = null,}) {
  return _then(_PartnersState(
types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<ParticipantTypeModel>,typesStatus: null == typesStatus ? _self.typesStatus : typesStatus // ignore: cast_nullable_to_non_nullable
as PartnersStatus,selectedTypeId: null == selectedTypeId ? _self.selectedTypeId : selectedTypeId // ignore: cast_nullable_to_non_nullable
as int,individuals: null == individuals ? _self._individuals : individuals // ignore: cast_nullable_to_non_nullable
as List<ParticipantIndividualModel>,teams: null == teams ? _self._teams : teams // ignore: cast_nullable_to_non_nullable
as List<ParticipantTeamModel>,listStatus: null == listStatus ? _self.listStatus : listStatus // ignore: cast_nullable_to_non_nullable
as PartnersStatus,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,joiningTeamIds: null == joiningTeamIds ? _self._joiningTeamIds : joiningTeamIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}

/// Create a copy of PartnersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartnersStatusCopyWith<$Res> get typesStatus {
  
  return $PartnersStatusCopyWith<$Res>(_self.typesStatus, (value) {
    return _then(_self.copyWith(typesStatus: value));
  });
}/// Create a copy of PartnersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartnersStatusCopyWith<$Res> get listStatus {
  
  return $PartnersStatusCopyWith<$Res>(_self.listStatus, (value) {
    return _then(_self.copyWith(listStatus: value));
  });
}
}

/// @nodoc
mixin _$PartnersStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnersStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnersStatus()';
}


}

/// @nodoc
class $PartnersStatusCopyWith<$Res>  {
$PartnersStatusCopyWith(PartnersStatus _, $Res Function(PartnersStatus) __);
}


/// Adds pattern-matching-related methods to [PartnersStatus].
extension PartnersStatusPatterns on PartnersStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PartnersStatusInitial value)?  initial,TResult Function( PartnersStatusLoading value)?  loading,TResult Function( PartnersStatusSuccess value)?  success,TResult Function( PartnersStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PartnersStatusInitial() when initial != null:
return initial(_that);case PartnersStatusLoading() when loading != null:
return loading(_that);case PartnersStatusSuccess() when success != null:
return success(_that);case PartnersStatusError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PartnersStatusInitial value)  initial,required TResult Function( PartnersStatusLoading value)  loading,required TResult Function( PartnersStatusSuccess value)  success,required TResult Function( PartnersStatusError value)  error,}){
final _that = this;
switch (_that) {
case PartnersStatusInitial():
return initial(_that);case PartnersStatusLoading():
return loading(_that);case PartnersStatusSuccess():
return success(_that);case PartnersStatusError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PartnersStatusInitial value)?  initial,TResult? Function( PartnersStatusLoading value)?  loading,TResult? Function( PartnersStatusSuccess value)?  success,TResult? Function( PartnersStatusError value)?  error,}){
final _that = this;
switch (_that) {
case PartnersStatusInitial() when initial != null:
return initial(_that);case PartnersStatusLoading() when loading != null:
return loading(_that);case PartnersStatusSuccess() when success != null:
return success(_that);case PartnersStatusError() when error != null:
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
case PartnersStatusInitial() when initial != null:
return initial();case PartnersStatusLoading() when loading != null:
return loading();case PartnersStatusSuccess() when success != null:
return success();case PartnersStatusError() when error != null:
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
case PartnersStatusInitial():
return initial();case PartnersStatusLoading():
return loading();case PartnersStatusSuccess():
return success();case PartnersStatusError():
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
case PartnersStatusInitial() when initial != null:
return initial();case PartnersStatusLoading() when loading != null:
return loading();case PartnersStatusSuccess() when success != null:
return success();case PartnersStatusError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class PartnersStatusInitial implements PartnersStatus {
  const PartnersStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnersStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnersStatus.initial()';
}


}




/// @nodoc


class PartnersStatusLoading implements PartnersStatus {
  const PartnersStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnersStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnersStatus.loading()';
}


}




/// @nodoc


class PartnersStatusSuccess implements PartnersStatus {
  const PartnersStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnersStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnersStatus.success()';
}


}




/// @nodoc


class PartnersStatusError implements PartnersStatus {
  const PartnersStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnersStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PartnersStatus.error()';
}


}




// dart format on
