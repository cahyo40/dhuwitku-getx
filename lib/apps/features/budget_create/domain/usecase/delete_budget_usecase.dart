import 'package:dhuwitku/apps/features/budget_create/data/repositories/budget_create_repository_impl.dart';

class DeleteBudgetUsecase {
  final BudgetCreateRepositoryImpl _repo;

  DeleteBudgetUsecase(this._repo);

  Future<void> call(String id) async {
    return await _repo.deleteBudget(id);
  }
}
