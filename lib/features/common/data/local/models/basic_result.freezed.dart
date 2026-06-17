// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basic_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BasicResult {

 String? get id; dynamic get message; bool? get isAuthenticated; String? get username; String? get email; dynamic get phoneNumber; List<String>? get roles; dynamic get token; dynamic get expiresOn; int? get accountType; DateTime? get refreshTokenExpiration;
/// Create a copy of BasicResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasicResultCopyWith<BasicResult> get copyWith => _$BasicResultCopyWithImpl<BasicResult>(this as BasicResult, _$identity);

  /// Serializes this BasicResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasicResult&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.message, message)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.phoneNumber, phoneNumber)&&const DeepCollectionEquality().equals(other.roles, roles)&&const DeepCollectionEquality().equals(other.token, token)&&const DeepCollectionEquality().equals(other.expiresOn, expiresOn)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.refreshTokenExpiration, refreshTokenExpiration) || other.refreshTokenExpiration == refreshTokenExpiration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(message),isAuthenticated,username,email,const DeepCollectionEquality().hash(phoneNumber),const DeepCollectionEquality().hash(roles),const DeepCollectionEquality().hash(token),const DeepCollectionEquality().hash(expiresOn),accountType,refreshTokenExpiration);

@override
String toString() {
  return 'BasicResult(id: $id, message: $message, isAuthenticated: $isAuthenticated, username: $username, email: $email, phoneNumber: $phoneNumber, roles: $roles, token: $token, expiresOn: $expiresOn, accountType: $accountType, refreshTokenExpiration: $refreshTokenExpiration)';
}


}

