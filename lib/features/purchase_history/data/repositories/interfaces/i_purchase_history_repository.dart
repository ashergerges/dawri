import 'package:async/async.dart';
import 'package:dawri/features/purchase_history/data/models/purchase_history_model.dart';

abstract class IPurchaseHistoryRepository {
  Future<Result<TransactionsListModel>> getTransactions({
    int? type,
    required int page,
    int limit = 15,
  });
}