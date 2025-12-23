import 'package:dhuwitku/apps/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

class LoginController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  void onLogin() {
    isLoading.value = true;
    try {
      Get.find<AuthController>().signInWithGoogle();
    } catch (e, s) {
      YoSnackBar.error(Get.context!, "$e -> $s");
    } finally {
      isLoading.value = false;
    }
  }
}
