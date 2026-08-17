// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'help_center_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HelpCenterState {

// ─── Search / accordion (UI-local) ───────────────────────────
 String get searchQuery; String? get openFaqId; int? get selectedCategoryId;// ─── Help content (categories + FAQs) ────────────────────────
 List<FaqCategoryModel> get categories; List<FaqModel> get faqs; HelpStatus get contentStatus;/// True when the API failed and the bundled copy is on screen instead.
 bool get isFallbackContent;// ─── Support contact channels ────────────────────────────────
 SettingsModel? get support; HelpStatus get supportStatus;
/// Create a copy of HelpCenterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HelpCenterStateCopyWith<HelpCenterState> get copyWith => _$HelpCenterStateCopyWithImpl<HelpCenterState>(this as HelpCenterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HelpCenterState&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.openFaqId, openFaqId) || other.openFaqId == openFaqId)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.faqs, faqs)&&(identical(other.contentStatus, contentStatus) || other.contentStatus == contentStatus)&&(identical(other.isFallbackContent, isFallbackContent) || other.isFallbackContent == isFallbackContent)&&(identical(other.support, support) || other.support == support)&&(identical(other.supportStatus, supportStatus) || other.supportStatus == supportStatus));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,openFaqId,selectedCategoryId,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(faqs),contentStatus,isFallbackContent,support,supportStatus);

@override
String toString() {
  return 'HelpCenterState(searchQuery: $searchQuery, openFaqId: $openFaqId, selectedCategoryId: $selectedCategoryId, categories: $categories, faqs: $faqs, contentStatus: $contentStatus, isFallbackContent: $isFallbackContent, support: $support, supportStatus: $supportStatus)';
}


}

