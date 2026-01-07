import 'package:dhuwitku/apps/core/network/firebase_collection.dart';
import 'package:dhuwitku/apps/data/model/budget_model.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/transaction_detail/domain/repositories/transaction_detail_repository.dart';

class TransactionDetailNetworkDatasource
    implements TransactionDetailRepository {
  // final Dio _dio;

  TransactionDetailNetworkDatasource();

  @override
  Future<void> deleteTransaction(String id) async {
    try {
      await transactionCollection.doc(id).delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<BudgetModel> getBudgetDetail(String id) async {
    try {
      final budget = await budgetCollection.doc(id).get();
      return BudgetModel.fromJson(budget.data()!);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<CategoryModel> getCategoryDetail(String id) async {
    try {
      final category = await categoryCollection.doc(id).get();
      return CategoryModel.fromJson(category.data()!);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<TransactionModel> getTransactionDetail(String id) async {
    try {
      final transaction = await transactionCollection.doc(id).get();
      return TransactionModel.fromJson(transaction.data()!);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateTransaction(TransactionModel transaction) async {
    try {
      await transactionCollection
          .doc(transaction.id)
          .update(transaction.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }
}
