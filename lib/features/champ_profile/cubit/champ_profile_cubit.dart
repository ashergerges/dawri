// lib/features/champ_profile/cubit/champ_profile_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/features/champ_profile/data/models/champ_profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'champ_profile_state.dart';
part 'champ_profile_cubit.freezed.dart';

class ChampProfileCubit extends Cubit<ChampProfileState> {
  ChampProfileCubit() : super(const ChampProfileState());

  void selectTab(ChampTab tab) => emit(state.copyWith(selectedTab: tab));

  void toggleFav() => emit(state.copyWith(isFav: !state.isFav));

  Future<void> registerTeam() async {
    if (state.isRegistering || state.isRegistered) return;
    emit(state.copyWith(isRegistering: true));
    await Future.delayed(const Duration(milliseconds: 1000));
    emit(state.copyWith(isRegistering: false, showSuccessModal: true));
  }

  void closeModal() => emit(state.copyWith(showSuccessModal: false, isRegistered: true));
}