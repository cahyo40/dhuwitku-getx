import 'package:dhuwitku/apps/data/model/budget_model.dart';

abstract class BudgetCreateRepository {
  Future<void> createBudget(BudgetModel model);
  Future<void> deleteBudget(String id);
  Future<void> updateBudget(BudgetModel model);
}
