import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/transaction_create/data/repositories/transaction_create_repository_impl.dart';

class TransactionCreateUsecase {
  final TransactionCreateRepositoryImpl _repo;

  TransactionCreateUsecase(this._repo);

  Future<void> call(TransactionModel transaction) async {
    return _repo.createTransaction(transaction);
  }
}
