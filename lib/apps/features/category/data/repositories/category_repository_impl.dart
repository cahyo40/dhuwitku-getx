import '../../domain/repositories/category_repository.dart';
import '../datasource/category_network_datasource.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryNetworkDatasource _network;

  CategoryRepositoryImpl(this._network);

  @override
  Future<void> deleteCategory(String id) {
    return _network.deleteCategory(id);
  }
}
