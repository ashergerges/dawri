// lib/features/contracts/cubit/contracts_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/contracts/data/models/contracts_model.dart';
import 'package:dawri/features/contracts/data/repositories/interfaces/i_contracts_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'contracts_state.dart';
part 'contracts_cubit.freezed.dart';

class ContractsCubit extends Cubit<ContractsState> {
  ContractsCubit()
      : _repository = getIt<IContractsRepository>(),
        super(const ContractsState());

  final IContractsRepository _repository;

  final RefreshController pendingRefreshController = RefreshController();
  final RefreshController activeRefreshController = RefreshController();
  final RefreshController rejectedRefreshController = RefreshController();

  static const int _limit = 10;

  // ─── Init ──────────────────────────────────────────────────────────────────
  Future<void> init() async {
    getSummary();
    getPending();
  }

  // ─── Tabs (lazy load on first open) ────────────────────────────────────────
  void selectTab(int index) {
    emit(state.copyWith(selectedTabIndex: index));

    switch (index) {
      case 0:
        if (state.pendingContracts.isEmpty) getPending();
        break;
      case 1:
        if (state.activeContracts.isEmpty) getActive();
        break;
      case 2:
        if (state.rejectedContracts.isEmpty) getRejected();
        break;
    }
  }

  // ─── Summary ───────────────────────────────────────────────────────────────
  Future<void> getSummary() async {
    emit(state.copyWith(summaryStatus: const ContractsStatus.loading()));

    final result = await _repository.getContractsSummary();
    if (result.isError) {
      emit(state.copyWith(summaryStatus: const ContractsStatus.error()));
      return;
    }

    emit(state.copyWith(
      summaryStatus: const ContractsStatus.success(),
      summary: result.asValue!.value,
    ));
  }

  // ─── Pending (status = 1) ──────────────────────────────────────────────────
  Future<void> getPending() async {
    emit(state.copyWith(pendingStatus: const ContractsStatus.loading()));

    final result = await _repository.getContracts(
      status: ContractStatusId.pending,
      page: 1,
      limit: _limit,
    );

    if (result.isError) {
      emit(state.copyWith(pendingStatus: const ContractsStatus.error()));
      pendingRefreshController.refreshFailed();
      return;
    }

    final page = result.asValue!.value;
    emit(state.copyWith(
      pendingStatus: const ContractsStatus.success(),
      pendingContracts: page.items,
      pendingPagination: page.pagination,
      pendingPage: 1,
    ));
    pendingRefreshController.refreshCompleted();
    pendingRefreshController.resetNoData();
  }

  Future<void> loadMorePending() async {
    if (!_canLoadMore(state.pendingPagination, state.pendingContracts.length)) {
      pendingRefreshController.loadNoData();
      return;
    }

    final nextPage = state.pendingPage + 1;
    final result = await _repository.getContracts(
      status: ContractStatusId.pending,
      page: nextPage,
      limit: _limit,
    );

    if (result.isError) {
      pendingRefreshController.loadFailed();
      return;
    }

    final page = result.asValue!.value;
    if (page.items.isEmpty) {
      pendingRefreshController.loadNoData();
      return;
    }

    emit(state.copyWith(
      pendingContracts: [...state.pendingContracts, ...page.items],
      pendingPagination: page.pagination,
      pendingPage: nextPage,
    ));

    _canLoadMore(page.pagination, page.items.length)
        ? pendingRefreshController.loadComplete()
        : pendingRefreshController.loadNoData();
  }

  // ─── Active (status = 2) ───────────────────────────────────────────────────
  Future<void> getActive() async {
    emit(state.copyWith(activeStatus: const ContractsStatus.loading()));

    final result = await _repository.getContracts(
      status: ContractStatusId.active,
      page: 1,
      limit: _limit,
    );

    if (result.isError) {
      emit(state.copyWith(activeStatus: const ContractsStatus.error()));
      activeRefreshController.refreshFailed();
      return;
    }

    final page = result.asValue!.value;
    emit(state.copyWith(
      activeStatus: const ContractsStatus.success(),
      activeContracts: page.items,
      activePagination: page.pagination,
      activePage: 1,
    ));
    activeRefreshController.refreshCompleted();
    activeRefreshController.resetNoData();
  }

