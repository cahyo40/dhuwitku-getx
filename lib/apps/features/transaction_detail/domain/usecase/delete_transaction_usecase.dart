// import '../repositories/delete_transaction_repository.dart';

import 'package:dhuwitku/apps/features/transaction_detail/data/repositories/transaction_detail_repository_impl.dart';

class DeleteTransactionUsecase {
  final TransactionDetailRepositoryImpl _repo;

  DeleteTransactionUsecase(this._repo);

  Future<void> call(String id) async {
    await _repo.deleteTransaction(id);
  }
}
