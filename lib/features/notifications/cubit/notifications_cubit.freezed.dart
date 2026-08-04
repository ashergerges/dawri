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

// ─── Filters ─────────────────────────────────────────────
 List<NotificationTypeModel> get types; NotificationsStatus get typesStatus;/// `null` = the "All" chip (no `type` query param).
 int? get selectedTypeId;// ─── List ────────────────────────────────────────────────
 List<NotificationModel> get notifications; int get currentPage; bool get hasMore; NotificationsStatus get listStatus;// ─── Unread ──────────────────────────────────────────────
 int get unreadCount; bool get isMarkingAllRead;
/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsStateCopyWith<NotificationsState> get copyWith => _$NotificationsStateCopyWithImpl<NotificationsState>(this as NotificationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsState&&const DeepCollectionEquality().equals(other.types, types)&&(identical(other.typesStatus, typesStatus) || other.typesStatus == typesStatus)&&(identical(other.selectedTypeId, selectedTypeId) || other.selectedTypeId == selectedTypeId)&&const DeepCollectionEquality().equals(other.notifications, notifications)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.listStatus, listStatus) || other.listStatus == listStatus)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.isMarkingAllRead, isMarkingAllRead) || other.isMarkingAllRead == isMarkingAllRead));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(types),typesStatus,selectedTypeId,const DeepCollectionEquality().hash(notifications),currentPage,hasMore,listStatus,unreadCount,isMarkingAllRead);

@override
String toString() {
  return 'NotificationsState(types: $types, typesStatus: $typesStatus, selectedTypeId: $selectedTypeId, notifications: $notifications, currentPage: $currentPage, hasMore: $hasMore, listStatus: $listStatus, unreadCount: $unreadCount, isMarkingAllRead: $isMarkingAllRead)';
}


}

