// lib/features/contract_details/cubit/contract_details_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/contract_details/data/models/contract_details_model.dart';
import 'package:dawri/features/contract_details/data/repositories/interfaces/i_contract_details_repository.dart';
import 'package:dawri/features/contracts/data/models/contracts_model.dart';
import 'package:dawri/features/contracts/data/repositories/interfaces/i_contracts_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_details_state.dart';
part 'contract_details_cubit.freezed.dart';

class ContractDetailsCubit extends Cubit<ContractDetailsState> {
  ContractDetailsCubit(this.contractId)
      : _repository = getIt<IContractDetailsRepository>(),
        // Accept / reject shares the contracts-list repository — same endpoint.
        _contractsRepository = getIt<IContractsRepository>(),
        super(const ContractDetailsState());

  final int contractId;
  final IContractDetailsRepository _repository;
  final IContractsRepository _contractsRepository;

  // ─── Details ───────────────────────────────────────────────────────────────
  Future<void> getContractDetails() async {
    emit(state.copyWith(detailsStatus: const ContractDetailsStatus.loading()));

    final result = await _repository.getContractDetails(contractId: contractId);

    if (result.isError) {
      emit(state.copyWith(detailsStatus: const ContractDetailsStatus.error()));
      return;
    }

    emit(state.copyWith(
      detailsStatus: const ContractDetailsStatus.success(),
      contract: result.asValue!.value,
    ));
  }

  // ─── Accept / reject (pending contracts only) ──────────────────────────────
  Future<void> acceptContract() => _respond(ContractStatusId.active);

  Future<void> rejectContract() => _respond(ContractStatusId.rejected);

  Future<void> _respond(int status) async {
    if (state.isResponding) return;

    emit(state.copyWith(respondStatus: const ContractDetailsStatus.loading()));

    final result = await _contractsRepository.respondToContract(
      contractId: contractId,
      status: status,
    );

    if (result.isError) {
      emit(state.copyWith(respondStatus: const ContractDetailsStatus.error()));
      MessageService.showToast(
        msg: result.asError?.error.toString() ?? LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    final message = result.asValue?.value ?? '';
    MessageService.showToast(
      msg: message.isNotEmpty ? message : LocaleKeys.contractsRespondSuccess.tr(),
      state: ToastStates.success,
    );

    // `didChangeStatus` lets the screen pop with `true` so the contracts list
    // refreshes its tabs when the user goes back.
    emit(state.copyWith(
      respondStatus: const ContractDetailsStatus.success(),
      didChangeStatus: true,
    ));

    // Reload so the status badge, signatures box and bottom bar update at once.
    await getContractDetails();
  }
}
