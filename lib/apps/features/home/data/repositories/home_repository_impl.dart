import '../../domain/repositories/home_repository.dart';
import '../datasource/home_network_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeNetworkDatasource _network;

  HomeRepositoryImpl(this._network);
}
