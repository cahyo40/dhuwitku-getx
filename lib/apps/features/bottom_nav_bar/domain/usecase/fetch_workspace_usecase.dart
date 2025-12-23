// import '../repositories/get_workspace_repository.dart';

import 'package:dhuwitku/apps/data/model/workspace_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/domain/repositories/bottom_nav_bar_repository.dart';

class FetchWorkspaceUsecase {
  final BottomNavBarRepository _repo;

  FetchWorkspaceUsecase(this._repo);

  Future<List<WorkspaceModel>> call(String uid) async {
    return await _repo.fetchWorkspaces(uid);
  }
}
