import 'package:dhuwitku/apps/features/bottom_nav_bar/data/repositories/bottom_nav_bar_repository_impl.dart';

class GetSummariesUsecase {
  final BottomNavBarRepositoryImpl _repo;

  GetSummariesUsecase(this._repo);

  Future<Map<String, dynamic>> call() async {
    return await _repo.getSummary();
  }
}
