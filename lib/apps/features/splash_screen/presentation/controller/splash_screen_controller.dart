import 'package:dhuwitku/apps/controller/auth_controller.dart';
import 'package:dhuwitku/apps/core/services/cache.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

class SplashScreenController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxnString error = RxnString();

  @override
  void onReady() async {
    YoLogger.debug(
      'SplashScreenController onReady show onboard: ${YoCache.onboard}',
    );
    await Future.delayed(const Duration(seconds: 2));

    Get.put(AuthController(), permanent: true);
    super.onReady();
  }
}
