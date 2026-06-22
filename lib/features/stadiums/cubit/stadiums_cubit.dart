// lib/features/stadiums/cubit/stadiums_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/features/stadiums/data/models/stadium_model.dart' ;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/stadium_model.dart' show DateOptionsBuilder;

part 'stadiums_state.dart';
part 'stadiums_cubit.freezed.dart';

class StadiumsCubit extends Cubit<StadiumsState> {
  StadiumsCubit()
      : super(StadiumsState(dates: DateOptionsBuilder.buildWeek()));

  void selectDate(int index) {
    emit(state.copyWith(selectedDateIndex: index));
  }

  void selectSport(int index) {
    emit(state.copyWith(selectedSportIndex: index));
  }
}