import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/transaction_detail/data/repositories/transaction_detail_repository_impl.dart';

class GetTransactionUsecase {
  final TransactionDetailRepositoryImpl _repo;

  GetTransactionUsecase(this._repo);

  Future<TransactionModel> call(String id) async {
    return _repo.getTransactionDetail(id);
  }
}