/// @nodoc
abstract mixin class $NotificationsStateCopyWith<$Res>  {
  factory $NotificationsStateCopyWith(NotificationsState value, $Res Function(NotificationsState) _then) = _$NotificationsStateCopyWithImpl;
@useResult
$Res call({
 List<NotificationTypeModel> types, NotificationsStatus typesStatus, int? selectedTypeId, List<NotificationModel> notifications, int currentPage, bool hasMore, NotificationsStatus listStatus, int unreadCount, bool isMarkingAllRead
});


$NotificationsStatusCopyWith<$Res> get typesStatus;$NotificationsStatusCopyWith<$Res> get listStatus;

}
/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._self, this._then);

  final NotificationsState _self;
  final $Res Function(NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? types = null,Object? typesStatus = null,Object? selectedTypeId = freezed,Object? notifications = null,Object? currentPage = null,Object? hasMore = null,Object? listStatus = null,Object? unreadCount = null,Object? isMarkingAllRead = null,}) {
  return _then(_self.copyWith(
types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<NotificationTypeModel>,typesStatus: null == typesStatus ? _self.typesStatus : typesStatus // ignore: cast_nullable_to_non_nullable
as NotificationsStatus,selectedTypeId: freezed == selectedTypeId ? _self.selectedTypeId : selectedTypeId // ignore: cast_nullable_to_non_nullable
as int?,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,listStatus: null == listStatus ? _self.listStatus : listStatus // ignore: cast_nullable_to_non_nullable
as NotificationsStatus,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,isMarkingAllRead: null == isMarkingAllRead ? _self.isMarkingAllRead : isMarkingAllRead // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationsStatusCopyWith<$Res> get typesStatus {
  
  return $NotificationsStatusCopyWith<$Res>(_self.typesStatus, (value) {
    return _then(_self.copyWith(typesStatus: value));
  });
}/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationsStatusCopyWith<$Res> get listStatus {
  
  return $NotificationsStatusCopyWith<$Res>(_self.listStatus, (value) {
    return _then(_self.copyWith(listStatus: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NotificationTypeModel> types,  NotificationsStatus typesStatus,  int? selectedTypeId,  List<NotificationModel> notifications,  int currentPage,  bool hasMore,  NotificationsStatus listStatus,  int unreadCount,  bool isMarkingAllRead)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
return $default(_that.types,_that.typesStatus,_that.selectedTypeId,_that.notifications,_that.currentPage,_that.hasMore,_that.listStatus,_that.unreadCount,_that.isMarkingAllRead);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NotificationTypeModel> types,  NotificationsStatus typesStatus,  int? selectedTypeId,  List<NotificationModel> notifications,  int currentPage,  bool hasMore,  NotificationsStatus listStatus,  int unreadCount,  bool isMarkingAllRead)  $default,) {final _that = this;
switch (_that) {
case _NotificationsState():
return $default(_that.types,_that.typesStatus,_that.selectedTypeId,_that.notifications,_that.currentPage,_that.hasMore,_that.listStatus,_that.unreadCount,_that.isMarkingAllRead);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NotificationTypeModel> types,  NotificationsStatus typesStatus,  int? selectedTypeId,  List<NotificationModel> notifications,  int currentPage,  bool hasMore,  NotificationsStatus listStatus,  int unreadCount,  bool isMarkingAllRead)?  $default,) {final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
return $default(_that.types,_that.typesStatus,_that.selectedTypeId,_that.notifications,_that.currentPage,_that.hasMore,_that.listStatus,_that.unreadCount,_that.isMarkingAllRead);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationsState extends NotificationsState {
  const _NotificationsState({final  List<NotificationTypeModel> types = const [], this.typesStatus = const NotificationsStatus.initial(), this.selectedTypeId, final  List<NotificationModel> notifications = const [], this.currentPage = 1, this.hasMore = false, this.listStatus = const NotificationsStatus.initial(), this.unreadCount = 0, this.isMarkingAllRead = false}): _types = types,_notifications = notifications,super._();
  

// ─── Filters ─────────────────────────────────────────────
 final  List<NotificationTypeModel> _types;
// ─── Filters ─────────────────────────────────────────────
@override@JsonKey() List<NotificationTypeModel> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}

@override@JsonKey() final  NotificationsStatus typesStatus;
/// `null` = the "All" chip (no `type` query param).
@override final  int? selectedTypeId;
// ─── List ────────────────────────────────────────────────
 final  List<NotificationModel> _notifications;
// ─── List ────────────────────────────────────────────────
@override@JsonKey() List<NotificationModel> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  NotificationsStatus listStatus;
// ─── Unread ──────────────────────────────────────────────
@override@JsonKey() final  int unreadCount;
@override@JsonKey() final  bool isMarkingAllRead;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsStateCopyWith<_NotificationsState> get copyWith => __$NotificationsStateCopyWithImpl<_NotificationsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsState&&const DeepCollectionEquality().equals(other._types, _types)&&(identical(other.typesStatus, typesStatus) || other.typesStatus == typesStatus)&&(identical(other.selectedTypeId, selectedTypeId) || other.selectedTypeId == selectedTypeId)&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.listStatus, listStatus) || other.listStatus == listStatus)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.isMarkingAllRead, isMarkingAllRead) || other.isMarkingAllRead == isMarkingAllRead));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_types),typesStatus,selectedTypeId,const DeepCollectionEquality().hash(_notifications),currentPage,hasMore,listStatus,unreadCount,isMarkingAllRead);

@override
String toString() {
  return 'NotificationsState(types: $types, typesStatus: $typesStatus, selectedTypeId: $selectedTypeId, notifications: $notifications, currentPage: $currentPage, hasMore: $hasMore, listStatus: $listStatus, unreadCount: $unreadCount, isMarkingAllRead: $isMarkingAllRead)';
}


}

/// @nodoc
abstract mixin class _$NotificationsStateCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$NotificationsStateCopyWith(_NotificationsState value, $Res Function(_NotificationsState) _then) = __$NotificationsStateCopyWithImpl;
@override @useResult
$Res call({
 List<NotificationTypeModel> types, NotificationsStatus typesStatus, int? selectedTypeId, List<NotificationModel> notifications, int currentPage, bool hasMore, NotificationsStatus listStatus, int unreadCount, bool isMarkingAllRead
});


