import '../../domain/repositories/category_detail_repository.dart';
import '../datasource/category_detail_network_datasource.dart';
import '../datasource/category_detail_offline_datasource.dart';

class CategoryDetailRepositoryImpl implements CategoryDetailRepository {
  final CategoryDetailNetworkDatasource _network;
  final CategoryDetailOfflineDatasource _offline;

  CategoryDetailRepositoryImpl(this._network, this._offline);

  // TODO: Implement repository methods
}
