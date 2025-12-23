import '../../domain/repositories/workspace_create_repository.dart';
import '../datasource/workspace_create_network_datasource.dart';
import '../datasource/workspace_create_offline_datasource.dart';

class WorkspaceCreateRepositoryImpl implements WorkspaceCreateRepository {
  final WorkspaceCreateNetworkDatasource _network;
  final WorkspaceCreateOfflineDatasource _offline;

  WorkspaceCreateRepositoryImpl(this._network, this._offline);

  // TODO: Implement repository methods
}
