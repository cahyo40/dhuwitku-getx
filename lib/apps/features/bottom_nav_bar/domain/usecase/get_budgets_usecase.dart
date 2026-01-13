import 'package:dhuwitku/apps/data/model/budget_response_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/data/repositories/bottom_nav_bar_repository_impl.dart';

class GetBudgetsUsecase {
  final BottomNavBarRepositoryImpl _repo;

  GetBudgetsUsecase(this._repo);

  Future<List<BudgetResponseModel>> call() async {
    return await _repo.getBudgets();
  }
}
