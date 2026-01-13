import 'package:dhuwitku/apps/data/model/budget_response_model.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/summary_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';

abstract class BottomNavBarRepository {
  Future<List<BudgetResponseModel>> getBudgets();
  Future<List<CategoryModel>> getCategories();
  Future<SummaryModel> getSummary();
  Future<List<TransactionModel>> getTransactions();
}
