import 'package:dhuwitku/apps/data/model/transaction_model.dart';

import '../../domain/repositories/transaction_create_repository.dart';
import '../datasource/transaction_create_network_datasource.dart';

class TransactionCreateRepositoryImpl implements TransactionCreateRepository {
  final TransactionCreateNetworkDatasource _network;

  TransactionCreateRepositoryImpl(this._network);

  @override
  Future<void> createTransaction(TransactionModel transaction) async {
    return _network.createTransaction(transaction);
  }
}
