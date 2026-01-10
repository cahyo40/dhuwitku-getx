import 'package:get/get.dart';

import '../controller/budget_create_controller.dart';

class BudgetCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BudgetCreateController>(
      () => BudgetCreateController(),
    );
  }
}
