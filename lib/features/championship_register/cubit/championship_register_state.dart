part of 'championship_register_cubit.dart';

@freezed
abstract class ChampionshipRegisterState with _$ChampionshipRegisterState {
  const factory ChampionshipRegisterState({
    // ─── Options ─────────────────────────────────────────────
    @Default([]) List<ParticipantTypeModel> participantTypes,
    @Default([]) List<CityModel> cities,
    int? selectedParticipantTypeId,
    int? selectedCityId,
    @Default(ChampionshipRegisterOptionsStatus.initial())
    ChampionshipRegisterOptionsStatus optionsStatus,

    // ─── Form ────────────────────────────────────────────────
    @Default('') String fullName,
    @Default('') String phone,

    // ─── Submit ──────────────────────────────────────────────
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
  }) = _ChampionshipRegisterState;
}

@freezed
class ChampionshipRegisterOptionsStatus with _$ChampionshipRegisterOptionsStatus {
  const factory ChampionshipRegisterOptionsStatus.initial() = Initial;
  const factory ChampionshipRegisterOptionsStatus.loading() = Loading;
  const factory ChampionshipRegisterOptionsStatus.error() = Error;
  const factory ChampionshipRegisterOptionsStatus.success() = Success;
}