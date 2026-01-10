import 'package:dhuwitku/apps/data/model/budget_model.dart';
import 'package:dhuwitku/apps/features/budget_create/data/repositories/budget_create_repository_impl.dart';

class UpdateBudgetUsecase {
  final BudgetCreateRepositoryImpl _repo;

  UpdateBudgetUsecase(this._repo);

  Future<void> call(BudgetModel model) async {
    return await _repo.updateBudget(model);
  }
}
