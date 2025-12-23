import '../../domain/repositories/workspace_repository.dart';
import '../datasource/workspace_network_datasource.dart';
import '../datasource/workspace_offline_datasource.dart';

class WorkspaceRepositoryImpl implements WorkspaceRepository {
  final WorkspaceNetworkDatasource _network;
  final WorkspaceOfflineDatasource _offline;

  WorkspaceRepositoryImpl(this._network, this._offline);

  // TODO: Implement repository methods
}
