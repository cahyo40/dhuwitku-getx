import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/data/repositories/bottom_nav_bar_repository_impl.dart';

class GetCategoriesUsecase {
  final BottomNavBarRepositoryImpl _repo;

  GetCategoriesUsecase(this._repo);

  Future<List<CategoryModel>> call() async {
    return await _repo.getCategories();
  }
}
