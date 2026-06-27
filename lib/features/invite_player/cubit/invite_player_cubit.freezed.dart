// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_player_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InvitePlayerState {

 PlayerFilter get selectedFilter; String get searchQuery; bool get isLinkCopied; Map<String, InviteStatus> get inviteStatuses; bool get isSuccessModalOpen;
/// Create a copy of InvitePlayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvitePlayerStateCopyWith<InvitePlayerState> get copyWith => _$InvitePlayerStateCopyWithImpl<InvitePlayerState>(this as InvitePlayerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvitePlayerState&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isLinkCopied, isLinkCopied) || other.isLinkCopied == isLinkCopied)&&const DeepCollectionEquality().equals(other.inviteStatuses, inviteStatuses)&&(identical(other.isSuccessModalOpen, isSuccessModalOpen) || other.isSuccessModalOpen == isSuccessModalOpen));
}


@override
int get hashCode => Object.hash(runtimeType,selectedFilter,searchQuery,isLinkCopied,const DeepCollectionEquality().hash(inviteStatuses),isSuccessModalOpen);

@override
String toString() {
  return 'InvitePlayerState(selectedFilter: $selectedFilter, searchQuery: $searchQuery, isLinkCopied: $isLinkCopied, inviteStatuses: $inviteStatuses, isSuccessModalOpen: $isSuccessModalOpen)';
}


}

/// @nodoc
abstract mixin class $InvitePlayerStateCopyWith<$Res>  {
  factory $InvitePlayerStateCopyWith(InvitePlayerState value, $Res Function(InvitePlayerState) _then) = _$InvitePlayerStateCopyWithImpl;
@useResult
$Res call({
 PlayerFilter selectedFilter, String searchQuery, bool isLinkCopied, Map<String, InviteStatus> inviteStatuses, bool isSuccessModalOpen
});




}
/// @nodoc
class _$InvitePlayerStateCopyWithImpl<$Res>
    implements $InvitePlayerStateCopyWith<$Res> {
  _$InvitePlayerStateCopyWithImpl(this._self, this._then);

  final InvitePlayerState _self;
  final $Res Function(InvitePlayerState) _then;

/// Create a copy of InvitePlayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedFilter = null,Object? searchQuery = null,Object? isLinkCopied = null,Object? inviteStatuses = null,Object? isSuccessModalOpen = null,}) {
  return _then(_self.copyWith(
selectedFilter: null == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as PlayerFilter,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isLinkCopied: null == isLinkCopied ? _self.isLinkCopied : isLinkCopied // ignore: cast_nullable_to_non_nullable
as bool,inviteStatuses: null == inviteStatuses ? _self.inviteStatuses : inviteStatuses // ignore: cast_nullable_to_non_nullable
as Map<String, InviteStatus>,isSuccessModalOpen: null == isSuccessModalOpen ? _self.isSuccessModalOpen : isSuccessModalOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [InvitePlayerState].
extension InvitePlayerStatePatterns on InvitePlayerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvitePlayerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvitePlayerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvitePlayerState value)  $default,){
final _that = this;
switch (_that) {
case _InvitePlayerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvitePlayerState value)?  $default,){
final _that = this;
switch (_that) {
case _InvitePlayerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlayerFilter selectedFilter,  String searchQuery,  bool isLinkCopied,  Map<String, InviteStatus> inviteStatuses,  bool isSuccessModalOpen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvitePlayerState() when $default != null:
return $default(_that.selectedFilter,_that.searchQuery,_that.isLinkCopied,_that.inviteStatuses,_that.isSuccessModalOpen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlayerFilter selectedFilter,  String searchQuery,  bool isLinkCopied,  Map<String, InviteStatus> inviteStatuses,  bool isSuccessModalOpen)  $default,) {final _that = this;
switch (_that) {
case _InvitePlayerState():
return $default(_that.selectedFilter,_that.searchQuery,_that.isLinkCopied,_that.inviteStatuses,_that.isSuccessModalOpen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlayerFilter selectedFilter,  String searchQuery,  bool isLinkCopied,  Map<String, InviteStatus> inviteStatuses,  bool isSuccessModalOpen)?  $default,) {final _that = this;
switch (_that) {
case _InvitePlayerState() when $default != null:
return $default(_that.selectedFilter,_that.searchQuery,_that.isLinkCopied,_that.inviteStatuses,_that.isSuccessModalOpen);case _:
  return null;

}
}

}

/// @nodoc


class _InvitePlayerState implements InvitePlayerState {
  const _InvitePlayerState({this.selectedFilter = PlayerFilter.all, this.searchQuery = '', this.isLinkCopied = false, final  Map<String, InviteStatus> inviteStatuses = const {}, this.isSuccessModalOpen = false}): _inviteStatuses = inviteStatuses;
  

@override@JsonKey() final  PlayerFilter selectedFilter;
@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  bool isLinkCopied;
 final  Map<String, InviteStatus> _inviteStatuses;
@override@JsonKey() Map<String, InviteStatus> get inviteStatuses {
  if (_inviteStatuses is EqualUnmodifiableMapView) return _inviteStatuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_inviteStatuses);
}

@override@JsonKey() final  bool isSuccessModalOpen;

/// Create a copy of InvitePlayerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvitePlayerStateCopyWith<_InvitePlayerState> get copyWith => __$InvitePlayerStateCopyWithImpl<_InvitePlayerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvitePlayerState&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isLinkCopied, isLinkCopied) || other.isLinkCopied == isLinkCopied)&&const DeepCollectionEquality().equals(other._inviteStatuses, _inviteStatuses)&&(identical(other.isSuccessModalOpen, isSuccessModalOpen) || other.isSuccessModalOpen == isSuccessModalOpen));
}


@override
int get hashCode => Object.hash(runtimeType,selectedFilter,searchQuery,isLinkCopied,const DeepCollectionEquality().hash(_inviteStatuses),isSuccessModalOpen);

@override
String toString() {
  return 'InvitePlayerState(selectedFilter: $selectedFilter, searchQuery: $searchQuery, isLinkCopied: $isLinkCopied, inviteStatuses: $inviteStatuses, isSuccessModalOpen: $isSuccessModalOpen)';
}


}

