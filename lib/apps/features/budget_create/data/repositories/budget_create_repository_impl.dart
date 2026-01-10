import 'package:dhuwitku/apps/data/model/budget_model.dart';

import '../../domain/repositories/budget_create_repository.dart';
import '../datasource/budget_create_network_datasource.dart';

class BudgetCreateRepositoryImpl implements BudgetCreateRepository {
  final BudgetCreateNetworkDatasource _network;

  BudgetCreateRepositoryImpl(this._network);

  @override
  Future<void> createBudget(BudgetModel model) async {
    return await _network.createBudget(model);
  }

  @override
  Future<void> deleteBudget(String id) async {
    return await _network.deleteBudget(id);
  }

  @override
  Future<void> updateBudget(BudgetModel model) async {
    return await _network.updateBudget(model);
  }
}