/// @nodoc
abstract mixin class $BasicResultCopyWith<$Res>  {
  factory $BasicResultCopyWith(BasicResult value, $Res Function(BasicResult) _then) = _$BasicResultCopyWithImpl;
@useResult
$Res call({
 String? id, dynamic message, bool? isAuthenticated, String? username, String? email, dynamic phoneNumber, List<String>? roles, dynamic token, dynamic expiresOn, int? accountType, DateTime? refreshTokenExpiration
});




}
/// @nodoc
class _$BasicResultCopyWithImpl<$Res>
    implements $BasicResultCopyWith<$Res> {
  _$BasicResultCopyWithImpl(this._self, this._then);

  final BasicResult _self;
  final $Res Function(BasicResult) _then;

/// Create a copy of BasicResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? message = freezed,Object? isAuthenticated = freezed,Object? username = freezed,Object? email = freezed,Object? phoneNumber = freezed,Object? roles = freezed,Object? token = freezed,Object? expiresOn = freezed,Object? accountType = freezed,Object? refreshTokenExpiration = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as dynamic,isAuthenticated: freezed == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as dynamic,roles: freezed == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as dynamic,expiresOn: freezed == expiresOn ? _self.expiresOn : expiresOn // ignore: cast_nullable_to_non_nullable
as dynamic,accountType: freezed == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as int?,refreshTokenExpiration: freezed == refreshTokenExpiration ? _self.refreshTokenExpiration : refreshTokenExpiration // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BasicResult].
extension BasicResultPatterns on BasicResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasicResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasicResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasicResult value)  $default,){
final _that = this;
switch (_that) {
case _BasicResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasicResult value)?  $default,){
final _that = this;
switch (_that) {
case _BasicResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  dynamic message,  bool? isAuthenticated,  String? username,  String? email,  dynamic phoneNumber,  List<String>? roles,  dynamic token,  dynamic expiresOn,  int? accountType,  DateTime? refreshTokenExpiration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BasicResult() when $default != null:
return $default(_that.id,_that.message,_that.isAuthenticated,_that.username,_that.email,_that.phoneNumber,_that.roles,_that.token,_that.expiresOn,_that.accountType,_that.refreshTokenExpiration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  dynamic message,  bool? isAuthenticated,  String? username,  String? email,  dynamic phoneNumber,  List<String>? roles,  dynamic token,  dynamic expiresOn,  int? accountType,  DateTime? refreshTokenExpiration)  $default,) {final _that = this;
switch (_that) {
case _BasicResult():
return $default(_that.id,_that.message,_that.isAuthenticated,_that.username,_that.email,_that.phoneNumber,_that.roles,_that.token,_that.expiresOn,_that.accountType,_that.refreshTokenExpiration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  dynamic message,  bool? isAuthenticated,  String? username,  String? email,  dynamic phoneNumber,  List<String>? roles,  dynamic token,  dynamic expiresOn,  int? accountType,  DateTime? refreshTokenExpiration)?  $default,) {final _that = this;
switch (_that) {
case _BasicResult() when $default != null:
return $default(_that.id,_that.message,_that.isAuthenticated,_that.username,_that.email,_that.phoneNumber,_that.roles,_that.token,_that.expiresOn,_that.accountType,_that.refreshTokenExpiration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BasicResult implements BasicResult {
  const _BasicResult({this.id, this.message, this.isAuthenticated, this.username, this.email, this.phoneNumber, final  List<String>? roles, this.token, this.expiresOn, this.accountType, this.refreshTokenExpiration}): _roles = roles;
  factory _BasicResult.fromJson(Map<String, dynamic> json) => _$BasicResultFromJson(json);

@override final  String? id;
@override final  dynamic message;
@override final  bool? isAuthenticated;
@override final  String? username;
@override final  String? email;
@override final  dynamic phoneNumber;
 final  List<String>? _roles;
@override List<String>? get roles {
  final value = _roles;
  if (value == null) return null;
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  dynamic token;
@override final  dynamic expiresOn;
@override final  int? accountType;
@override final  DateTime? refreshTokenExpiration;

/// Create a copy of BasicResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasicResultCopyWith<_BasicResult> get copyWith => __$BasicResultCopyWithImpl<_BasicResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BasicResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasicResult&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.message, message)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.phoneNumber, phoneNumber)&&const DeepCollectionEquality().equals(other._roles, _roles)&&const DeepCollectionEquality().equals(other.token, token)&&const DeepCollectionEquality().equals(other.expiresOn, expiresOn)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.refreshTokenExpiration, refreshTokenExpiration) || other.refreshTokenExpiration == refreshTokenExpiration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(message),isAuthenticated,username,email,const DeepCollectionEquality().hash(phoneNumber),const DeepCollectionEquality().hash(_roles),const DeepCollectionEquality().hash(token),const DeepCollectionEquality().hash(expiresOn),accountType,refreshTokenExpiration);

@override
String toString() {
  return 'BasicResult(id: $id, message: $message, isAuthenticated: $isAuthenticated, username: $username, email: $email, phoneNumber: $phoneNumber, roles: $roles, token: $token, expiresOn: $expiresOn, accountType: $accountType, refreshTokenExpiration: $refreshTokenExpiration)';
}


}

/// @nodoc
abstract mixin class _$BasicResultCopyWith<$Res> implements $BasicResultCopyWith<$Res> {
  factory _$BasicResultCopyWith(_BasicResult value, $Res Function(_BasicResult) _then) = __$BasicResultCopyWithImpl;
@override @useResult
$Res call({
 String? id, dynamic message, bool? isAuthenticated, String? username, String? email, dynamic phoneNumber, List<String>? roles, dynamic token, dynamic expiresOn, int? accountType, DateTime? refreshTokenExpiration
});




}
/// @nodoc
class __$BasicResultCopyWithImpl<$Res>
    implements _$BasicResultCopyWith<$Res> {
  __$BasicResultCopyWithImpl(this._self, this._then);

  final _BasicResult _self;
  final $Res Function(_BasicResult) _then;

/// Create a copy of BasicResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? message = freezed,Object? isAuthenticated = freezed,Object? username = freezed,Object? email = freezed,Object? phoneNumber = freezed,Object? roles = freezed,Object? token = freezed,Object? expiresOn = freezed,Object? accountType = freezed,Object? refreshTokenExpiration = freezed,}) {
  return _then(_BasicResult(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as dynamic,isAuthenticated: freezed == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as dynamic,roles: freezed == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as dynamic,expiresOn: freezed == expiresOn ? _self.expiresOn : expiresOn // ignore: cast_nullable_to_non_nullable
as dynamic,accountType: freezed == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as int?,refreshTokenExpiration: freezed == refreshTokenExpiration ? _self.refreshTokenExpiration : refreshTokenExpiration // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
