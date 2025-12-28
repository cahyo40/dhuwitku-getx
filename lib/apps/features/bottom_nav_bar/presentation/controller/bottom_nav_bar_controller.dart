import 'package:dhuwitku/apps/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

AuthController get auth => Get.find<AuthController>();

class BottomNavBarController extends GetxController {
  // State
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

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
