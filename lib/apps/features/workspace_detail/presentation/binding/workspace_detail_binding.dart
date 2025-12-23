import 'package:get/get.dart';

import '../controller/workspace_detail_controller.dart';

class WorkspaceDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkspaceDetailController>(
      () => WorkspaceDetailController(),
    );
  }
}
