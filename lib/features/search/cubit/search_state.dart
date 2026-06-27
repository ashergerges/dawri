part of 'search_cubit.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default(SearchFilter.all) SearchFilter selectedFilter,
  }) = _SearchState;
}