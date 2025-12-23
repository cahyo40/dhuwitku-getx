import 'package:dhuwitku/apps/data/model/workspace_model.dart';

abstract class BottomNavBarRepository {
  Future<List<WorkspaceModel>> fetchWorkspaces(String uid);
}