  Future<void> loadMoreActive() async {
    if (!_canLoadMore(state.activePagination, state.activeContracts.length)) {
      activeRefreshController.loadNoData();
      return;
    }

    final nextPage = state.activePage + 1;
    final result = await _repository.getContracts(
      status: ContractStatusId.active,
      page: nextPage,
      limit: _limit,
    );

    if (result.isError) {
      activeRefreshController.loadFailed();
      return;
    }

    final page = result.asValue!.value;
    if (page.items.isEmpty) {
      activeRefreshController.loadNoData();
      return;
    }

    emit(state.copyWith(
      activeContracts: [...state.activeContracts, ...page.items],
      activePagination: page.pagination,
      activePage: nextPage,
    ));

    _canLoadMore(page.pagination, page.items.length)
        ? activeRefreshController.loadComplete()
        : activeRefreshController.loadNoData();
  }

  // ─── Rejected (status = 3) ─────────────────────────────────────────────────
  Future<void> getRejected() async {
    emit(state.copyWith(rejectedStatus: const ContractsStatus.loading()));

    final result = await _repository.getContracts(
      status: ContractStatusId.rejected,
      page: 1,
      limit: _limit,
    );

    if (result.isError) {
      emit(state.copyWith(rejectedStatus: const ContractsStatus.error()));
      rejectedRefreshController.refreshFailed();
      return;
    }

    final page = result.asValue!.value;
    emit(state.copyWith(
      rejectedStatus: const ContractsStatus.success(),
      rejectedContracts: page.items,
      rejectedPagination: page.pagination,
      rejectedPage: 1,
    ));
    rejectedRefreshController.refreshCompleted();
    rejectedRefreshController.resetNoData();
  }

  Future<void> loadMoreRejected() async {
    if (!_canLoadMore(state.rejectedPagination, state.rejectedContracts.length)) {
      rejectedRefreshController.loadNoData();
      return;
    }

    final nextPage = state.rejectedPage + 1;
    final result = await _repository.getContracts(
      status: ContractStatusId.rejected,
      page: nextPage,
      limit: _limit,
    );

    if (result.isError) {
      rejectedRefreshController.loadFailed();
      return;
    }

    final page = result.asValue!.value;
    if (page.items.isEmpty) {
      rejectedRefreshController.loadNoData();
      return;
    }

    emit(state.copyWith(
      rejectedContracts: [...state.rejectedContracts, ...page.items],
      rejectedPagination: page.pagination,
      rejectedPage: nextPage,
    ));

    _canLoadMore(page.pagination, page.items.length)
        ? rejectedRefreshController.loadComplete()
        : rejectedRefreshController.loadNoData();
  }

  // ─── Accept / reject a pending offer ───────────────────────────────────────
  Future<void> acceptContract(int contractId) =>
      _respond(contractId: contractId, status: ContractStatusId.active);

  Future<void> rejectContract(int contractId) =>
      _respond(contractId: contractId, status: ContractStatusId.rejected);

  Future<void> _respond({required int contractId, required int status}) async {
    if (state.isResponding) return;

    emit(state.copyWith(
      responseStatus: const ContractsStatus.loading(),
      respondingContractId: contractId,
    ));

    final result = await _repository.respondToContract(
      contractId: contractId,
      status: status,
    );

    if (result.isError) {
      emit(state.copyWith(
        responseStatus: const ContractsStatus.error(),
        respondingContractId: null,
      ));
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

    emit(state.copyWith(
      responseStatus: const ContractsStatus.success(),
      respondingContractId: null,
    ));

    await refreshAfterStatusChange();
  }

  /// A contract moved between lists — either from here or from the details
  /// screen. Refreshes the summary, pending, and any other tab already loaded
  /// (untouched tabs keep their lazy load, so nothing blanks out on screen).
  Future<void> refreshAfterStatusChange() async {
    final requests = <Future<void>>[getSummary(), getPending()];

    if (state.activeStatus is! ContractsStatusInitial) requests.add(getActive());
    if (state.rejectedStatus is! ContractsStatusInitial) requests.add(getRejected());

    await Future.wait(requests);
  }

  /// Prefers the pagination block; falls back to the page-size heuristic used
  /// across the app when the backend omits it.
  bool _canLoadMore(ContractsPaginationModel? pagination, int lastPageCount) {
    if (pagination?.hasNext != null) return pagination!.hasNext!;

    final current = pagination?.currentPage;
    final total = pagination?.totalPages;
    if (current != null && total != null) return current < total;

    return lastPageCount >= _limit;
  }

  @override
  Future<void> close() {
    pendingRefreshController.dispose();
    activeRefreshController.dispose();
    rejectedRefreshController.dispose();
    return super.close();
  }
}
