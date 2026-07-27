// lib/features/stadiums/cubit/stadiums_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/features/stadiums/data/models/stadium_model.dart';
import 'package:dawri/features/stadiums/data/repositories/interfaces/i_stadiums_repository.dart';
import 'package:dawri/main_common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stadiums_state.dart';
part 'stadiums_cubit.freezed.dart';

class StadiumsCubit extends Cubit<StadiumsState> {
  StadiumsCubit()
      : _repository = getIt<IStadiumsRepository>(),
        super(StadiumsState(dates: DateOptionsBuilder.buildWeek()));

  final IStadiumsRepository _repository;

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

    final date = state.dates[state.selectedDateIndex].apiDate;
    // Index 0 = "All" → omit sport_id; otherwise the selected sport's id.
    final sportId = state.selectedSportIndex == 0
        ? null
        : state.sports[state.selectedSportIndex - 1].id;

    final result = await _repository.getStadiums(date: date, sportId: sportId);

    if (result.isError) {
      emit(state.copyWith(status: const StadiumsStatus.error(), stadiums: const []));
      return;
    }

    emit(state.copyWith(
      status: const StadiumsStatus.success(),
      stadiums: result.asValue!.value,
    ));
  }
}
