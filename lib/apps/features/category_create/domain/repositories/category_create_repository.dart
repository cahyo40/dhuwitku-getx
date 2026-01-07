import 'package:dhuwitku/apps/data/model/category_model.dart';

abstract class CategoryCreateRepository {
  Future<void> createCategory(CategoryModel category);
}
