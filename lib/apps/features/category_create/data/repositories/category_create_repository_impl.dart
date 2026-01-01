import '../../domain/repositories/category_create_repository.dart';
import '../datasource/category_create_network_datasource.dart';
import '../datasource/category_create_offline_datasource.dart';

class CategoryCreateRepositoryImpl implements CategoryCreateRepository {
  final CategoryCreateNetworkDatasource _network;
  final CategoryCreateOfflineDatasource _offline;

  CategoryCreateRepositoryImpl(this._network, this._offline);

  // TODO: Implement repository methods
}
