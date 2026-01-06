import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:dhuwitku/apps/features/transaction/presentation/view/screen/transaction_filter_screen.dart';
import 'package:dhuwitku/apps/features/transaction/presentation/view/screen/transaction_list_screen.dart';
import 'package:dhuwitku/apps/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui_base.dart';

import '../controller/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.retry,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Get.toNamed(RouteNames.TRANSACTION_CREATE);
            if (result == true) {
              YoSnackBar.success(Get.context!, "Transaction created");
              Get.find<BottomNavBarController>().retry();
              controller.onInit();
            }
          },
          child: const Icon(Icons.add),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.error.value != null) {
            return YoErrorState(
              title: "Error",
              description: controller.error.value!,
              onRetry: controller.retry,
            );
          }

          return SafeArea(
            child: YoColumn(
              children: [
                TransactionFilterScreen(),
                Expanded(child: TransactionListScreen()),
              ],
            ),
          );
        }),
      ),
    );
  }
}
