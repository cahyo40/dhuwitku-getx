import '../../domain/repositories/budget_repository.dart';
import '../datasource/budget_network_datasource.dart';
import '../datasource/budget_offline_datasource.dart';

class BudgetRepositoryImpl implements BudgetRepository {
  final BudgetNetworkDatasource _network;
  final BudgetOfflineDatasource _offline;

  BudgetRepositoryImpl(this._network, this._offline);

  // TODO: Implement repository methods
}
