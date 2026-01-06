import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';

import '../../domain/repositories/transaction_detail_repository.dart';
import '../datasource/transaction_detail_network_datasource.dart';

class TransactionDetailRepositoryImpl implements TransactionDetailRepository {
  final TransactionDetailNetworkDatasource _network;

  TransactionDetailRepositoryImpl(this._network);

  @override
  Future<void> deleteTransaction(String id) async {
    try {
      await _network.deleteTransaction(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<CategoryModel> getCategoryDetail(String id) async {
    try {
      return await _network.getCategoryDetail(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<TransactionModel> getTransactionDetail(String id) async {
    try {
      return await _network.getTransactionDetail(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateTransaction(TransactionModel transaction) async {
    try {
      await _network.updateTransaction(transaction);
    } catch (e) {
      throw Exception(e);
    }
  }
}
