import 'package:dhuwitku/apps/core/network/firebase_collection.dart';
import 'package:dhuwitku/apps/data/model/workspace_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/domain/repositories/bottom_nav_bar_repository.dart';
import 'package:yo_ui/yo_ui.dart';

class BottomNavBarNetworkDatasource implements BottomNavBarRepository {
  // final Dio _dio;

  BottomNavBarNetworkDatasource();

  @override
  Future<List<WorkspaceModel>> fetchWorkspaces(String uid) async {
    try {
      final snapshot = await workspaceCollection
          .where("uid", isEqualTo: uid)
          .get();
      return snapshot.docs.map((doc) {
        return WorkspaceModel.fromJson(doc.data());
      }).toList();
    } catch (e, s) {
      YoLogger.error("Error fetching workspaces  $e -> $s");
      throw Exception(e);
    }
  }
}