/// @nodoc
abstract mixin class _$InvitePlayerStateCopyWith<$Res> implements $InvitePlayerStateCopyWith<$Res> {
  factory _$InvitePlayerStateCopyWith(_InvitePlayerState value, $Res Function(_InvitePlayerState) _then) = __$InvitePlayerStateCopyWithImpl;
@override @useResult
$Res call({
 PlayerFilter selectedFilter, String searchQuery, bool isLinkCopied, Map<String, InviteStatus> inviteStatuses, bool isSuccessModalOpen
});




}
/// @nodoc
class __$InvitePlayerStateCopyWithImpl<$Res>
    implements _$InvitePlayerStateCopyWith<$Res> {
  __$InvitePlayerStateCopyWithImpl(this._self, this._then);

  final _InvitePlayerState _self;
  final $Res Function(_InvitePlayerState) _then;

/// Create a copy of InvitePlayerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedFilter = null,Object? searchQuery = null,Object? isLinkCopied = null,Object? inviteStatuses = null,Object? isSuccessModalOpen = null,}) {
  return _then(_InvitePlayerState(
selectedFilter: null == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as PlayerFilter,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isLinkCopied: null == isLinkCopied ? _self.isLinkCopied : isLinkCopied // ignore: cast_nullable_to_non_nullable
as bool,inviteStatuses: null == inviteStatuses ? _self._inviteStatuses : inviteStatuses // ignore: cast_nullable_to_non_nullable
as Map<String, InviteStatus>,isSuccessModalOpen: null == isSuccessModalOpen ? _self.isSuccessModalOpen : isSuccessModalOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
