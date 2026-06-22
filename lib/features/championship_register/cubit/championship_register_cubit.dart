// lib/features/championship_register/cubit/championship_register_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/championship_register/data/models/championship_register_model.dart';

part 'championship_register_state.dart';
part 'championship_register_cubit.freezed.dart';

class ChampionshipRegisterCubit extends Cubit<ChampionshipRegisterState> {
  ChampionshipRegisterCubit() : super(const ChampionshipRegisterState());

  void selectRole(ParticipantRole role) {
    emit(state.copyWith(selectedRole: role));
  }

  void updateFullName(String value) {
    emit(state.copyWith(fullName: value));
  }

  void updatePhone(String value) {
    emit(state.copyWith(phone: value));
  }

  void updateRegion(String value) {
    emit(state.copyWith(region: value));
  }

  Future<void> submitRegistration() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(milliseconds: 800));
    emit(state.copyWith(isLoading: false, isSuccess: true));
  }
}