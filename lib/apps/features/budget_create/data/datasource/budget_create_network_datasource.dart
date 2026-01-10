import 'package:dhuwitku/apps/core/network/firebase_collection.dart';
import 'package:dhuwitku/apps/data/model/budget_model.dart';
import 'package:dhuwitku/apps/features/budget_create/domain/repositories/budget_create_repository.dart';
import 'package:yo_ui/yo_ui.dart';

class BudgetCreateNetworkDatasource implements BudgetCreateRepository {
  // final Dio _dio;

  BudgetCreateNetworkDatasource();

  @override
  Future<void> createBudget(BudgetModel model) async {
    try {
      final data = model.toJson();
      data['icon'] = model.icon.toJson();
      await budgetCollection.doc(model.id).set(data);
    } catch (e, s) {
      YoLogger.error("$e -> $s");
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteBudget(String id) async {
    try {
      await budgetCollection.doc(id).delete();
    } catch (e, s) {
      YoLogger.error("$e -> $s");
      throw Exception(e);
    }
  }

  @override
  Future<void> updateBudget(BudgetModel model) async {
    try {
      final data = model.toJson();
      data['icon'] = model.icon.toJson();
      await budgetCollection.doc(model.id).update(data);
    } catch (e, s) {
      YoLogger.error("$e -> $s");
      throw Exception(e);
    }
  }
}
