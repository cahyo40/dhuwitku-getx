import '../../domain/repositories/category_repository.dart';
import '../datasource/category_network_datasource.dart';
import '../datasource/category_offline_datasource.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryNetworkDatasource _network;
  final CategoryOfflineDatasource _offline;

  CategoryRepositoryImpl(this._network, this._offline);

  // TODO: Implement repository methods
}
