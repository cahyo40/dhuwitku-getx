import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:dhuwitku/apps/features/budget/presentation/view/screen/budget_filter_screen.dart';
import 'package:dhuwitku/apps/features/budget/presentation/view/screen/budget_list_screen.dart';
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
      appBar: AppBar(
        title: Text('Budget'.tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.retry(useLoading: true);
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
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
          return const Center(child: YoLoading());
        }

        if (controller.error.value != null) {
          return YoEmptyState.error(
            actionText: L10n.t.retry,
            onAction: controller.retry,
            title: L10n.t.error_title,
            description: controller.error.value!,
          );
        }

        return SafeArea(
          child: YoColumn(
            padding: YoPadding.all16,
            spacing: YoAdaptive.spacingSm(context),
            children: [
              BudgetFilterScreen(),
              Expanded(child: BudgetListScreen()),
            ],
          ),
        );
      }),
    );
  }
}
