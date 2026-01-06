// import '../repositories/get_budget_transaction_repository.dart';

import 'package:dhuwitku/apps/data/model/budget_model.dart';
import 'package:dhuwitku/apps/features/transaction_detail/data/repositories/transaction_detail_repository_impl.dart';

class GetBudgetTransactionUsecase {
  // final GetBudgetTransactionRepository _repo;
  final TransactionDetailRepositoryImpl _repo;

  GetBudgetTransactionUsecase(this._repo);

  Future<BudgetModel> call(String id) async {
    return await _repo.getBudgetDetail(id);
  }
}
