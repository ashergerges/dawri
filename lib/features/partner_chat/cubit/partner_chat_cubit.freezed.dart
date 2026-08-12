// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PartnerChatState {

/// Messages from Firestore, oldest first. Includes the user's own
/// unacknowledged writes (Firestore replays local pending writes into the
/// snapshot), which is why sending needs no separate optimistic list.
 List<ChatMessageModel> get messages;/// Current user's backend id, as a string. Empty until [PartnerChatCubit.init]
/// resolves it; the UI uses it to decide which side a bubble belongs on.
 String get myId; String get peerName; String get peerAvatar; String? get peerPhone; bool get isPeerTyping; bool get isPeerOnline; bool get isLoading;/// Translation key for a fatal load error (no session, stream failure).
 String? get errorKey;
/// Create a copy of PartnerChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnerChatStateCopyWith<PartnerChatState> get copyWith => _$PartnerChatStateCopyWithImpl<PartnerChatState>(this as PartnerChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerChatState&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.myId, myId) || other.myId == myId)&&(identical(other.peerName, peerName) || other.peerName == peerName)&&(identical(other.peerAvatar, peerAvatar) || other.peerAvatar == peerAvatar)&&(identical(other.peerPhone, peerPhone) || other.peerPhone == peerPhone)&&(identical(other.isPeerTyping, isPeerTyping) || other.isPeerTyping == isPeerTyping)&&(identical(other.isPeerOnline, isPeerOnline) || other.isPeerOnline == isPeerOnline)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorKey, errorKey) || other.errorKey == errorKey));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),myId,peerName,peerAvatar,peerPhone,isPeerTyping,isPeerOnline,isLoading,errorKey);

@override
String toString() {
  return 'PartnerChatState(messages: $messages, myId: $myId, peerName: $peerName, peerAvatar: $peerAvatar, peerPhone: $peerPhone, isPeerTyping: $isPeerTyping, isPeerOnline: $isPeerOnline, isLoading: $isLoading, errorKey: $errorKey)';
}


}

