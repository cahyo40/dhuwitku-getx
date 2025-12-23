import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
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
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,

        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              YoText.titleMedium(
                "Recent Transaction",
                fontWeight: FontWeight.bold,
              ),
              YoButton.ghost(text: "See All", onPressed: () {}),
            ],
          ),
          YoSpace.adaptiveSm(),
          ListView(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              CardTransactionWidget(
                workspaceModel:
                    Get.find<BottomNavBarController>().workspace.value!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
