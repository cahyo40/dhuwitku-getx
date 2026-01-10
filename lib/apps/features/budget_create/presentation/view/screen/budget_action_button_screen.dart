import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/budget_create_controller.dart';

class BudgetActionButtonScreen extends GetView<BudgetCreateController> {
  const BudgetActionButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return YoButton.primary(text: "SAVE", onPressed: () {});
  }
}
