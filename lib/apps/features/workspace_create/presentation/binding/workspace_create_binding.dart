import 'package:get/get.dart';

import '../controller/workspace_create_controller.dart';

class WorkspaceCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkspaceCreateController>(
      () => WorkspaceCreateController(),
    );
  }
}