@override $NotificationsStatusCopyWith<$Res> get typesStatus;@override $NotificationsStatusCopyWith<$Res> get listStatus;

}
/// @nodoc
class __$NotificationsStateCopyWithImpl<$Res>
    implements _$NotificationsStateCopyWith<$Res> {
  __$NotificationsStateCopyWithImpl(this._self, this._then);

  final _NotificationsState _self;
  final $Res Function(_NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? types = null,Object? typesStatus = null,Object? selectedTypeId = freezed,Object? notifications = null,Object? currentPage = null,Object? hasMore = null,Object? listStatus = null,Object? unreadCount = null,Object? isMarkingAllRead = null,}) {
  return _then(_NotificationsState(
types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<NotificationTypeModel>,typesStatus: null == typesStatus ? _self.typesStatus : typesStatus // ignore: cast_nullable_to_non_nullable
as NotificationsStatus,selectedTypeId: freezed == selectedTypeId ? _self.selectedTypeId : selectedTypeId // ignore: cast_nullable_to_non_nullable
as int?,notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,listStatus: null == listStatus ? _self.listStatus : listStatus // ignore: cast_nullable_to_non_nullable
as NotificationsStatus,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,isMarkingAllRead: null == isMarkingAllRead ? _self.isMarkingAllRead : isMarkingAllRead // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationsStatusCopyWith<$Res> get typesStatus {
  
  return $NotificationsStatusCopyWith<$Res>(_self.typesStatus, (value) {
    return _then(_self.copyWith(typesStatus: value));
  });
}/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationsStatusCopyWith<$Res> get listStatus {
  
  return $NotificationsStatusCopyWith<$Res>(_self.listStatus, (value) {
    return _then(_self.copyWith(listStatus: value));
  });
}
}

/// @nodoc
mixin _$NotificationsStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsStatus()';
}


}

/// @nodoc
class $NotificationsStatusCopyWith<$Res>  {
$NotificationsStatusCopyWith(NotificationsStatus _, $Res Function(NotificationsStatus) __);
}


/// Adds pattern-matching-related methods to [NotificationsStatus].
extension NotificationsStatusPatterns on NotificationsStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NotificationsStatusInitial value)?  initial,TResult Function( NotificationsStatusLoading value)?  loading,TResult Function( NotificationsStatusError value)?  error,TResult Function( NotificationsStatusSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NotificationsStatusInitial() when initial != null:
return initial(_that);case NotificationsStatusLoading() when loading != null:
return loading(_that);case NotificationsStatusError() when error != null:
return error(_that);case NotificationsStatusSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NotificationsStatusInitial value)  initial,required TResult Function( NotificationsStatusLoading value)  loading,required TResult Function( NotificationsStatusError value)  error,required TResult Function( NotificationsStatusSuccess value)  success,}){
final _that = this;
switch (_that) {
case NotificationsStatusInitial():
return initial(_that);case NotificationsStatusLoading():
return loading(_that);case NotificationsStatusError():
return error(_that);case NotificationsStatusSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NotificationsStatusInitial value)?  initial,TResult? Function( NotificationsStatusLoading value)?  loading,TResult? Function( NotificationsStatusError value)?  error,TResult? Function( NotificationsStatusSuccess value)?  success,}){
final _that = this;
switch (_that) {
case NotificationsStatusInitial() when initial != null:
return initial(_that);case NotificationsStatusLoading() when loading != null:
return loading(_that);case NotificationsStatusError() when error != null:
return error(_that);case NotificationsStatusSuccess() when success != null:
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
case NotificationsStatusInitial() when initial != null:
return initial();case NotificationsStatusLoading() when loading != null:
return loading();case NotificationsStatusError() when error != null:
return error();case NotificationsStatusSuccess() when success != null:
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
case NotificationsStatusInitial():
return initial();case NotificationsStatusLoading():
return loading();case NotificationsStatusError():
return error();case NotificationsStatusSuccess():
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
case NotificationsStatusInitial() when initial != null:
return initial();case NotificationsStatusLoading() when loading != null:
return loading();case NotificationsStatusError() when error != null:
return error();case NotificationsStatusSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class NotificationsStatusInitial implements NotificationsStatus {
  const NotificationsStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsStatus.initial()';
}


}




/// @nodoc


class NotificationsStatusLoading implements NotificationsStatus {
  const NotificationsStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsStatus.loading()';
}


}




/// @nodoc


class NotificationsStatusError implements NotificationsStatus {
  const NotificationsStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsStatus.error()';
}


}




/// @nodoc


class NotificationsStatusSuccess implements NotificationsStatus {
  const NotificationsStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsStatus.success()';
}


}




// dart format on
