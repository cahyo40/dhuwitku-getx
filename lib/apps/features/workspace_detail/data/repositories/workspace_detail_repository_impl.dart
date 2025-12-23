import '../../domain/repositories/workspace_detail_repository.dart';
import '../datasource/workspace_detail_network_datasource.dart';
import '../datasource/workspace_detail_offline_datasource.dart';

class WorkspaceDetailRepositoryImpl implements WorkspaceDetailRepository {
  final WorkspaceDetailNetworkDatasource _network;
  final WorkspaceDetailOfflineDatasource _offline;

  WorkspaceDetailRepositoryImpl(this._network, this._offline);

  // TODO: Implement repository methods
}
