import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'championships_state.dart';
part 'championships_cubit.freezed.dart';

class ChampionshipsCubit extends Cubit<ChampionshipsState> {
  ChampionshipsCubit() : super(const ChampionshipsState());

  void selectTab( int index) {
    emit(state.copyWith(activeTab: index));
  }
}
