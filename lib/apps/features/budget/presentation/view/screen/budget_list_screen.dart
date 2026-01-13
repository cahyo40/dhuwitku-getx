import 'package:dhuwitku/apps/routes/route_names.dart';
import 'package:dhuwitku/apps/widget/card_budget_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/budget_controller.dart';

class BudgetListScreen extends GetView<BudgetController> {
  const BudgetListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        physics: ClampingScrollPhysics(),
        itemCount: controller.budgetsFiltered.length,
        itemBuilder: (context, index) {
          final data = controller.budgetsFiltered[index];
          return CardBudgetWidget(
            data: data,
            onTap: () {
              Get.toNamed(RouteNames.BUDGET_DETAIL, arguments: {"data": data});
            },
          );
        },
      ),
    );
  }
}
