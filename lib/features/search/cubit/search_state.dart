part of 'search_cubit.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default(SearchFilter.all) SearchFilter selectedFilter,
    @Default([]) List<SearchResultModel> results,
    @Default(SearchStatus.initial()) SearchStatus status,
    @Default(1) int page,

    /// Real failure reason, shown instead of the generic message so a parsing
    /// or server error is diagnosable from the screen itself.
    String? errorMessage,
  }) = _SearchState;

  const SearchState._();

  bool get isLoading => status is SearchStatusLoading;

  bool get hasError => status is SearchStatusError;

  /// Only true once a request has come back — keeps the empty state from
  /// flashing before the first load resolves.
  bool get isEmpty => results.isEmpty && status is SearchStatusSuccess;
}

@freezed
class SearchStatus with _$SearchStatus {
  const factory SearchStatus.initial() = SearchStatusInitial;
  const factory SearchStatus.loading() = SearchStatusLoading;
  const factory SearchStatus.success() = SearchStatusSuccess;
  const factory SearchStatus.error() = SearchStatusError;
}