/// @nodoc
abstract mixin class $HelpCenterStateCopyWith<$Res>  {
  factory $HelpCenterStateCopyWith(HelpCenterState value, $Res Function(HelpCenterState) _then) = _$HelpCenterStateCopyWithImpl;
@useResult
$Res call({
 String searchQuery, String? openFaqId, int? selectedCategoryId, List<FaqCategoryModel> categories, List<FaqModel> faqs, HelpStatus contentStatus, bool isFallbackContent, SettingsModel? support, HelpStatus supportStatus
});


$HelpStatusCopyWith<$Res> get contentStatus;$HelpStatusCopyWith<$Res> get supportStatus;

}
/// @nodoc
class _$HelpCenterStateCopyWithImpl<$Res>
    implements $HelpCenterStateCopyWith<$Res> {
  _$HelpCenterStateCopyWithImpl(this._self, this._then);

  final HelpCenterState _self;
  final $Res Function(HelpCenterState) _then;

/// Create a copy of HelpCenterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchQuery = null,Object? openFaqId = freezed,Object? selectedCategoryId = freezed,Object? categories = null,Object? faqs = null,Object? contentStatus = null,Object? isFallbackContent = null,Object? support = freezed,Object? supportStatus = null,}) {
  return _then(_self.copyWith(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,openFaqId: freezed == openFaqId ? _self.openFaqId : openFaqId // ignore: cast_nullable_to_non_nullable
as String?,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as int?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<FaqCategoryModel>,faqs: null == faqs ? _self.faqs : faqs // ignore: cast_nullable_to_non_nullable
as List<FaqModel>,contentStatus: null == contentStatus ? _self.contentStatus : contentStatus // ignore: cast_nullable_to_non_nullable
as HelpStatus,isFallbackContent: null == isFallbackContent ? _self.isFallbackContent : isFallbackContent // ignore: cast_nullable_to_non_nullable
as bool,support: freezed == support ? _self.support : support // ignore: cast_nullable_to_non_nullable
as SettingsModel?,supportStatus: null == supportStatus ? _self.supportStatus : supportStatus // ignore: cast_nullable_to_non_nullable
as HelpStatus,
  ));
}
/// Create a copy of HelpCenterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HelpStatusCopyWith<$Res> get contentStatus {
  
  return $HelpStatusCopyWith<$Res>(_self.contentStatus, (value) {
    return _then(_self.copyWith(contentStatus: value));
  });
}/// Create a copy of HelpCenterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HelpStatusCopyWith<$Res> get supportStatus {
  
  return $HelpStatusCopyWith<$Res>(_self.supportStatus, (value) {
    return _then(_self.copyWith(supportStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [HelpCenterState].
extension HelpCenterStatePatterns on HelpCenterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HelpCenterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HelpCenterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HelpCenterState value)  $default,){
final _that = this;
switch (_that) {
case _HelpCenterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HelpCenterState value)?  $default,){
final _that = this;
switch (_that) {
case _HelpCenterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String searchQuery,  String? openFaqId,  int? selectedCategoryId,  List<FaqCategoryModel> categories,  List<FaqModel> faqs,  HelpStatus contentStatus,  bool isFallbackContent,  SettingsModel? support,  HelpStatus supportStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HelpCenterState() when $default != null:
return $default(_that.searchQuery,_that.openFaqId,_that.selectedCategoryId,_that.categories,_that.faqs,_that.contentStatus,_that.isFallbackContent,_that.support,_that.supportStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String searchQuery,  String? openFaqId,  int? selectedCategoryId,  List<FaqCategoryModel> categories,  List<FaqModel> faqs,  HelpStatus contentStatus,  bool isFallbackContent,  SettingsModel? support,  HelpStatus supportStatus)  $default,) {final _that = this;
switch (_that) {
case _HelpCenterState():
return $default(_that.searchQuery,_that.openFaqId,_that.selectedCategoryId,_that.categories,_that.faqs,_that.contentStatus,_that.isFallbackContent,_that.support,_that.supportStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String searchQuery,  String? openFaqId,  int? selectedCategoryId,  List<FaqCategoryModel> categories,  List<FaqModel> faqs,  HelpStatus contentStatus,  bool isFallbackContent,  SettingsModel? support,  HelpStatus supportStatus)?  $default,) {final _that = this;
switch (_that) {
case _HelpCenterState() when $default != null:
return $default(_that.searchQuery,_that.openFaqId,_that.selectedCategoryId,_that.categories,_that.faqs,_that.contentStatus,_that.isFallbackContent,_that.support,_that.supportStatus);case _:
  return null;

}
}

}

/// @nodoc


class _HelpCenterState extends HelpCenterState {
  const _HelpCenterState({this.searchQuery = '', this.openFaqId, this.selectedCategoryId, final  List<FaqCategoryModel> categories = const [], final  List<FaqModel> faqs = const [], this.contentStatus = const HelpStatus.initial(), this.isFallbackContent = false, this.support, this.supportStatus = const HelpStatus.initial()}): _categories = categories,_faqs = faqs,super._();
  

// ─── Search / accordion (UI-local) ───────────────────────────
@override@JsonKey() final  String searchQuery;
@override final  String? openFaqId;
@override final  int? selectedCategoryId;
// ─── Help content (categories + FAQs) ────────────────────────
 final  List<FaqCategoryModel> _categories;
// ─── Help content (categories + FAQs) ────────────────────────
@override@JsonKey() List<FaqCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<FaqModel> _faqs;
@override@JsonKey() List<FaqModel> get faqs {
  if (_faqs is EqualUnmodifiableListView) return _faqs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_faqs);
}

@override@JsonKey() final  HelpStatus contentStatus;
/// True when the API failed and the bundled copy is on screen instead.
@override@JsonKey() final  bool isFallbackContent;
// ─── Support contact channels ────────────────────────────────
@override final  SettingsModel? support;
@override@JsonKey() final  HelpStatus supportStatus;

/// Create a copy of HelpCenterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HelpCenterStateCopyWith<_HelpCenterState> get copyWith => __$HelpCenterStateCopyWithImpl<_HelpCenterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HelpCenterState&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.openFaqId, openFaqId) || other.openFaqId == openFaqId)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._faqs, _faqs)&&(identical(other.contentStatus, contentStatus) || other.contentStatus == contentStatus)&&(identical(other.isFallbackContent, isFallbackContent) || other.isFallbackContent == isFallbackContent)&&(identical(other.support, support) || other.support == support)&&(identical(other.supportStatus, supportStatus) || other.supportStatus == supportStatus));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,openFaqId,selectedCategoryId,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_faqs),contentStatus,isFallbackContent,support,supportStatus);

@override
String toString() {
  return 'HelpCenterState(searchQuery: $searchQuery, openFaqId: $openFaqId, selectedCategoryId: $selectedCategoryId, categories: $categories, faqs: $faqs, contentStatus: $contentStatus, isFallbackContent: $isFallbackContent, support: $support, supportStatus: $supportStatus)';
}


}

/// @nodoc
abstract mixin class _$HelpCenterStateCopyWith<$Res> implements $HelpCenterStateCopyWith<$Res> {
  factory _$HelpCenterStateCopyWith(_HelpCenterState value, $Res Function(_HelpCenterState) _then) = __$HelpCenterStateCopyWithImpl;
@override @useResult
$Res call({
 String searchQuery, String? openFaqId, int? selectedCategoryId, List<FaqCategoryModel> categories, List<FaqModel> faqs, HelpStatus contentStatus, bool isFallbackContent, SettingsModel? support, HelpStatus supportStatus
});


@override $HelpStatusCopyWith<$Res> get contentStatus;@override $HelpStatusCopyWith<$Res> get supportStatus;

}
/// @nodoc
class __$HelpCenterStateCopyWithImpl<$Res>
    implements _$HelpCenterStateCopyWith<$Res> {
  __$HelpCenterStateCopyWithImpl(this._self, this._then);

  final _HelpCenterState _self;
  final $Res Function(_HelpCenterState) _then;

/// Create a copy of HelpCenterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchQuery = null,Object? openFaqId = freezed,Object? selectedCategoryId = freezed,Object? categories = null,Object? faqs = null,Object? contentStatus = null,Object? isFallbackContent = null,Object? support = freezed,Object? supportStatus = null,}) {
  return _then(_HelpCenterState(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,openFaqId: freezed == openFaqId ? _self.openFaqId : openFaqId // ignore: cast_nullable_to_non_nullable
as String?,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as int?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<FaqCategoryModel>,faqs: null == faqs ? _self._faqs : faqs // ignore: cast_nullable_to_non_nullable
as List<FaqModel>,contentStatus: null == contentStatus ? _self.contentStatus : contentStatus // ignore: cast_nullable_to_non_nullable
as HelpStatus,isFallbackContent: null == isFallbackContent ? _self.isFallbackContent : isFallbackContent // ignore: cast_nullable_to_non_nullable
as bool,support: freezed == support ? _self.support : support // ignore: cast_nullable_to_non_nullable
as SettingsModel?,supportStatus: null == supportStatus ? _self.supportStatus : supportStatus // ignore: cast_nullable_to_non_nullable
as HelpStatus,
  ));
}

/// Create a copy of HelpCenterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HelpStatusCopyWith<$Res> get contentStatus {
  
  return $HelpStatusCopyWith<$Res>(_self.contentStatus, (value) {
    return _then(_self.copyWith(contentStatus: value));
  });
}/// Create a copy of HelpCenterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HelpStatusCopyWith<$Res> get supportStatus {
  
  return $HelpStatusCopyWith<$Res>(_self.supportStatus, (value) {
    return _then(_self.copyWith(supportStatus: value));
  });
}
}

