import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/features/category_create/data/repositories/category_create_repository_impl.dart';

class CategoryCreateUsecase {
  final CategoryCreateRepositoryImpl _repo;

  CategoryCreateUsecase(this._repo);

  Future<void> call(CategoryModel category) async {
    return _repo.createCategory(category);
  }
}
