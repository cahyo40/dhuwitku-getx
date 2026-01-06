import 'package:dhuwitku/apps/data/model/budget_model.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';

abstract class BottomNavBarRepository {
  Future<List<BudgetModel>> getBudgets();
  Future<List<CategoryModel>> getCategories();
  Future<Map<String, dynamic>> getSummary();
  Future<List<TransactionModel>> getTransactions();
}
