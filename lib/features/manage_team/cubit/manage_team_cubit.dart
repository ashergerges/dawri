// lib/features/manage_team/cubit/manage_team_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/manage_team/data/models/manage_team_model.dart';
import 'package:dawri/features/manage_team/data/repositories/interfaces/i_manage_team_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_team_state.dart';
part 'manage_team_cubit.freezed.dart';

class ManageTeamCubit extends Cubit<ManageTeamState> {
  ManageTeamCubit()
      : _repository = getIt<IManageTeamRepository>(),
        super(const ManageTeamState());

  final IManageTeamRepository _repository;

  void selectTab(ManageTeamTab tab) => emit(state.copyWith(selectedTab: tab));

  Future<void> getMyTeam() async {
    emit(state.copyWith(status: const ManageTeamStatus.loading()));

    final result = await _repository.getMyTeam();
    if (result.isError) {
      emit(state.copyWith(status: const ManageTeamStatus.error()));
      return;
    }

    emit(state.copyWith(
      status: const ManageTeamStatus.success(),
      team: result.asValue!.value,
    ));
  }

  // ─── Join requests (accept = 1, reject = 2) ─────────────────────────────────
  Future<void> acceptRequest(int joinRequestId) =>
      _respond(joinRequestId, status: 1);

  Future<void> rejectRequest(int joinRequestId) =>
      _respond(joinRequestId, status: 2);

  Future<void> _respond(int joinRequestId, {required int status}) async {
    if (state.isResponding) return;
    emit(state.copyWith(isResponding: true));

    final result = await _repository.respondToJoinRequest(
      joinRequestId: joinRequestId,
      status: status,
    );

    emit(state.copyWith(isResponding: false));

    if (result.isError) {
      MessageService.showToast(
        msg: LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    // Accepting adds a member + drops the request → full refresh.
    await getMyTeam();
  }

  // ─── Remove member ──────────────────────────────────────────────────────────
  Future<void> removeMember(int memberId) async {
    final result = await _repository.removeMember(memberId: memberId);

    if (result.isError) {
      MessageService.showToast(
        msg: LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    MessageService.showToast(
      msg: LocaleKeys.manageTeamMemberRemoved.tr(),
      state: ToastStates.success,
    );

    await getMyTeam();
  }
}
