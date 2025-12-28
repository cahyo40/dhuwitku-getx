import '../../domain/repositories/transaction_create_repository.dart';
import '../datasource/transaction_create_network_datasource.dart';
import '../datasource/transaction_create_offline_datasource.dart';

class TransactionCreateRepositoryImpl implements TransactionCreateRepository {
  final TransactionCreateNetworkDatasource _network;
  final TransactionCreateOfflineDatasource _offline;

  TransactionCreateRepositoryImpl(this._network, this._offline);

  // TODO: Implement repository methods
}
