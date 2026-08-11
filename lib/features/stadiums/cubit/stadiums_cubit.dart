// lib/features/stadiums/cubit/stadiums_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/features/stadiums/data/models/stadium_model.dart';
import 'package:dawri/features/stadiums/data/repositories/interfaces/i_stadiums_repository.dart';
import 'package:dawri/main_common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'stadiums_state.dart';
part 'stadiums_cubit.freezed.dart';

class StadiumsCubit extends Cubit<StadiumsState> {
  StadiumsCubit()
      : _repository = getIt<IStadiumsRepository>(),
        super(StadiumsState(dates: DateOptionsBuilder.buildWeek()));

  final IStadiumsRepository _repository;
  final RefreshController refreshController = RefreshController();

  static const int _limit = 10;

  /// Index 0 = "All" → omit sport_id; otherwise the selected sport's id.
  int? get _sportId => state.selectedSportIndex == 0
      ? null
      : state.sports[state.selectedSportIndex - 1].id;

  String get _date => state.dates[state.selectedDateIndex].apiDate;

  Future<void> init() async {
    // Show shimmer (list + sport chips) from the very first frame.
    emit(state.copyWith(status: const StadiumsStatus.loading()));
    await getSports();
    await getStadiums();
  }

  /// Sport chips: index 0 is always "All"; 1..n map to the fetched sports.
  Future<void> getSports() async {
    final result = await _repository.getSports();
    if (result.isError) return;
    emit(state.copyWith(sports: result.asValue!.value));
  }

  Future<void> selectDate(int index) async {
    if (state.selectedDateIndex == index) return;
    emit(state.copyWith(selectedDateIndex: index));
    await getStadiums();
  }

  Future<void> selectSport(int index) async {
    if (state.selectedSportIndex == index) return;
    emit(state.copyWith(selectedSportIndex: index));
    await getStadiums();
  }

  Future<void> getStadiums() async {
    if (state.dates.isEmpty) return;
    emit(state.copyWith(status: const StadiumsStatus.loading()));

    final result = await _repository.getStadiums(
      date: _date,
      sportId: _sportId,
      page: 1,
      limit: _limit,
    );

    if (result.isError) {
      emit(state.copyWith(status: const StadiumsStatus.error(), stadiums: const []));
      refreshController.refreshFailed();
      return;
    }

    emit(state.copyWith(
      status: const StadiumsStatus.success(),
      stadiums: result.asValue!.value,
      page: 1,
    ));
    refreshController.refreshCompleted();
    // A new filter/date can have more pages than the previous one.
    refreshController.resetNoData();
  }

  Future<void> loadMore() async {
    if (state.dates.isEmpty) return;

    // A short first page means there is nothing after it.
    if (state.stadiums.length < _limit) {
      refreshController.loadNoData();
      return;
    }

    final nextPage = state.page + 1;
    final result = await _repository.getStadiums(
      date: _date,
      sportId: _sportId,
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
      stadiums: [...state.stadiums, ...newItems],
      page: nextPage,
    ));

    newItems.length < _limit
        ? refreshController.loadNoData()
        : refreshController.loadComplete();
  }

  /// Re-fetches every page currently on screen and swaps the list in place.
  ///
  /// Used when coming back from the stadium profile, where the favourite and
  /// the rating can both change. Plain [getStadiums] would work but collapses
  /// the list to page one and throws away the user's scroll position; this
  /// keeps both. No loading status is emitted, so the cards update without a
  /// shimmer flash, and a failed request leaves what's on screen untouched.
  Future<void> refreshLoadedPages() async {
    if (state.dates.isEmpty) return;

    final merged = <StadiumModel>[];
    for (var page = 1; page <= state.page; page++) {
      final result = await _repository.getStadiums(
        date: _date,
        sportId: _sportId,
        page: page,
        limit: _limit,
      );
      if (result.isError) return;
      merged.addAll(result.asValue!.value);
    }

    if (isClosed) return;
    emit(state.copyWith(
      stadiums: merged,
      status: const StadiumsStatus.success(),
    ));
  }

  @override
  Future<void> close() {
    refreshController.dispose();
    return super.close();
  }
}
