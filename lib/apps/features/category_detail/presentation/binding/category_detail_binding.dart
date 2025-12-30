import 'package:get/get.dart';

import '../controller/category_detail_controller.dart';

class CategoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryDetailController>(
      () => CategoryDetailController(),
    );
  }
}
