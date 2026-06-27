part of 'purchase_history_cubit.dart';

@freezed
abstract class PurchaseHistoryState with _$PurchaseHistoryState {
  const factory PurchaseHistoryState({
    @Default(RecordTab.all) RecordTab selectedTab,
  }) = _PurchaseHistoryState;
}