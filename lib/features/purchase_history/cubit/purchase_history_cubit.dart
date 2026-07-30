import 'package:bloc/bloc.dart';
import 'package:dawri/features/purchase_history/data/models/purchase_history_model.dart';
import 'package:dawri/features/purchase_history/data/repositories/interfaces/i_purchase_history_repository.dart';
import 'package:dawri/main_common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'purchase_history_state.dart';
part 'purchase_history_cubit.freezed.dart';

class PurchaseHistoryCubit extends Cubit<PurchaseHistoryState> {
  PurchaseHistoryCubit()
      : _repository = getIt<IPurchaseHistoryRepository>(),
        super(const PurchaseHistoryState());

  final IPurchaseHistoryRepository _repository;
  final RefreshController refreshController = RefreshController();

  // ─── Tabs ────────────────────────────────────────────────────────────────
  void selectTab(RecordTab tab) {
    if (tab == state.selectedTab) return;
    emit(state.copyWith(selectedTab: tab));
    getTransactions();
  }

  // ─── Load ────────────────────────────────────────────────────────────────
  Future<void> getTransactions() async {
    emit(state.copyWith(status: const PurchaseHistoryStatus.loading()));

    final result = await _repository.getTransactions(
      type: state.selectedTab.typeValue,
      page: 1,
    );

    if (result.isError) {
      emit(state.copyWith(status: const PurchaseHistoryStatus.error()));
      refreshController.refreshFailed();
      return;
    }

    final data = result.asValue!.value;
    final hasMore = (data.pagination.currentPage ?? 1) < (data.pagination.lastPage ?? 1);

    emit(state.copyWith(
      status: const PurchaseHistoryStatus.success(),
      transactions: data.transactions,
      currentPage: 1,
      hasMore: hasMore,
    ));
    refreshController.refreshCompleted();
  }

  Future<void> loadMoreTransactions() async {
    if (!state.hasMore) {
      refreshController.loadNoData();
      return;
    }

    final nextPage = state.currentPage + 1;
    final result = await _repository.getTransactions(
      type: state.selectedTab.typeValue,
      page: nextPage,
    );

    if (result.isError) {
      refreshController.loadFailed();
      return;
    }

    final data = result.asValue!.value;
    final hasMore = (data.pagination.currentPage ?? nextPage) < (data.pagination.lastPage ?? nextPage);

    emit(state.copyWith(
      transactions: [...state.transactions, ...data.transactions],
      currentPage: nextPage,
      hasMore: hasMore,
    ));

    if (hasMore) {
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
  }

  @override
  Future<void> close() {
    refreshController.dispose();
    return super.close();
  }
}