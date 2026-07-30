part of 'purchase_history_cubit.dart';

@freezed
abstract class PurchaseHistoryState with _$PurchaseHistoryState {
  const factory PurchaseHistoryState({
    @Default(RecordTab.all) RecordTab selectedTab,
    @Default([]) List<TransactionModel> transactions,
    @Default(1) int currentPage,
    @Default(true) bool hasMore,
    @Default(PurchaseHistoryStatus.initial()) PurchaseHistoryStatus status,
  }) = _PurchaseHistoryState;
}

@freezed
class PurchaseHistoryStatus with _$PurchaseHistoryStatus {
  const factory PurchaseHistoryStatus.initial() = Initial;
  const factory PurchaseHistoryStatus.loading() = Loading;
  const factory PurchaseHistoryStatus.error() = Error;
  const factory PurchaseHistoryStatus.success() = Success;
}