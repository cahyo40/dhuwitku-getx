import 'package:get/get.dart';

import '../controller/budget_view_controller.dart';

class BudgetViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BudgetViewController>(
      () => BudgetViewController(),
    );
  }
}
