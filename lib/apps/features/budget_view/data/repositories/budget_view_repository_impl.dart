import '../../domain/repositories/budget_view_repository.dart';
import '../datasource/budget_view_network_datasource.dart';
import '../datasource/budget_view_offline_datasource.dart';

class BudgetViewRepositoryImpl implements BudgetViewRepository {
  final BudgetViewNetworkDatasource _network;
  final BudgetViewOfflineDatasource _offline;

  BudgetViewRepositoryImpl(this._network, this._offline);

  // TODO: Implement repository methods
}
