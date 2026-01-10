import 'package:dhuwitku/apps/data/model/budget_model.dart';
import 'package:dhuwitku/apps/features/budget_create/data/repositories/budget_create_repository_impl.dart';

class DetailBudgetUsecase {
  final BudgetCreateRepositoryImpl _repo;

  DetailBudgetUsecase(this._repo);

  Future<BudgetModel> call(String id) async {
    return await _repo.getBudget(id);
  }
}
