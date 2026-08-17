// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoritesState {

 FavoriteTab get selectedTab;// ─── Tab counts (drive the badges) ───────────────────────────
 FavoriteCounts? get counts;// ─── Tab 0 → type `product` ──────────────────────────────────
 List<FavoriteModel> get products; int get productsPage; bool get productsHasMore; FavoritesStatus get productsStatus;// ─── Tab 1 → type `stadium` ──────────────────────────────────
 List<FavoriteModel> get stadiums; int get stadiumsPage; bool get stadiumsHasMore; FavoritesStatus get stadiumsStatus;// ─── Tab 2 → type `championship` ─────────────────────────────
 List<FavoriteModel> get championships; int get championshipsPage; bool get championshipsHasMore; FavoritesStatus get championshipsStatus;// ─── Tab 3 → type `participant` ──────────────────────────────
 List<FavoriteModel> get participants; int get participantsPage; bool get participantsHasMore; FavoritesStatus get participantsStatus;// ─── Mutations ───────────────────────────────────────────────
 Set<int> get removingIds;
/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoritesStateCopyWith<FavoritesState> get copyWith => _$FavoritesStateCopyWithImpl<FavoritesState>(this as FavoritesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritesState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.counts, counts) || other.counts == counts)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.productsPage, productsPage) || other.productsPage == productsPage)&&(identical(other.productsHasMore, productsHasMore) || other.productsHasMore == productsHasMore)&&(identical(other.productsStatus, productsStatus) || other.productsStatus == productsStatus)&&const DeepCollectionEquality().equals(other.stadiums, stadiums)&&(identical(other.stadiumsPage, stadiumsPage) || other.stadiumsPage == stadiumsPage)&&(identical(other.stadiumsHasMore, stadiumsHasMore) || other.stadiumsHasMore == stadiumsHasMore)&&(identical(other.stadiumsStatus, stadiumsStatus) || other.stadiumsStatus == stadiumsStatus)&&const DeepCollectionEquality().equals(other.championships, championships)&&(identical(other.championshipsPage, championshipsPage) || other.championshipsPage == championshipsPage)&&(identical(other.championshipsHasMore, championshipsHasMore) || other.championshipsHasMore == championshipsHasMore)&&(identical(other.championshipsStatus, championshipsStatus) || other.championshipsStatus == championshipsStatus)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.participantsPage, participantsPage) || other.participantsPage == participantsPage)&&(identical(other.participantsHasMore, participantsHasMore) || other.participantsHasMore == participantsHasMore)&&(identical(other.participantsStatus, participantsStatus) || other.participantsStatus == participantsStatus)&&const DeepCollectionEquality().equals(other.removingIds, removingIds));
}


@override
int get hashCode => Object.hashAll([runtimeType,selectedTab,counts,const DeepCollectionEquality().hash(products),productsPage,productsHasMore,productsStatus,const DeepCollectionEquality().hash(stadiums),stadiumsPage,stadiumsHasMore,stadiumsStatus,const DeepCollectionEquality().hash(championships),championshipsPage,championshipsHasMore,championshipsStatus,const DeepCollectionEquality().hash(participants),participantsPage,participantsHasMore,participantsStatus,const DeepCollectionEquality().hash(removingIds)]);

@override
String toString() {
  return 'FavoritesState(selectedTab: $selectedTab, counts: $counts, products: $products, productsPage: $productsPage, productsHasMore: $productsHasMore, productsStatus: $productsStatus, stadiums: $stadiums, stadiumsPage: $stadiumsPage, stadiumsHasMore: $stadiumsHasMore, stadiumsStatus: $stadiumsStatus, championships: $championships, championshipsPage: $championshipsPage, championshipsHasMore: $championshipsHasMore, championshipsStatus: $championshipsStatus, participants: $participants, participantsPage: $participantsPage, participantsHasMore: $participantsHasMore, participantsStatus: $participantsStatus, removingIds: $removingIds)';
}


}

