// import '../repositories/delete_category_repository.dart';

import 'package:dhuwitku/apps/features/category/data/repositories/category_repository_impl.dart';

class DeleteCategoryUsecase {
  final CategoryRepositoryImpl _repo;

  DeleteCategoryUsecase(this._repo);

  Future<void> call(String id) async {
    return _repo.deleteCategory(id);
  }
}
