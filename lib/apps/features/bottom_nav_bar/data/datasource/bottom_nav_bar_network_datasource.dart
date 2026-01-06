import 'package:dhuwitku/apps/core/network/firebase_collection.dart';
import 'package:dhuwitku/apps/data/model/budget_model.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/domain/repositories/bottom_nav_bar_repository.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:yo_ui/yo_ui.dart';

class BottomNavBarNetworkDatasource implements BottomNavBarRepository {
  // final Dio _dio;

  BottomNavBarNetworkDatasource();

  @override
  Future<List<BudgetModel>> getBudgets() async {
    try {
      final res = await budgetCollection
          .where("uid", isEqualTo: auth.uid)
          .get();

      return res.docs.map((e) => BudgetModel.fromJson(e.data())).toList();
    } catch (e, s) {
      YoLogger.error("$e -> $s");
      throw Exception(e);
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final res = await categoryCollection
          .where("budgetId", isEqualTo: auth.uid)
          .get();

      return res.docs.map((e) => CategoryModel.fromJson(e.data())).toList();
    } catch (e, s) {
      YoLogger.error("$e -> $s");
      throw Exception(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getSummary() {
    return Future.value({});
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    try {
      final res = await transactionCollection
          .where("uid", isEqualTo: auth.uid)
          .get();

      return res.docs.map((e) => TransactionModel.fromJson(e.data())).toList();
    } catch (e, s) {
      YoLogger.error("$e -> $s");
      throw Exception(e);
    }
  }
}