/// @nodoc
abstract mixin class $PartnerChatStateCopyWith<$Res>  {
  factory $PartnerChatStateCopyWith(PartnerChatState value, $Res Function(PartnerChatState) _then) = _$PartnerChatStateCopyWithImpl;
@useResult
$Res call({
 List<ChatMessageModel> messages, String myId, String peerName, String peerAvatar, String? peerPhone, bool isPeerTyping, bool isPeerOnline, bool isLoading, String? errorKey
});




}
/// @nodoc
class _$PartnerChatStateCopyWithImpl<$Res>
    implements $PartnerChatStateCopyWith<$Res> {
  _$PartnerChatStateCopyWithImpl(this._self, this._then);

  final PartnerChatState _self;
  final $Res Function(PartnerChatState) _then;

/// Create a copy of PartnerChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,Object? myId = null,Object? peerName = null,Object? peerAvatar = null,Object? peerPhone = freezed,Object? isPeerTyping = null,Object? isPeerOnline = null,Object? isLoading = null,Object? errorKey = freezed,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessageModel>,myId: null == myId ? _self.myId : myId // ignore: cast_nullable_to_non_nullable
as String,peerName: null == peerName ? _self.peerName : peerName // ignore: cast_nullable_to_non_nullable
as String,peerAvatar: null == peerAvatar ? _self.peerAvatar : peerAvatar // ignore: cast_nullable_to_non_nullable
as String,peerPhone: freezed == peerPhone ? _self.peerPhone : peerPhone // ignore: cast_nullable_to_non_nullable
as String?,isPeerTyping: null == isPeerTyping ? _self.isPeerTyping : isPeerTyping // ignore: cast_nullable_to_non_nullable
as bool,isPeerOnline: null == isPeerOnline ? _self.isPeerOnline : isPeerOnline // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorKey: freezed == errorKey ? _self.errorKey : errorKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PartnerChatState].
extension PartnerChatStatePatterns on PartnerChatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartnerChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartnerChatState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartnerChatState value)  $default,){
final _that = this;
switch (_that) {
case _PartnerChatState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartnerChatState value)?  $default,){
final _that = this;
switch (_that) {
case _PartnerChatState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChatMessageModel> messages,  String myId,  String peerName,  String peerAvatar,  String? peerPhone,  bool isPeerTyping,  bool isPeerOnline,  bool isLoading,  String? errorKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartnerChatState() when $default != null:
return $default(_that.messages,_that.myId,_that.peerName,_that.peerAvatar,_that.peerPhone,_that.isPeerTyping,_that.isPeerOnline,_that.isLoading,_that.errorKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChatMessageModel> messages,  String myId,  String peerName,  String peerAvatar,  String? peerPhone,  bool isPeerTyping,  bool isPeerOnline,  bool isLoading,  String? errorKey)  $default,) {final _that = this;
switch (_that) {
case _PartnerChatState():
return $default(_that.messages,_that.myId,_that.peerName,_that.peerAvatar,_that.peerPhone,_that.isPeerTyping,_that.isPeerOnline,_that.isLoading,_that.errorKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChatMessageModel> messages,  String myId,  String peerName,  String peerAvatar,  String? peerPhone,  bool isPeerTyping,  bool isPeerOnline,  bool isLoading,  String? errorKey)?  $default,) {final _that = this;
switch (_that) {
case _PartnerChatState() when $default != null:
return $default(_that.messages,_that.myId,_that.peerName,_that.peerAvatar,_that.peerPhone,_that.isPeerTyping,_that.isPeerOnline,_that.isLoading,_that.errorKey);case _:
  return null;

}
}

}

/// @nodoc


class _PartnerChatState implements PartnerChatState {
  const _PartnerChatState({final  List<ChatMessageModel> messages = const [], this.myId = '', this.peerName = '', this.peerAvatar = '', this.peerPhone, this.isPeerTyping = false, this.isPeerOnline = false, this.isLoading = true, this.errorKey}): _messages = messages;
  

/// Messages from Firestore, oldest first. Includes the user's own
/// unacknowledged writes (Firestore replays local pending writes into the
/// snapshot), which is why sending needs no separate optimistic list.
 final  List<ChatMessageModel> _messages;
/// Messages from Firestore, oldest first. Includes the user's own
/// unacknowledged writes (Firestore replays local pending writes into the
/// snapshot), which is why sending needs no separate optimistic list.
@override@JsonKey() List<ChatMessageModel> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

/// Current user's backend id, as a string. Empty until [PartnerChatCubit.init]
/// resolves it; the UI uses it to decide which side a bubble belongs on.
@override@JsonKey() final  String myId;
@override@JsonKey() final  String peerName;
@override@JsonKey() final  String peerAvatar;
@override final  String? peerPhone;
@override@JsonKey() final  bool isPeerTyping;
@override@JsonKey() final  bool isPeerOnline;
@override@JsonKey() final  bool isLoading;
/// Translation key for a fatal load error (no session, stream failure).
@override final  String? errorKey;

/// Create a copy of PartnerChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartnerChatStateCopyWith<_PartnerChatState> get copyWith => __$PartnerChatStateCopyWithImpl<_PartnerChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartnerChatState&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.myId, myId) || other.myId == myId)&&(identical(other.peerName, peerName) || other.peerName == peerName)&&(identical(other.peerAvatar, peerAvatar) || other.peerAvatar == peerAvatar)&&(identical(other.peerPhone, peerPhone) || other.peerPhone == peerPhone)&&(identical(other.isPeerTyping, isPeerTyping) || other.isPeerTyping == isPeerTyping)&&(identical(other.isPeerOnline, isPeerOnline) || other.isPeerOnline == isPeerOnline)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorKey, errorKey) || other.errorKey == errorKey));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),myId,peerName,peerAvatar,peerPhone,isPeerTyping,isPeerOnline,isLoading,errorKey);

@override
String toString() {
  return 'PartnerChatState(messages: $messages, myId: $myId, peerName: $peerName, peerAvatar: $peerAvatar, peerPhone: $peerPhone, isPeerTyping: $isPeerTyping, isPeerOnline: $isPeerOnline, isLoading: $isLoading, errorKey: $errorKey)';
}


}

/// @nodoc
abstract mixin class _$PartnerChatStateCopyWith<$Res> implements $PartnerChatStateCopyWith<$Res> {
  factory _$PartnerChatStateCopyWith(_PartnerChatState value, $Res Function(_PartnerChatState) _then) = __$PartnerChatStateCopyWithImpl;
@override @useResult
$Res call({
 List<ChatMessageModel> messages, String myId, String peerName, String peerAvatar, String? peerPhone, bool isPeerTyping, bool isPeerOnline, bool isLoading, String? errorKey
});




}
/// @nodoc
class __$PartnerChatStateCopyWithImpl<$Res>
    implements _$PartnerChatStateCopyWith<$Res> {
  __$PartnerChatStateCopyWithImpl(this._self, this._then);

  final _PartnerChatState _self;
  final $Res Function(_PartnerChatState) _then;

/// Create a copy of PartnerChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? myId = null,Object? peerName = null,Object? peerAvatar = null,Object? peerPhone = freezed,Object? isPeerTyping = null,Object? isPeerOnline = null,Object? isLoading = null,Object? errorKey = freezed,}) {
  return _then(_PartnerChatState(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessageModel>,myId: null == myId ? _self.myId : myId // ignore: cast_nullable_to_non_nullable
as String,peerName: null == peerName ? _self.peerName : peerName // ignore: cast_nullable_to_non_nullable
as String,peerAvatar: null == peerAvatar ? _self.peerAvatar : peerAvatar // ignore: cast_nullable_to_non_nullable
as String,peerPhone: freezed == peerPhone ? _self.peerPhone : peerPhone // ignore: cast_nullable_to_non_nullable
as String?,isPeerTyping: null == isPeerTyping ? _self.isPeerTyping : isPeerTyping // ignore: cast_nullable_to_non_nullable
as bool,isPeerOnline: null == isPeerOnline ? _self.isPeerOnline : isPeerOnline // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorKey: freezed == errorKey ? _self.errorKey : errorKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
