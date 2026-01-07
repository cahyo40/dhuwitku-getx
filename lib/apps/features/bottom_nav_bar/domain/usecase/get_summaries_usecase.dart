import 'package:dhuwitku/apps/data/model/summary_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/data/repositories/bottom_nav_bar_repository_impl.dart';

class GetSummariesUsecase {
  final BottomNavBarRepositoryImpl _repo;

  GetSummariesUsecase(this._repo);

  Future<SummaryModel> call() async {
    return await _repo.getSummary();
  }
}
