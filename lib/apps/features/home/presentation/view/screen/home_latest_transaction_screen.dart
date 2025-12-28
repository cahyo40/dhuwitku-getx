import 'package:dhuwitku/apps/widget/card_transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/home_controller.dart';

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
          YoText.titleMedium("Recent Transaction", fontWeight: FontWeight.bold),
          YoSpace.adaptiveMd(),
          ListView(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              CardTransactionWidget(),
              CardTransactionWidget(),
              CardTransactionWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
