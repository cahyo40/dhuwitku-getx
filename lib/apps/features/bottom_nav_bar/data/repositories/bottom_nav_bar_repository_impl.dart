import 'package:dhuwitku/apps/data/model/workspace_model.dart';

import '../../domain/repositories/bottom_nav_bar_repository.dart';
import '../datasource/bottom_nav_bar_network_datasource.dart';

class BottomNavBarRepositoryImpl implements BottomNavBarRepository {
  final BottomNavBarNetworkDatasource _network;

  BottomNavBarRepositoryImpl(this._network);

  @override
  Future<List<WorkspaceModel>> fetchWorkspaces(String uid) async {
    return _network.fetchWorkspaces(uid);
  }
}
