import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:dhuwitku/apps/widget/card_transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui_base.dart';

import '../../controller/budget_detail_controller.dart';

class BudgetDetailTransactionScreen extends GetView<BudgetDetailController> {
  const BudgetDetailTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      padding: YoPadding.top16,
      shrinkWrap: true,
      children: [
        YoText.titleMedium(
          "SEMUA TRANSAKSI",
          fontWeight: FontWeight.bold,
          color: gray400,
        ),
        YoSpace.adaptiveMd(),
        ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.budget.value!.transactions.length,
          itemBuilder: (context, index) {
            final transaction = controller.budget.value!.transactions[index];
            final category = controller.categories.firstWhere(
              (element) => element.id == transaction.categoryId,
            );

            return CardTransactionWidget(
              transaction: transaction,
              category: category,
            );
          },
        ),
      ],
    );
  }
}
