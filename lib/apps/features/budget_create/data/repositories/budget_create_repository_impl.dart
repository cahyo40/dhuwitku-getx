import '../../domain/repositories/budget_create_repository.dart';
import '../datasource/budget_create_network_datasource.dart';
import '../datasource/budget_create_offline_datasource.dart';

class BudgetCreateRepositoryImpl implements BudgetCreateRepository {
  final BudgetCreateNetworkDatasource _network;
  final BudgetCreateOfflineDatasource _offline;

  BudgetCreateRepositoryImpl(this._network, this._offline);

  // TODO: Implement repository methods
}
