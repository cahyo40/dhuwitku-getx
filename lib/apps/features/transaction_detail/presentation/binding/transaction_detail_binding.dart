import 'package:get/get.dart';

import '../controller/transaction_detail_controller.dart';

class TransactionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionDetailController>(
      () => TransactionDetailController(),
    );
  }
}
