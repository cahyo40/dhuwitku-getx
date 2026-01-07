import 'package:dhuwitku/apps/core/network/firebase_collection.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/transaction_create/domain/repositories/transaction_create_repository.dart';
import 'package:yo_ui/yo_ui.dart';

class TransactionCreateNetworkDatasource
    implements TransactionCreateRepository {
  // final Dio _dio;

  TransactionCreateNetworkDatasource();

  @override
  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      await transactionCollection.doc(transaction.id).set(transaction.toJson());
    } catch (e, stackTrace) {
      YoLogger.error("Create Transaction Error $e -> $stackTrace");
      throw Exception(e);
    }
  }
}
