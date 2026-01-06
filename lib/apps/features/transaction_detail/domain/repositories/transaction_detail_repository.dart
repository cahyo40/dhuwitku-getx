import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';

abstract class TransactionDetailRepository {
  Future<void> deleteTransaction(String id);
  Future<CategoryModel> getCategoryDetail(String id);
  Future<TransactionModel> getTransactionDetail(String id);
  Future<void> updateTransaction(TransactionModel transaction);
}
