import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/widget/card_budget_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/home_controller.dart';

class HomeBudgetScreen extends GetView<HomeController> {
  const HomeBudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      children: [
        YoText.titleMedium(L10n.t.active_budget, fontWeight: FontWeight.bold),
        YoSpace.adaptiveMd(),
        ListView(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [CardBudgetWidget(), CardBudgetWidget()],
        ),
      ],
    );
  }
}
