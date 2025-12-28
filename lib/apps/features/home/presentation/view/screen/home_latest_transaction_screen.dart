import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/data/dummy_data.dart';
import 'package:dhuwitku/apps/features/home/presentation/controller/home_controller.dart';
import 'package:dhuwitku/apps/widget/card_transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

class HomeLatestTransactionScreen extends GetView<HomeController> {
  const HomeLatestTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: YoPadding.top16,
      child: ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          YoText.titleMedium(
            L10n.t.recent_transaction,
            fontWeight: FontWeight.bold,
          ),
          YoSpace.adaptiveMd(),
          ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return CardTransactionWidget(
                transaction: dummyTransactions[index],
                category: dummyCategories.firstWhere(
                  (element) =>
                      element.id == dummyTransactions[index].categoryId,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
