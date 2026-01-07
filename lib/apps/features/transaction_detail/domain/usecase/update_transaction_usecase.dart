// import '../repositories/update_transaction_repository.dart';

import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/transaction_detail/data/repositories/transaction_detail_repository_impl.dart';

class UpdateTransactionUsecase {
  final TransactionDetailRepositoryImpl _repo;

  UpdateTransactionUsecase(this._repo);

  Future<void> call(TransactionModel transaction) async {
    await _repo.updateTransaction(transaction);
  }
}
