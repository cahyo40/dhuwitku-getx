import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/features/transaction_detail/data/repositories/transaction_detail_repository_impl.dart';

class GetCategoryUsecase {
  final TransactionDetailRepositoryImpl _repo;

  GetCategoryUsecase(this._repo);

  Future<CategoryModel> call(String id) async {
    return _repo.getCategoryDetail(id);
  }
}
