import 'package:dawri/features/purchase_history/data/models/purchase_history_model.dart';
import 'package:dawri/features/purchase_history/data/repositories/interfaces/i_purchase_history_repository.dart';
import 'package:async/async.dart';
import 'package:injectable/injectable.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/core/services/network/network_service.dart';
@Injectable(as: IPurchaseHistoryRepository)
class PurchaseHistoryRepository implements IPurchaseHistoryRepository {
  final NetworkService networkService;

  PurchaseHistoryRepository({required this.networkService});

  @override
  Future<Result<TransactionsListModel>> getTransactions({
    int? type,
    required int page,
    int limit = 15,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.financialTransactionsUrl,
      queryParameters: {
        if (type != null) 'type': type,
        'page': page,
        'limit': limit,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);

    final data = response.asValue!.value.data['data'];
    final transactions = (data['transactions'] as List? ?? [])
        .map((e) => TransactionModel.fromJson(e))
        .toList();
    final pagination = TransactionsPaginationModel.fromJson(data['pagination']);

    return Result.value(TransactionsListModel(transactions: transactions, pagination: pagination));
  }
}