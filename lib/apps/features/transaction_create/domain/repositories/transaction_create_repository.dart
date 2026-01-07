import 'package:dhuwitku/apps/data/model/transaction_model.dart';

abstract class TransactionCreateRepository {
  Future<void> createTransaction(TransactionModel transaction);
}
