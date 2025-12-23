import '../../domain/repositories/transaction_repository.dart';
import '../datasource/transaction_network_datasource.dart';
import '../datasource/transaction_offline_datasource.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionNetworkDatasource _network;
  final TransactionOfflineDatasource _offline;

  TransactionRepositoryImpl(this._network, this._offline);

  // TODO: Implement repository methods
}
