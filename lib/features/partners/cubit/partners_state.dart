part of 'partners_cubit.dart';

@freezed
abstract class PartnersState with _$PartnersState {
  const factory PartnersState({
    // ─── Tabs (participant types) ────────────────────────────
    @Default([]) List<ParticipantTypeModel> types,
    @Default(PartnersStatus.initial()) PartnersStatus typesStatus,
    @Default(0) int selectedTypeId,

    // ─── List ────────────────────────────────────────────────
    @Default([]) List<ParticipantIndividualModel> individuals,
    @Default([]) List<ParticipantTeamModel> teams,
    @Default(PartnersStatus.initial()) PartnersStatus listStatus,
    @Default(1) int page,
    @Default('') String searchQuery,

    // ─── Join requests in flight ─────────────────────────────
    @Default(<int>{}) Set<int> joiningTeamIds,
  }) = _PartnersState;

  const PartnersState._();

  bool get isTeamType => selectedTypeId == 5;
}

@freezed
class PartnersStatus with _$PartnersStatus {
  const factory PartnersStatus.initial() = PartnersStatusInitial;
  const factory PartnersStatus.loading() = PartnersStatusLoading;
  const factory PartnersStatus.success() = PartnersStatusSuccess;
  const factory PartnersStatus.error() = PartnersStatusError;
}
