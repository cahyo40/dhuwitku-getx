import 'package:dhuwitku/apps/core/utils/date.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:dhuwitku/apps/routes/route_names.dart';
import 'package:dhuwitku/apps/widget/card_transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/transaction_controller.dart';

class TransactionListScreen extends GetView<TransactionController> {
  const TransactionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final categories = Get.find<BottomNavBarController>().categories;
      final transactions = controller.filteredTransactions;
      final groupedItems = <dynamic>[];

      for (var i = 0; i < transactions.length; i++) {
        final transaction = transactions[i];
        final date = transaction.date;
        bool isSameDay = false;
        if (i > 0) {
          final prevDate = transactions[i - 1].date;
          isSameDay =
              date.year == prevDate.year &&
              date.month == prevDate.month &&
              date.day == prevDate.day;
        }

        if (i == 0 || !isSameDay) {
          groupedItems.add(YoDateFormatter().getDateHeaderTransaction(date));
        }
        groupedItems.add(transaction);
      }

      return ListView.builder(
        padding: YoPadding.all16,
        physics: const ClampingScrollPhysics(),
        itemCount: groupedItems.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = groupedItems[index];
          if (item is String) {
            return Padding(
              padding: YoPadding.vertical8,
              child: YoText.titleSmall(item),
            );
          }
          return CardTransactionWidget(
            onTap: () async {
              final result = await Get.toNamed(
                RouteNames.TRANSACTION_DETAIL,
                parameters: {
                  "id": item.id.toString(),
                  "category_id": item.categoryId.toString(),
                },
              );
              if (result == true) {
                Get.find<BottomNavBarController>().retry();
                controller.onInit();
              }
            },
            transaction: item as TransactionModel,
            category: categories.firstWhere(
              (element) => element.id == (item).categoryId,
            ),
          );
        },
      );
    });
  }
}
