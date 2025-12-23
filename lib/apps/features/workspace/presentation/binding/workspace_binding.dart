import 'package:get/get.dart';

import '../controller/workspace_controller.dart';

class WorkspaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkspaceController>(
      () => WorkspaceController(),
    );
  }
}
