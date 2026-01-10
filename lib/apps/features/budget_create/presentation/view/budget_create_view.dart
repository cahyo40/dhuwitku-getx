import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/features/budget_create/presentation/view/screen/budget_action_button_screen.dart';
import 'package:dhuwitku/apps/features/budget_create/presentation/view/screen/budget_amount_form_screen.dart';
import 'package:dhuwitku/apps/features/budget_create/presentation/view/screen/budget_category_form_screen.dart';
import 'package:dhuwitku/apps/features/budget_create/presentation/view/screen/budget_date_form_screen.dart';
import 'package:dhuwitku/apps/features/budget_create/presentation/view/screen/budget_description_form_screen.dart';
import 'package:dhuwitku/apps/features/budget_create/presentation/view/screen/budget_name_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../controller/budget_create_controller.dart';

class BudgetCreateView extends GetView<BudgetCreateController> {
  const BudgetCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BudgetCreate'.tr), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: YoLoading());
        }

        if (controller.error.value != null) {
          return Center(
            child: YoErrorState(
              onRetry: controller.retry,
              title: L10n.t.error_title,
              description: controller.error.value!,
            ),
          );
        }

        return SafeArea(
          child: ListView(
            padding: YoPadding.all16,
            children: [
              BudgetAmountFormScreen(),
              BudgetNameFormScreen(),
              BudgetCategoryFormScreen(),
              BudgetDateFormScreen(),
              BudgetDescriptionFormScreen(),
              BudgetActionButtonScreen(),
            ],
          ),
        );
      }),
    );
  }
}
