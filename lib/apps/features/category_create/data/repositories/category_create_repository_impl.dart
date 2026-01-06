import 'package:dhuwitku/apps/data/model/category_model.dart';

import '../../domain/repositories/category_create_repository.dart';
import '../datasource/category_create_network_datasource.dart';

class CategoryCreateRepositoryImpl implements CategoryCreateRepository {
  final CategoryCreateNetworkDatasource _network;

  CategoryCreateRepositoryImpl(this._network);

  @override
  Future<void> createCategory(CategoryModel category) {
    return _network.createCategory(category);
  }
}
