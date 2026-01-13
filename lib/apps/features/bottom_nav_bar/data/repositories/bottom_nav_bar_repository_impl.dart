import 'package:dhuwitku/apps/data/model/budget_response_model.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/summary_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/data/datasource/bottom_nav_bar_network_datasource.dart';

import '../../domain/repositories/bottom_nav_bar_repository.dart';

class BottomNavBarRepositoryImpl implements BottomNavBarRepository {
  final BottomNavBarNetworkDatasource _datasource;

  BottomNavBarRepositoryImpl(this._datasource);

  @override
  Future<List<BudgetResponseModel>> getBudgets() async {
    return await _datasource.getBudgets();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    return await _datasource.getCategories();
  }

  @override
  Future<SummaryModel> getSummary() async {
    return await _datasource.getSummary();
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    return await _datasource.getTransactions();
  }
}
