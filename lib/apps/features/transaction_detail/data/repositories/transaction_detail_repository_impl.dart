import '../../domain/repositories/transaction_detail_repository.dart';
import '../datasource/transaction_detail_network_datasource.dart';
import '../datasource/transaction_detail_offline_datasource.dart';

class TransactionDetailRepositoryImpl implements TransactionDetailRepository {
  final TransactionDetailNetworkDatasource _network;
  final TransactionDetailOfflineDatasource _offline;

  TransactionDetailRepositoryImpl(this._network, this._offline);

  // TODO: Implement repository methods
}
