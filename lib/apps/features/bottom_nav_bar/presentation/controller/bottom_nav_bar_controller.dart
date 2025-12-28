import 'package:dhuwitku/apps/controller/auth_controller.dart';
import 'package:dhuwitku/apps/data/model/workspace_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/data/repositories/bottom_nav_bar_repository_impl.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/domain/usecase/fetch_workspace_usecase.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

AuthController get auth => Get.find<AuthController>();

class BottomNavBarController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  final FetchWorkspaceUsecase fetchWorkspaceUsecase = FetchWorkspaceUsecase(
    Get.find<BottomNavBarRepositoryImpl>(),
  );
  RxList<WorkspaceModel> workspaces = <WorkspaceModel>[].obs;
  Rx<WorkspaceModel?> workspace = Rxn<WorkspaceModel>();

  final workspaceId = auth.uid.obs;
  final uid = auth.uid.obs;

  final currentPage = 0.obs;

  void onChangePage(int index) {
    currentPage.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> _loadData({bool useLoading = true}) async {
    isLoading.value = useLoading;
    try {
      error.value = null;
      final res = await Future.wait([fetchWorkspaceUsecase(uid.value)]);

      workspaces.value = res[0];
      if (workspaces.isEmpty) {
        workspace.value = null;
      } else {
        workspace.value = workspaces.firstWhere(
          (v) => v.id == workspaceId.value,
        );
      }
    } catch (e, s) {
      YoLogger.error("$e -> $s");
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> retry() async {
    await _loadData(useLoading: false);
  }
}
