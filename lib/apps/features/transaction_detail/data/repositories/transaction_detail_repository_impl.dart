import 'package:dhuwitku/apps/data/model/budget_model.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';

import '../../domain/repositories/transaction_detail_repository.dart';
import '../datasource/transaction_detail_network_datasource.dart';

class TransactionDetailRepositoryImpl implements TransactionDetailRepository {
  final TransactionDetailNetworkDatasource _network;

  TransactionDetailRepositoryImpl(this._network);

  @override
  Future<void> deleteTransaction(String id) async {
    await _network.deleteTransaction(id);
  }

  @override
  Future<BudgetModel> getBudgetDetail(String id) async {
    return await _network.getBudgetDetail(id);
  }

  @override
  Future<CategoryModel> getCategoryDetail(String id) async {
    return await _network.getCategoryDetail(id);
  }

  @override
  Future<TransactionModel> getTransactionDetail(String id) async {
    return await _network.getTransactionDetail(id);
  }

  @override
  Future<void> updateTransaction(TransactionModel transaction) async {
    await _network.updateTransaction(transaction);
  }
}
