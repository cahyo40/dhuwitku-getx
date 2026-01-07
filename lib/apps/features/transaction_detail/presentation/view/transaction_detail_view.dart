import 'package:dhuwitku/apps/features/transaction_detail/presentation/view/screen/transaction_edit_action_button_screen.dart';
import 'package:dhuwitku/apps/features/transaction_detail/presentation/view/screen/transaction_edit_amount_field_screen.dart';
import 'package:dhuwitku/apps/features/transaction_detail/presentation/view/screen/transaction_edit_budget_field_screen.dart';
import 'package:dhuwitku/apps/features/transaction_detail/presentation/view/screen/transaction_edit_category_field_screen.dart';
import 'package:dhuwitku/apps/features/transaction_detail/presentation/view/screen/transaction_edit_description_field_screen.dart';
import 'package:dhuwitku/apps/features/transaction_detail/presentation/view/screen/transaction_edit_title_field_screen.dart';
import 'package:dhuwitku/apps/features/transaction_detail/presentation/view/screen/transaction_edit_type_field_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/transaction_detail_controller.dart';

class TransactionDetailView extends GetView<TransactionDetailController> {
  const TransactionDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TransactionDetail'.tr), centerTitle: true),
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

        return SafeArea(
          child: ListView(
            children: [
              TransactionEditTypeFieldScreen(),
              TransactionEditAmountFieldScreen(),
              TransactionEditTitleFieldScreen(),
              TransactionEditCategoryFieldScreen(),
              TransactionEditDescriptionFieldScreen(),
              TransactionEditBudgetFieldScreen(),
              TransactionEditActionButtonScreen(),
            ],
          ),
        );
      }),
    );
  }
}