/// @nodoc
abstract mixin class $FavoritesStateCopyWith<$Res>  {
  factory $FavoritesStateCopyWith(FavoritesState value, $Res Function(FavoritesState) _then) = _$FavoritesStateCopyWithImpl;
@useResult
$Res call({
 FavoriteTab selectedTab, FavoriteCounts? counts, List<FavoriteModel> products, int productsPage, bool productsHasMore, FavoritesStatus productsStatus, List<FavoriteModel> stadiums, int stadiumsPage, bool stadiumsHasMore, FavoritesStatus stadiumsStatus, List<FavoriteModel> championships, int championshipsPage, bool championshipsHasMore, FavoritesStatus championshipsStatus, List<FavoriteModel> participants, int participantsPage, bool participantsHasMore, FavoritesStatus participantsStatus, Set<int> removingIds
});


$FavoritesStatusCopyWith<$Res> get productsStatus;$FavoritesStatusCopyWith<$Res> get stadiumsStatus;$FavoritesStatusCopyWith<$Res> get championshipsStatus;$FavoritesStatusCopyWith<$Res> get participantsStatus;

}
/// @nodoc
class _$FavoritesStateCopyWithImpl<$Res>
    implements $FavoritesStateCopyWith<$Res> {
  _$FavoritesStateCopyWithImpl(this._self, this._then);

  final FavoritesState _self;
  final $Res Function(FavoritesState) _then;

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTab = null,Object? counts = freezed,Object? products = null,Object? productsPage = null,Object? productsHasMore = null,Object? productsStatus = null,Object? stadiums = null,Object? stadiumsPage = null,Object? stadiumsHasMore = null,Object? stadiumsStatus = null,Object? championships = null,Object? championshipsPage = null,Object? championshipsHasMore = null,Object? championshipsStatus = null,Object? participants = null,Object? participantsPage = null,Object? participantsHasMore = null,Object? participantsStatus = null,Object? removingIds = null,}) {
  return _then(_self.copyWith(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as FavoriteTab,counts: freezed == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as FavoriteCounts?,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<FavoriteModel>,productsPage: null == productsPage ? _self.productsPage : productsPage // ignore: cast_nullable_to_non_nullable
as int,productsHasMore: null == productsHasMore ? _self.productsHasMore : productsHasMore // ignore: cast_nullable_to_non_nullable
as bool,productsStatus: null == productsStatus ? _self.productsStatus : productsStatus // ignore: cast_nullable_to_non_nullable
as FavoritesStatus,stadiums: null == stadiums ? _self.stadiums : stadiums // ignore: cast_nullable_to_non_nullable
as List<FavoriteModel>,stadiumsPage: null == stadiumsPage ? _self.stadiumsPage : stadiumsPage // ignore: cast_nullable_to_non_nullable
as int,stadiumsHasMore: null == stadiumsHasMore ? _self.stadiumsHasMore : stadiumsHasMore // ignore: cast_nullable_to_non_nullable
as bool,stadiumsStatus: null == stadiumsStatus ? _self.stadiumsStatus : stadiumsStatus // ignore: cast_nullable_to_non_nullable
as FavoritesStatus,championships: null == championships ? _self.championships : championships // ignore: cast_nullable_to_non_nullable
as List<FavoriteModel>,championshipsPage: null == championshipsPage ? _self.championshipsPage : championshipsPage // ignore: cast_nullable_to_non_nullable
as int,championshipsHasMore: null == championshipsHasMore ? _self.championshipsHasMore : championshipsHasMore // ignore: cast_nullable_to_non_nullable
as bool,championshipsStatus: null == championshipsStatus ? _self.championshipsStatus : championshipsStatus // ignore: cast_nullable_to_non_nullable
as FavoritesStatus,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<FavoriteModel>,participantsPage: null == participantsPage ? _self.participantsPage : participantsPage // ignore: cast_nullable_to_non_nullable
as int,participantsHasMore: null == participantsHasMore ? _self.participantsHasMore : participantsHasMore // ignore: cast_nullable_to_non_nullable
as bool,participantsStatus: null == participantsStatus ? _self.participantsStatus : participantsStatus // ignore: cast_nullable_to_non_nullable
as FavoritesStatus,removingIds: null == removingIds ? _self.removingIds : removingIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}
/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FavoritesStatusCopyWith<$Res> get productsStatus {
  
  return $FavoritesStatusCopyWith<$Res>(_self.productsStatus, (value) {
    return _then(_self.copyWith(productsStatus: value));
  });
}/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FavoritesStatusCopyWith<$Res> get stadiumsStatus {
  
  return $FavoritesStatusCopyWith<$Res>(_self.stadiumsStatus, (value) {
    return _then(_self.copyWith(stadiumsStatus: value));
  });
}/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FavoritesStatusCopyWith<$Res> get championshipsStatus {
  
  return $FavoritesStatusCopyWith<$Res>(_self.championshipsStatus, (value) {
    return _then(_self.copyWith(championshipsStatus: value));
  });
}/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FavoritesStatusCopyWith<$Res> get participantsStatus {
  
  return $FavoritesStatusCopyWith<$Res>(_self.participantsStatus, (value) {
    return _then(_self.copyWith(participantsStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [FavoritesState].
extension FavoritesStatePatterns on FavoritesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoritesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoritesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoritesState value)  $default,){
final _that = this;
switch (_that) {
case _FavoritesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoritesState value)?  $default,){
final _that = this;
switch (_that) {
case _FavoritesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FavoriteTab selectedTab,  FavoriteCounts? counts,  List<FavoriteModel> products,  int productsPage,  bool productsHasMore,  FavoritesStatus productsStatus,  List<FavoriteModel> stadiums,  int stadiumsPage,  bool stadiumsHasMore,  FavoritesStatus stadiumsStatus,  List<FavoriteModel> championships,  int championshipsPage,  bool championshipsHasMore,  FavoritesStatus championshipsStatus,  List<FavoriteModel> participants,  int participantsPage,  bool participantsHasMore,  FavoritesStatus participantsStatus,  Set<int> removingIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoritesState() when $default != null:
return $default(_that.selectedTab,_that.counts,_that.products,_that.productsPage,_that.productsHasMore,_that.productsStatus,_that.stadiums,_that.stadiumsPage,_that.stadiumsHasMore,_that.stadiumsStatus,_that.championships,_that.championshipsPage,_that.championshipsHasMore,_that.championshipsStatus,_that.participants,_that.participantsPage,_that.participantsHasMore,_that.participantsStatus,_that.removingIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FavoriteTab selectedTab,  FavoriteCounts? counts,  List<FavoriteModel> products,  int productsPage,  bool productsHasMore,  FavoritesStatus productsStatus,  List<FavoriteModel> stadiums,  int stadiumsPage,  bool stadiumsHasMore,  FavoritesStatus stadiumsStatus,  List<FavoriteModel> championships,  int championshipsPage,  bool championshipsHasMore,  FavoritesStatus championshipsStatus,  List<FavoriteModel> participants,  int participantsPage,  bool participantsHasMore,  FavoritesStatus participantsStatus,  Set<int> removingIds)  $default,) {final _that = this;
switch (_that) {
case _FavoritesState():
return $default(_that.selectedTab,_that.counts,_that.products,_that.productsPage,_that.productsHasMore,_that.productsStatus,_that.stadiums,_that.stadiumsPage,_that.stadiumsHasMore,_that.stadiumsStatus,_that.championships,_that.championshipsPage,_that.championshipsHasMore,_that.championshipsStatus,_that.participants,_that.participantsPage,_that.participantsHasMore,_that.participantsStatus,_that.removingIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FavoriteTab selectedTab,  FavoriteCounts? counts,  List<FavoriteModel> products,  int productsPage,  bool productsHasMore,  FavoritesStatus productsStatus,  List<FavoriteModel> stadiums,  int stadiumsPage,  bool stadiumsHasMore,  FavoritesStatus stadiumsStatus,  List<FavoriteModel> championships,  int championshipsPage,  bool championshipsHasMore,  FavoritesStatus championshipsStatus,  List<FavoriteModel> participants,  int participantsPage,  bool participantsHasMore,  FavoritesStatus participantsStatus,  Set<int> removingIds)?  $default,) {final _that = this;
switch (_that) {
case _FavoritesState() when $default != null:
return $default(_that.selectedTab,_that.counts,_that.products,_that.productsPage,_that.productsHasMore,_that.productsStatus,_that.stadiums,_that.stadiumsPage,_that.stadiumsHasMore,_that.stadiumsStatus,_that.championships,_that.championshipsPage,_that.championshipsHasMore,_that.championshipsStatus,_that.participants,_that.participantsPage,_that.participantsHasMore,_that.participantsStatus,_that.removingIds);case _:
  return null;

}
}

}

/// @nodoc


class _FavoritesState extends FavoritesState {
  const _FavoritesState({this.selectedTab = FavoriteTab.products, this.counts, final  List<FavoriteModel> products = const [], this.productsPage = 1, this.productsHasMore = true, this.productsStatus = const FavoritesStatus.initial(), final  List<FavoriteModel> stadiums = const [], this.stadiumsPage = 1, this.stadiumsHasMore = true, this.stadiumsStatus = const FavoritesStatus.initial(), final  List<FavoriteModel> championships = const [], this.championshipsPage = 1, this.championshipsHasMore = true, this.championshipsStatus = const FavoritesStatus.initial(), final  List<FavoriteModel> participants = const [], this.participantsPage = 1, this.participantsHasMore = true, this.participantsStatus = const FavoritesStatus.initial(), final  Set<int> removingIds = const <int>{}}): _products = products,_stadiums = stadiums,_championships = championships,_participants = participants,_removingIds = removingIds,super._();
  

@override@JsonKey() final  FavoriteTab selectedTab;
// ─── Tab counts (drive the badges) ───────────────────────────
@override final  FavoriteCounts? counts;
// ─── Tab 0 → type `product` ──────────────────────────────────
 final  List<FavoriteModel> _products;
// ─── Tab 0 → type `product` ──────────────────────────────────
@override@JsonKey() List<FavoriteModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override@JsonKey() final  int productsPage;
@override@JsonKey() final  bool productsHasMore;
@override@JsonKey() final  FavoritesStatus productsStatus;
// ─── Tab 1 → type `stadium` ──────────────────────────────────
 final  List<FavoriteModel> _stadiums;
// ─── Tab 1 → type `stadium` ──────────────────────────────────
@override@JsonKey() List<FavoriteModel> get stadiums {
  if (_stadiums is EqualUnmodifiableListView) return _stadiums;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stadiums);
}

@override@JsonKey() final  int stadiumsPage;
@override@JsonKey() final  bool stadiumsHasMore;
@override@JsonKey() final  FavoritesStatus stadiumsStatus;
// ─── Tab 2 → type `championship` ─────────────────────────────
 final  List<FavoriteModel> _championships;
// ─── Tab 2 → type `championship` ─────────────────────────────
@override@JsonKey() List<FavoriteModel> get championships {
  if (_championships is EqualUnmodifiableListView) return _championships;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_championships);
}

@override@JsonKey() final  int championshipsPage;
@override@JsonKey() final  bool championshipsHasMore;
@override@JsonKey() final  FavoritesStatus championshipsStatus;
// ─── Tab 3 → type `participant` ──────────────────────────────
 final  List<FavoriteModel> _participants;
// ─── Tab 3 → type `participant` ──────────────────────────────
@override@JsonKey() List<FavoriteModel> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@override@JsonKey() final  int participantsPage;
@override@JsonKey() final  bool participantsHasMore;
@override@JsonKey() final  FavoritesStatus participantsStatus;
// ─── Mutations ───────────────────────────────────────────────
 final  Set<int> _removingIds;
// ─── Mutations ───────────────────────────────────────────────
@override@JsonKey() Set<int> get removingIds {
  if (_removingIds is EqualUnmodifiableSetView) return _removingIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_removingIds);
}


/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoritesStateCopyWith<_FavoritesState> get copyWith => __$FavoritesStateCopyWithImpl<_FavoritesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoritesState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.counts, counts) || other.counts == counts)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.productsPage, productsPage) || other.productsPage == productsPage)&&(identical(other.productsHasMore, productsHasMore) || other.productsHasMore == productsHasMore)&&(identical(other.productsStatus, productsStatus) || other.productsStatus == productsStatus)&&const DeepCollectionEquality().equals(other._stadiums, _stadiums)&&(identical(other.stadiumsPage, stadiumsPage) || other.stadiumsPage == stadiumsPage)&&(identical(other.stadiumsHasMore, stadiumsHasMore) || other.stadiumsHasMore == stadiumsHasMore)&&(identical(other.stadiumsStatus, stadiumsStatus) || other.stadiumsStatus == stadiumsStatus)&&const DeepCollectionEquality().equals(other._championships, _championships)&&(identical(other.championshipsPage, championshipsPage) || other.championshipsPage == championshipsPage)&&(identical(other.championshipsHasMore, championshipsHasMore) || other.championshipsHasMore == championshipsHasMore)&&(identical(other.championshipsStatus, championshipsStatus) || other.championshipsStatus == championshipsStatus)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.participantsPage, participantsPage) || other.participantsPage == participantsPage)&&(identical(other.participantsHasMore, participantsHasMore) || other.participantsHasMore == participantsHasMore)&&(identical(other.participantsStatus, participantsStatus) || other.participantsStatus == participantsStatus)&&const DeepCollectionEquality().equals(other._removingIds, _removingIds));
}


