import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/data/repositories/bottom_nav_bar_repository_impl.dart';

class GetTransactionsUsecase {
  final BottomNavBarRepositoryImpl _repo;

  GetTransactionsUsecase(this._repo);

  Future<List<TransactionModel>> call() async {
    return await _repo.getTransactions();
  }
}
