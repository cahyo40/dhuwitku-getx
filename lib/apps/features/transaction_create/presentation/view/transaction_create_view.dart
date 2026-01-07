import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/features/transaction_create/presentation/view/screen/transaction_form_amount_screen.dart';
import 'package:dhuwitku/apps/features/transaction_create/presentation/view/screen/transaction_form_budget_screen.dart';
import 'package:dhuwitku/apps/features/transaction_create/presentation/view/screen/transaction_form_category_screen.dart';
import 'package:dhuwitku/apps/features/transaction_create/presentation/view/screen/transaction_form_description_screen.dart';
import 'package:dhuwitku/apps/features/transaction_create/presentation/view/screen/transaction_form_title_screen.dart';
import 'package:dhuwitku/apps/features/transaction_create/presentation/view/screen/transaction_form_type_screen.dart';
import 'package:dhuwitku/apps/routes/route_names.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../controller/transaction_create_controller.dart';

class TransactionCreateView extends GetView<TransactionCreateController> {
  const TransactionCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.t.transaction_create.capitalize!),
        centerTitle: true,
        actions: [
          Obx(
            () => Visibility(
              visible: controller.categories.isNotEmpty,
              child: YoButton.ghost(
                text: L10n.t.reset.toUpperCase(),
                textColor: gray400,
                onPressed: controller.onReset,
              ),
            ),
          ),
        ],
      ),
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

        if (controller.categories.isEmpty) {
          return Center(
            child: YoEmptyState(
              title: L10n.t.title_no_category,
              description: L10n.t.desc_no_category,
              actionText: L10n.t.add_category.capitalizeFirst,
              onAction: () async {
                final result = await Get.toNamed(RouteNames.CATEGORY_CREATE);
                if (result == true) {
                  controller.onInit();
                }
              },
            ),
          );
        }

        return SafeArea(
          child: Form(
            key: controller.formKey,
            child: ListView(
              padding: YoAdaptive.listItemPadding(context),
              children: [
                TransactionFormTypeScreen(),
                TransactionFormTitleScreen(),
                TransactionFormAmountScreen(),
                TransactionFormCategoryScreen(),
                // TransactionFormDateScreen(),
                TransactionFormDescriptionScreen(),
                TransactionFormBudgetScreen(),
                YoButton.modern(
                  size: YoButtonSize.large,
                  text: L10n.t.save_transaction.capitalize!,
                  iconPosition: IconPosition.right,
                  icon: Icon(Icons.check, color: textColor),
                  onPressed: controller.isLoading.isFalse
                      ? controller.onSave
                      : null,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