@override
int get hashCode => Object.hashAll([runtimeType,selectedTab,counts,const DeepCollectionEquality().hash(_products),productsPage,productsHasMore,productsStatus,const DeepCollectionEquality().hash(_stadiums),stadiumsPage,stadiumsHasMore,stadiumsStatus,const DeepCollectionEquality().hash(_championships),championshipsPage,championshipsHasMore,championshipsStatus,const DeepCollectionEquality().hash(_participants),participantsPage,participantsHasMore,participantsStatus,const DeepCollectionEquality().hash(_removingIds)]);

@override
String toString() {
  return 'FavoritesState(selectedTab: $selectedTab, counts: $counts, products: $products, productsPage: $productsPage, productsHasMore: $productsHasMore, productsStatus: $productsStatus, stadiums: $stadiums, stadiumsPage: $stadiumsPage, stadiumsHasMore: $stadiumsHasMore, stadiumsStatus: $stadiumsStatus, championships: $championships, championshipsPage: $championshipsPage, championshipsHasMore: $championshipsHasMore, championshipsStatus: $championshipsStatus, participants: $participants, participantsPage: $participantsPage, participantsHasMore: $participantsHasMore, participantsStatus: $participantsStatus, removingIds: $removingIds)';
}


}

/// @nodoc
abstract mixin class _$FavoritesStateCopyWith<$Res> implements $FavoritesStateCopyWith<$Res> {
  factory _$FavoritesStateCopyWith(_FavoritesState value, $Res Function(_FavoritesState) _then) = __$FavoritesStateCopyWithImpl;
@override @useResult
$Res call({
 FavoriteTab selectedTab, FavoriteCounts? counts, List<FavoriteModel> products, int productsPage, bool productsHasMore, FavoritesStatus productsStatus, List<FavoriteModel> stadiums, int stadiumsPage, bool stadiumsHasMore, FavoritesStatus stadiumsStatus, List<FavoriteModel> championships, int championshipsPage, bool championshipsHasMore, FavoritesStatus championshipsStatus, List<FavoriteModel> participants, int participantsPage, bool participantsHasMore, FavoritesStatus participantsStatus, Set<int> removingIds
});


@override $FavoritesStatusCopyWith<$Res> get productsStatus;@override $FavoritesStatusCopyWith<$Res> get stadiumsStatus;@override $FavoritesStatusCopyWith<$Res> get championshipsStatus;@override $FavoritesStatusCopyWith<$Res> get participantsStatus;

}
/// @nodoc
class __$FavoritesStateCopyWithImpl<$Res>
    implements _$FavoritesStateCopyWith<$Res> {
  __$FavoritesStateCopyWithImpl(this._self, this._then);

  final _FavoritesState _self;
  final $Res Function(_FavoritesState) _then;

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,Object? counts = freezed,Object? products = null,Object? productsPage = null,Object? productsHasMore = null,Object? productsStatus = null,Object? stadiums = null,Object? stadiumsPage = null,Object? stadiumsHasMore = null,Object? stadiumsStatus = null,Object? championships = null,Object? championshipsPage = null,Object? championshipsHasMore = null,Object? championshipsStatus = null,Object? participants = null,Object? participantsPage = null,Object? participantsHasMore = null,Object? participantsStatus = null,Object? removingIds = null,}) {
  return _then(_FavoritesState(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as FavoriteTab,counts: freezed == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as FavoriteCounts?,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<FavoriteModel>,productsPage: null == productsPage ? _self.productsPage : productsPage // ignore: cast_nullable_to_non_nullable
as int,productsHasMore: null == productsHasMore ? _self.productsHasMore : productsHasMore // ignore: cast_nullable_to_non_nullable
as bool,productsStatus: null == productsStatus ? _self.productsStatus : productsStatus // ignore: cast_nullable_to_non_nullable
as FavoritesStatus,stadiums: null == stadiums ? _self._stadiums : stadiums // ignore: cast_nullable_to_non_nullable
as List<FavoriteModel>,stadiumsPage: null == stadiumsPage ? _self.stadiumsPage : stadiumsPage // ignore: cast_nullable_to_non_nullable
as int,stadiumsHasMore: null == stadiumsHasMore ? _self.stadiumsHasMore : stadiumsHasMore // ignore: cast_nullable_to_non_nullable
as bool,stadiumsStatus: null == stadiumsStatus ? _self.stadiumsStatus : stadiumsStatus // ignore: cast_nullable_to_non_nullable
as FavoritesStatus,championships: null == championships ? _self._championships : championships // ignore: cast_nullable_to_non_nullable
as List<FavoriteModel>,championshipsPage: null == championshipsPage ? _self.championshipsPage : championshipsPage // ignore: cast_nullable_to_non_nullable
as int,championshipsHasMore: null == championshipsHasMore ? _self.championshipsHasMore : championshipsHasMore // ignore: cast_nullable_to_non_nullable
as bool,championshipsStatus: null == championshipsStatus ? _self.championshipsStatus : championshipsStatus // ignore: cast_nullable_to_non_nullable
as FavoritesStatus,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<FavoriteModel>,participantsPage: null == participantsPage ? _self.participantsPage : participantsPage // ignore: cast_nullable_to_non_nullable
as int,participantsHasMore: null == participantsHasMore ? _self.participantsHasMore : participantsHasMore // ignore: cast_nullable_to_non_nullable
as bool,participantsStatus: null == participantsStatus ? _self.participantsStatus : participantsStatus // ignore: cast_nullable_to_non_nullable
as FavoritesStatus,removingIds: null == removingIds ? _self._removingIds : removingIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FavoritesStatusCopyWith<$Res> get productsStatus {
  
  return $FavoritesStatusCopyWith<$Res>(_self.productsStatus, (value) {
    return _then(_self.copyWith(productsStatus: value));
  });
}/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FavoritesStatusCopyWith<$Res> get stadiumsStatus {
  
  return $FavoritesStatusCopyWith<$Res>(_self.stadiumsStatus, (value) {
    return _then(_self.copyWith(stadiumsStatus: value));
  });
}/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FavoritesStatusCopyWith<$Res> get championshipsStatus {
  
  return $FavoritesStatusCopyWith<$Res>(_self.championshipsStatus, (value) {
    return _then(_self.copyWith(championshipsStatus: value));
  });
}/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FavoritesStatusCopyWith<$Res> get participantsStatus {
  
  return $FavoritesStatusCopyWith<$Res>(_self.participantsStatus, (value) {
    return _then(_self.copyWith(participantsStatus: value));
  });
}
}

/// @nodoc
mixin _$FavoritesStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritesStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoritesStatus()';
}


}

