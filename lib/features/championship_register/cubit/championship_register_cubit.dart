import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/championship_register/data/models/championship_register_model.dart';
import 'package:dawri/features/championship_register/data/repositories/interfaces/i_championship_register_repository.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'championship_register_state.dart';
part 'championship_register_cubit.freezed.dart';

class ChampionshipRegisterCubit extends Cubit<ChampionshipRegisterState> {
  ChampionshipRegisterCubit(this.championshipId)
      : _repository = getIt<IChampionshipRegisterRepository>(),
        super(const ChampionshipRegisterState());

  final int championshipId;
  final IChampionshipRegisterRepository _repository;

  // ─── Load Options ────────────────────────────────────────────────────────
  Future<void> loadFormOptions() async {
    emit(state.copyWith(optionsStatus: const ChampionshipRegisterOptionsStatus.loading()));

    final typesResult = await _repository.getParticipantTypes();
    final citiesResult = await _repository.getCities();

    if (typesResult.isError || citiesResult.isError) {
      emit(state.copyWith(optionsStatus: const ChampionshipRegisterOptionsStatus.error()));
      return;
    }

    emit(state.copyWith(
      optionsStatus: const ChampionshipRegisterOptionsStatus.success(),
      participantTypes: typesResult.asValue?.value ?? [],
      cities: citiesResult.asValue?.value ?? [],
    ));
  }

  // ─── Update Methods ──────────────────────────────────────────────────────
  void selectParticipantType(int id) => emit(state.copyWith(selectedParticipantTypeId: id));
  void selectCity(int id) => emit(state.copyWith(selectedCityId: id));
  void updateFullName(String value) => emit(state.copyWith(fullName: value));
  void updatePhone(String value) => emit(state.copyWith(phone: value));

  // ─── Submit ─────────────────────────────────────────────────────────────
  Future<void> submitRegistration() async {
    if (state.selectedParticipantTypeId == null) {
      MessageService.showToast(
        msg: LocaleKeys.pleaseSelectYourRole.tr(),
        state: ToastStates.error,
      );
      return;
    }

    if (state.selectedCityId == null) {
      MessageService.showToast(
        msg: LocaleKeys.pleaseSelectRegion.tr(),
        state: ToastStates.error,
      );
      return;
    }

    emit(state.copyWith(isLoading: true));

    final result = await _repository.registerOne(
      participantTypeId: state.selectedParticipantTypeId!,
      name: state.fullName,
      phone: state.phone,
      placeId: state.selectedCityId!,
      championshipId: championshipId,
    );

    if (result.isError) {
      emit(state.copyWith(isLoading: false));
      MessageService.showToast(       msg: LocaleKeys.registrationFailed.tr(), state: ToastStates.error);
      return;
    }

    emit(state.copyWith(isLoading: false, isSuccess: true));
  }
}