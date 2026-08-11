// lib/features/search/cubit/search_cubit.dart
import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dawri/features/search/data/models/search_model.dart';
import 'package:dawri/features/search/data/repositories/interfaces/i_search_repository.dart';
import 'package:dawri/main_common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit()
      : _repository = getIt<ISearchRepository>(),
        super(const SearchState());

  final ISearchRepository _repository;
  final RefreshController refreshController = RefreshController();

  static const int _limit = 20;

  Timer? _debounce;

  // ─── Query ─────────────────────────────────────────────────────────────────
  void updateQuery(String value) {
    emit(state.copyWith(query: value));

    // Typing shouldn't fire a request per keystroke.
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), getResults);
  }

  void clearQuery() {
    _debounce?.cancel();
    emit(state.copyWith(query: ''));
    getResults();
  }

  void selectFilter(SearchFilter filter) {
    if (state.selectedFilter == filter) return;
    emit(state.copyWith(selectedFilter: filter, results: const [], page: 1));
    getResults();
  }

  // ─── Results ───────────────────────────────────────────────────────────────
  Future<void> getResults() async {
    emit(state.copyWith(status: const SearchStatus.loading(), errorMessage: null));

    final result = await _repository.search(
      type: state.selectedFilter.typeParam,
      query: state.query,
      page: 1,
      limit: _limit,
    );

    if (result.isError) {
      final error = result.asError?.error;
      log('SearchCubit.getResults failed: $error');
      emit(state.copyWith(
        status: const SearchStatus.error(),
        errorMessage: error?.toString(),
      ));
      refreshController.refreshFailed();
      return;
    }

    emit(state.copyWith(
      status: const SearchStatus.success(),
      results: result.asValue!.value,
      page: 1,
      errorMessage: null,
    ));
    refreshController.refreshCompleted();
    refreshController.resetNoData();
  }

  Future<void> loadMore() async {
    if (state.results.length < _limit) {
      refreshController.loadNoData();
      return;
    }

    final nextPage = state.page + 1;
    final result = await _repository.search(
      type: state.selectedFilter.typeParam,
      query: state.query,
      page: nextPage,
      limit: _limit,
    );

    if (result.isError) {
      refreshController.loadFailed();
      return;
    }

    final newItems = result.asValue!.value;
    if (newItems.isEmpty) {
      refreshController.loadNoData();
      return;
    }

    emit(state.copyWith(
      results: [...state.results, ...newItems],
      page: nextPage,
    ));

    newItems.length < _limit
        ? refreshController.loadNoData()
        : refreshController.loadComplete();
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    refreshController.dispose();
    return super.close();
  }
}