/// @nodoc
class $FavoritesStatusCopyWith<$Res>  {
$FavoritesStatusCopyWith(FavoritesStatus _, $Res Function(FavoritesStatus) __);
}


/// Adds pattern-matching-related methods to [FavoritesStatus].
extension FavoritesStatusPatterns on FavoritesStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FavoritesStatusInitial value)?  initial,TResult Function( FavoritesStatusLoading value)?  loading,TResult Function( FavoritesStatusSuccess value)?  success,TResult Function( FavoritesStatusError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FavoritesStatusInitial() when initial != null:
return initial(_that);case FavoritesStatusLoading() when loading != null:
return loading(_that);case FavoritesStatusSuccess() when success != null:
return success(_that);case FavoritesStatusError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FavoritesStatusInitial value)  initial,required TResult Function( FavoritesStatusLoading value)  loading,required TResult Function( FavoritesStatusSuccess value)  success,required TResult Function( FavoritesStatusError value)  error,}){
final _that = this;
switch (_that) {
case FavoritesStatusInitial():
return initial(_that);case FavoritesStatusLoading():
return loading(_that);case FavoritesStatusSuccess():
return success(_that);case FavoritesStatusError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FavoritesStatusInitial value)?  initial,TResult? Function( FavoritesStatusLoading value)?  loading,TResult? Function( FavoritesStatusSuccess value)?  success,TResult? Function( FavoritesStatusError value)?  error,}){
final _that = this;
switch (_that) {
case FavoritesStatusInitial() when initial != null:
return initial(_that);case FavoritesStatusLoading() when loading != null:
return loading(_that);case FavoritesStatusSuccess() when success != null:
return success(_that);case FavoritesStatusError() when error != null:
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
case FavoritesStatusInitial() when initial != null:
return initial();case FavoritesStatusLoading() when loading != null:
return loading();case FavoritesStatusSuccess() when success != null:
return success();case FavoritesStatusError() when error != null:
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
case FavoritesStatusInitial():
return initial();case FavoritesStatusLoading():
return loading();case FavoritesStatusSuccess():
return success();case FavoritesStatusError():
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
case FavoritesStatusInitial() when initial != null:
return initial();case FavoritesStatusLoading() when loading != null:
return loading();case FavoritesStatusSuccess() when success != null:
return success();case FavoritesStatusError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class FavoritesStatusInitial implements FavoritesStatus {
  const FavoritesStatusInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritesStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoritesStatus.initial()';
}


}




/// @nodoc


class FavoritesStatusLoading implements FavoritesStatus {
  const FavoritesStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritesStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoritesStatus.loading()';
}


}




/// @nodoc


class FavoritesStatusSuccess implements FavoritesStatus {
  const FavoritesStatusSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritesStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoritesStatus.success()';
}


}




/// @nodoc


class FavoritesStatusError implements FavoritesStatus {
  const FavoritesStatusError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritesStatusError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoritesStatus.error()';
}


}




// dart format on
