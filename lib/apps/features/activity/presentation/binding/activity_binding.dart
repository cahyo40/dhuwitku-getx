import 'package:get/get.dart';

import '../controller/activity_controller.dart';

class ActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivityController>(
      () => ActivityController(),
    );
  }
}
