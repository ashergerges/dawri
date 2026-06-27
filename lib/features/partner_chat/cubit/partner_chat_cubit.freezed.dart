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

 List<ChatMessageModel> get messages; String? get attachmentError; bool get isPickingAttachment;
/// Create a copy of PartnerChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnerChatStateCopyWith<PartnerChatState> get copyWith => _$PartnerChatStateCopyWithImpl<PartnerChatState>(this as PartnerChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerChatState&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.attachmentError, attachmentError) || other.attachmentError == attachmentError)&&(identical(other.isPickingAttachment, isPickingAttachment) || other.isPickingAttachment == isPickingAttachment));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),attachmentError,isPickingAttachment);

@override
String toString() {
  return 'PartnerChatState(messages: $messages, attachmentError: $attachmentError, isPickingAttachment: $isPickingAttachment)';
}


}

/// @nodoc
abstract mixin class $PartnerChatStateCopyWith<$Res>  {
  factory $PartnerChatStateCopyWith(PartnerChatState value, $Res Function(PartnerChatState) _then) = _$PartnerChatStateCopyWithImpl;
@useResult
$Res call({
 List<ChatMessageModel> messages, String? attachmentError, bool isPickingAttachment
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
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,Object? attachmentError = freezed,Object? isPickingAttachment = null,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessageModel>,attachmentError: freezed == attachmentError ? _self.attachmentError : attachmentError // ignore: cast_nullable_to_non_nullable
as String?,isPickingAttachment: null == isPickingAttachment ? _self.isPickingAttachment : isPickingAttachment // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChatMessageModel> messages,  String? attachmentError,  bool isPickingAttachment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartnerChatState() when $default != null:
return $default(_that.messages,_that.attachmentError,_that.isPickingAttachment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChatMessageModel> messages,  String? attachmentError,  bool isPickingAttachment)  $default,) {final _that = this;
switch (_that) {
case _PartnerChatState():
return $default(_that.messages,_that.attachmentError,_that.isPickingAttachment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChatMessageModel> messages,  String? attachmentError,  bool isPickingAttachment)?  $default,) {final _that = this;
switch (_that) {
case _PartnerChatState() when $default != null:
return $default(_that.messages,_that.attachmentError,_that.isPickingAttachment);case _:
  return null;

}
}

}

/// @nodoc


class _PartnerChatState implements PartnerChatState {
  const _PartnerChatState({final  List<ChatMessageModel> messages = PartnerChatMockData.initialMessages, this.attachmentError = '', this.isPickingAttachment = false}): _messages = messages;
  

 final  List<ChatMessageModel> _messages;
@override@JsonKey() List<ChatMessageModel> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override@JsonKey() final  String? attachmentError;
@override@JsonKey() final  bool isPickingAttachment;

/// Create a copy of PartnerChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartnerChatStateCopyWith<_PartnerChatState> get copyWith => __$PartnerChatStateCopyWithImpl<_PartnerChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartnerChatState&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.attachmentError, attachmentError) || other.attachmentError == attachmentError)&&(identical(other.isPickingAttachment, isPickingAttachment) || other.isPickingAttachment == isPickingAttachment));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),attachmentError,isPickingAttachment);

@override
String toString() {
  return 'PartnerChatState(messages: $messages, attachmentError: $attachmentError, isPickingAttachment: $isPickingAttachment)';
}


}

/// @nodoc
abstract mixin class _$PartnerChatStateCopyWith<$Res> implements $PartnerChatStateCopyWith<$Res> {
  factory _$PartnerChatStateCopyWith(_PartnerChatState value, $Res Function(_PartnerChatState) _then) = __$PartnerChatStateCopyWithImpl;
@override @useResult
$Res call({
 List<ChatMessageModel> messages, String? attachmentError, bool isPickingAttachment
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
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? attachmentError = freezed,Object? isPickingAttachment = null,}) {
  return _then(_PartnerChatState(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessageModel>,attachmentError: freezed == attachmentError ? _self.attachmentError : attachmentError // ignore: cast_nullable_to_non_nullable
as String?,isPickingAttachment: null == isPickingAttachment ? _self.isPickingAttachment : isPickingAttachment // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
