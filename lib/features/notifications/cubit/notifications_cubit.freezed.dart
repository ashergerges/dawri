// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsState {

 NotifFilter get selectedFilter; Set<String> get unreadIds; bool get isMarkingRead; Map<String, InviteStatus> get inviteStatuses;
/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsStateCopyWith<NotificationsState> get copyWith => _$NotificationsStateCopyWithImpl<NotificationsState>(this as NotificationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsState&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&const DeepCollectionEquality().equals(other.unreadIds, unreadIds)&&(identical(other.isMarkingRead, isMarkingRead) || other.isMarkingRead == isMarkingRead)&&const DeepCollectionEquality().equals(other.inviteStatuses, inviteStatuses));
}


@override
int get hashCode => Object.hash(runtimeType,selectedFilter,const DeepCollectionEquality().hash(unreadIds),isMarkingRead,const DeepCollectionEquality().hash(inviteStatuses));

@override
String toString() {
  return 'NotificationsState(selectedFilter: $selectedFilter, unreadIds: $unreadIds, isMarkingRead: $isMarkingRead, inviteStatuses: $inviteStatuses)';
}


}

/// @nodoc
abstract mixin class $NotificationsStateCopyWith<$Res>  {
  factory $NotificationsStateCopyWith(NotificationsState value, $Res Function(NotificationsState) _then) = _$NotificationsStateCopyWithImpl;
@useResult
$Res call({
 NotifFilter selectedFilter, Set<String> unreadIds, bool isMarkingRead, Map<String, InviteStatus> inviteStatuses
});




}
/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._self, this._then);

  final NotificationsState _self;
  final $Res Function(NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedFilter = null,Object? unreadIds = null,Object? isMarkingRead = null,Object? inviteStatuses = null,}) {
  return _then(_self.copyWith(
selectedFilter: null == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as NotifFilter,unreadIds: null == unreadIds ? _self.unreadIds : unreadIds // ignore: cast_nullable_to_non_nullable
as Set<String>,isMarkingRead: null == isMarkingRead ? _self.isMarkingRead : isMarkingRead // ignore: cast_nullable_to_non_nullable
as bool,inviteStatuses: null == inviteStatuses ? _self.inviteStatuses : inviteStatuses // ignore: cast_nullable_to_non_nullable
as Map<String, InviteStatus>,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationsState].
extension NotificationsStatePatterns on NotificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationsState value)  $default,){
final _that = this;
switch (_that) {
case _NotificationsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationsState value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NotifFilter selectedFilter,  Set<String> unreadIds,  bool isMarkingRead,  Map<String, InviteStatus> inviteStatuses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
return $default(_that.selectedFilter,_that.unreadIds,_that.isMarkingRead,_that.inviteStatuses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NotifFilter selectedFilter,  Set<String> unreadIds,  bool isMarkingRead,  Map<String, InviteStatus> inviteStatuses)  $default,) {final _that = this;
switch (_that) {
case _NotificationsState():
return $default(_that.selectedFilter,_that.unreadIds,_that.isMarkingRead,_that.inviteStatuses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NotifFilter selectedFilter,  Set<String> unreadIds,  bool isMarkingRead,  Map<String, InviteStatus> inviteStatuses)?  $default,) {final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
return $default(_that.selectedFilter,_that.unreadIds,_that.isMarkingRead,_that.inviteStatuses);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationsState implements NotificationsState {
  const _NotificationsState({this.selectedFilter = NotifFilter.all, final  Set<String> unreadIds = const {}, this.isMarkingRead = false, final  Map<String, InviteStatus> inviteStatuses = const {}}): _unreadIds = unreadIds,_inviteStatuses = inviteStatuses;
  

@override@JsonKey() final  NotifFilter selectedFilter;
 final  Set<String> _unreadIds;
@override@JsonKey() Set<String> get unreadIds {
  if (_unreadIds is EqualUnmodifiableSetView) return _unreadIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_unreadIds);
}

@override@JsonKey() final  bool isMarkingRead;
 final  Map<String, InviteStatus> _inviteStatuses;
@override@JsonKey() Map<String, InviteStatus> get inviteStatuses {
  if (_inviteStatuses is EqualUnmodifiableMapView) return _inviteStatuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_inviteStatuses);
}


/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsStateCopyWith<_NotificationsState> get copyWith => __$NotificationsStateCopyWithImpl<_NotificationsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsState&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&const DeepCollectionEquality().equals(other._unreadIds, _unreadIds)&&(identical(other.isMarkingRead, isMarkingRead) || other.isMarkingRead == isMarkingRead)&&const DeepCollectionEquality().equals(other._inviteStatuses, _inviteStatuses));
}


@override
int get hashCode => Object.hash(runtimeType,selectedFilter,const DeepCollectionEquality().hash(_unreadIds),isMarkingRead,const DeepCollectionEquality().hash(_inviteStatuses));

@override
String toString() {
  return 'NotificationsState(selectedFilter: $selectedFilter, unreadIds: $unreadIds, isMarkingRead: $isMarkingRead, inviteStatuses: $inviteStatuses)';
}


}

/// @nodoc
abstract mixin class _$NotificationsStateCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$NotificationsStateCopyWith(_NotificationsState value, $Res Function(_NotificationsState) _then) = __$NotificationsStateCopyWithImpl;
@override @useResult
$Res call({
 NotifFilter selectedFilter, Set<String> unreadIds, bool isMarkingRead, Map<String, InviteStatus> inviteStatuses
});




}
/// @nodoc
class __$NotificationsStateCopyWithImpl<$Res>
    implements _$NotificationsStateCopyWith<$Res> {
  __$NotificationsStateCopyWithImpl(this._self, this._then);

  final _NotificationsState _self;
  final $Res Function(_NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedFilter = null,Object? unreadIds = null,Object? isMarkingRead = null,Object? inviteStatuses = null,}) {
  return _then(_NotificationsState(
selectedFilter: null == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as NotifFilter,unreadIds: null == unreadIds ? _self._unreadIds : unreadIds // ignore: cast_nullable_to_non_nullable
as Set<String>,isMarkingRead: null == isMarkingRead ? _self.isMarkingRead : isMarkingRead // ignore: cast_nullable_to_non_nullable
as bool,inviteStatuses: null == inviteStatuses ? _self._inviteStatuses : inviteStatuses // ignore: cast_nullable_to_non_nullable
as Map<String, InviteStatus>,
  ));
}


}

// dart format on