/// @nodoc
mixin _$HelpStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HelpStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HelpStatus()';
}


}

/// @nodoc
class $HelpStatusCopyWith<$Res>  {
$HelpStatusCopyWith(HelpStatus _, $Res Function(HelpStatus) __);
}


/// Adds pattern-matching-related methods to [HelpStatus].
extension HelpStatusPatterns on HelpStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HelpStatusInitial value)?  initial,TResult Function( HelpStatusLoading value)?  loading,TResult Function( HelpStatusSuccess value)?  success,TResult Function( HelpStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HelpStatusInitial() when initial != null:
return initial(_that);case HelpStatusLoading() when loading != null:
return loading(_that);case HelpStatusSuccess() when success != null:
return success(_that);case HelpStatusError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HelpStatusInitial value)  initial,required TResult Function( HelpStatusLoading value)  loading,required TResult Function( HelpStatusSuccess value)  success,required TResult Function( HelpStatusError value)  error,}){
final _that = this;
switch (_that) {
case HelpStatusInitial():
return initial(_that);case HelpStatusLoading():
return loading(_that);case HelpStatusSuccess():
return success(_that);case HelpStatusError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HelpStatusInitial value)?  initial,TResult? Function( HelpStatusLoading value)?  loading,TResult? Function( HelpStatusSuccess value)?  success,TResult? Function( HelpStatusError value)?  error,}){
final _that = this;
switch (_that) {
case HelpStatusInitial() when initial != null:
return initial(_that);case HelpStatusLoading() when loading != null:
return loading(_that);case HelpStatusSuccess() when success != null:
return success(_that);case HelpStatusError() when error != null:
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
case HelpStatusInitial() when initial != null:
return initial();case HelpStatusLoading() when loading != null:
return loading();case HelpStatusSuccess() when success != null:
return success();case HelpStatusError() when error != null:
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
case HelpStatusInitial():
return initial();case HelpStatusLoading():
return loading();case HelpStatusSuccess():
return success();case HelpStatusError():
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
case HelpStatusInitial() when initial != null:
return initial();case HelpStatusLoading() when loading != null:
return loading();case HelpStatusSuccess() when success != null:
return success();case HelpStatusError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class HelpStatusInitial implements HelpStatus {
  const HelpStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HelpStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HelpStatus.initial()';
}


}




/// @nodoc


class HelpStatusLoading implements HelpStatus {
  const HelpStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HelpStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HelpStatus.loading()';
}


}




/// @nodoc


class HelpStatusSuccess implements HelpStatus {
  const HelpStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HelpStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HelpStatus.success()';
}


}




/// @nodoc


class HelpStatusError implements HelpStatus {
  const HelpStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HelpStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HelpStatus.error()';
}


}




// dart format on
