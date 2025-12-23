import 'package:dhuwitku/apps/controller/auth_controller.dart';
import 'package:dhuwitku/apps/data/model/workspace_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

AuthController get auth => Get.find<AuthController>();

class HomeController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();
  Rx<WorkspaceModel?> workspace = Rxn<WorkspaceModel>();

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> _loadData({bool useLoading = true}) async {
    isLoading.value = useLoading;
    try {
      error.value = null;
      workspace.value = Get.find<BottomNavBarController>().workspace.value;
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
