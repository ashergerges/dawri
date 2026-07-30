import 'package:dawri/gen/locale_keys.g.dart';
import 'package:json_annotation/json_annotation.dart';

part 'purchase_history_model.g.dart';

enum RecordTab { all, shop, tickets, tournaments }

extension RecordTabX on RecordTab {
  int? get typeValue {
    switch (this) {
      case RecordTab.shop:
        return 1;
      case RecordTab.tickets:
        return 2;
      case RecordTab.tournaments:
        return 3;
      case RecordTab.all:
        return null; // ماتبعتش type خالص
    }
  }
}

class TabChipData {
  final RecordTab tab;
  final String labelKey;

  const TabChipData({required this.tab, required this.labelKey});
}

class PurchaseHistoryTabsData {
  static const tabs = [
    TabChipData(tab: RecordTab.all, labelKey: LocaleKeys.purchaseHistoryTabAll),
    TabChipData(tab: RecordTab.shop, labelKey: LocaleKeys.purchaseHistoryTabShop),
    TabChipData(tab: RecordTab.tickets, labelKey: LocaleKeys.purchaseHistoryTabTickets),
    TabChipData(tab: RecordTab.tournaments, labelKey: LocaleKeys.purchaseHistoryTabTournaments),
  ];
}

@JsonSerializable()
class TransactionModel {
  final int? id;
  final int? type;
  @JsonKey(name: 'type_text')
  final String? typeText;
  final String? status;
  final String? amount;
  final String? currency;
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  final String? description;
  final Map<String, dynamic>? metadata;
  final dynamic transactionable;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  TransactionModel({
    this.id,
    this.type,
    this.typeText,
    this.status,
    this.amount,
    this.currency,
    this.paymentMethod,
    this.description,
    this.metadata,
    this.transactionable,
    this.createdAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}

@JsonSerializable()
class TransactionsPaginationModel {
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @JsonKey(name: 'per_page')
  final int? perPage;
  final int? total;
  @JsonKey(name: 'last_page')
  final int? lastPage;

  TransactionsPaginationModel({this.currentPage, this.perPage, this.total, this.lastPage});

  factory TransactionsPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionsPaginationModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionsPaginationModelToJson(this);
}

class TransactionsListModel {
  final List<TransactionModel> transactions;
  final TransactionsPaginationModel pagination;

  TransactionsListModel({required this.transactions, required this.pagination});
}