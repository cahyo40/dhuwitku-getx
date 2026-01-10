import '../../domain/repositories/budget_detail_repository.dart';
import '../datasource/budget_detail_network_datasource.dart';
import '../datasource/budget_detail_offline_datasource.dart';

class BudgetDetailRepositoryImpl implements BudgetDetailRepository {
  final BudgetDetailNetworkDatasource _network;
  final BudgetDetailOfflineDatasource _offline;

  BudgetDetailRepositoryImpl(this._network, this._offline);

  // TODO: Implement repository methods
}
