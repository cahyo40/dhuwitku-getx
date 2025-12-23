import '../../domain/repositories/activity_repository.dart';
import '../datasource/activity_network_datasource.dart';
import '../datasource/activity_offline_datasource.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final ActivityNetworkDatasource _network;
  final ActivityOfflineDatasource _offline;

  ActivityRepositoryImpl(this._network, this._offline);

  // TODO: Implement repository methods
}
