import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/budget_create_controller.dart';

class BudgetAmountFormScreen extends GetView<BudgetCreateController> {
  const BudgetAmountFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text('BudgetAmountFormScreen is working'),
      ),
    );
  }
}
