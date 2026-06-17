// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basic_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BasicResponse<T> {

 int? get statusCode; DateTime? get timestamp; bool? get isError; String? get message; T? get result;
/// Create a copy of BasicResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasicResponseCopyWith<T, BasicResponse<T>> get copyWith => _$BasicResponseCopyWithImpl<T, BasicResponse<T>>(this as BasicResponse<T>, _$identity);

  /// Serializes this BasicResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasicResponse<T>&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.result, result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,timestamp,isError,message,const DeepCollectionEquality().hash(result));

@override
String toString() {
  return 'BasicResponse<$T>(statusCode: $statusCode, timestamp: $timestamp, isError: $isError, message: $message, result: $result)';
}


}

/// @nodoc
abstract mixin class $BasicResponseCopyWith<T,$Res>  {
  factory $BasicResponseCopyWith(BasicResponse<T> value, $Res Function(BasicResponse<T>) _then) = _$BasicResponseCopyWithImpl;
@useResult
$Res call({
 int? statusCode, DateTime? timestamp, bool? isError, String? message, T? result
});




}
/// @nodoc
class _$BasicResponseCopyWithImpl<T,$Res>
    implements $BasicResponseCopyWith<T, $Res> {
  _$BasicResponseCopyWithImpl(this._self, this._then);

  final BasicResponse<T> _self;
  final $Res Function(BasicResponse<T>) _then;

/// Create a copy of BasicResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = freezed,Object? timestamp = freezed,Object? isError = freezed,Object? message = freezed,Object? result = freezed,}) {
  return _then(_self.copyWith(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,isError: freezed == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

}


/// Adds pattern-matching-related methods to [BasicResponse].
extension BasicResponsePatterns<T> on BasicResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasicResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasicResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasicResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _BasicResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasicResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _BasicResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? statusCode,  DateTime? timestamp,  bool? isError,  String? message,  T? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BasicResponse() when $default != null:
return $default(_that.statusCode,_that.timestamp,_that.isError,_that.message,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? statusCode,  DateTime? timestamp,  bool? isError,  String? message,  T? result)  $default,) {final _that = this;
switch (_that) {
case _BasicResponse():
return $default(_that.statusCode,_that.timestamp,_that.isError,_that.message,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? statusCode,  DateTime? timestamp,  bool? isError,  String? message,  T? result)?  $default,) {final _that = this;
switch (_that) {
case _BasicResponse() when $default != null:
return $default(_that.statusCode,_that.timestamp,_that.isError,_that.message,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _BasicResponse<T> implements BasicResponse<T> {
  const _BasicResponse({this.statusCode, this.timestamp, this.isError, this.message, this.result});
  factory _BasicResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$BasicResponseFromJson(json,fromJsonT);

@override final  int? statusCode;
@override final  DateTime? timestamp;
@override final  bool? isError;
@override final  String? message;
@override final  T? result;

/// Create a copy of BasicResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasicResponseCopyWith<T, _BasicResponse<T>> get copyWith => __$BasicResponseCopyWithImpl<T, _BasicResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$BasicResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasicResponse<T>&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.result, result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,timestamp,isError,message,const DeepCollectionEquality().hash(result));

@override
String toString() {
  return 'BasicResponse<$T>(statusCode: $statusCode, timestamp: $timestamp, isError: $isError, message: $message, result: $result)';
}


}

/// @nodoc
abstract mixin class _$BasicResponseCopyWith<T,$Res> implements $BasicResponseCopyWith<T, $Res> {
  factory _$BasicResponseCopyWith(_BasicResponse<T> value, $Res Function(_BasicResponse<T>) _then) = __$BasicResponseCopyWithImpl;
@override @useResult
$Res call({
 int? statusCode, DateTime? timestamp, bool? isError, String? message, T? result
});




}
/// @nodoc
class __$BasicResponseCopyWithImpl<T,$Res>
    implements _$BasicResponseCopyWith<T, $Res> {
  __$BasicResponseCopyWithImpl(this._self, this._then);

  final _BasicResponse<T> _self;
  final $Res Function(_BasicResponse<T>) _then;

/// Create a copy of BasicResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = freezed,Object? timestamp = freezed,Object? isError = freezed,Object? message = freezed,Object? result = freezed,}) {
  return _then(_BasicResponse<T>(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,isError: freezed == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

// dart format on
