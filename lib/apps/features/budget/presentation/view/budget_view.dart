import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:dhuwitku/apps/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../controller/budget_controller.dart';

class BudgetView extends GetView<BudgetController> {
  const BudgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Budget'.tr), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        key: Key("${auth.uid}_BudgetCreate"),
        onPressed: () async {
          final result = await Get.toNamed(
            RouteNames.BUDGET_CREATE,
            arguments: {"isCreate": true, "budgetId": null},
          );
          if (result == "create") {
            controller.retry(useLoading: false);
            YoSnackBar.success(Get.context!, "Budget created successfully");
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.value != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.error.value!),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.retry,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return const SafeArea(
          child: Center(
            child: Text(
              'BudgetView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }),
    );
  }
}
