import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/budget_create_controller.dart';

class BudgetCategoryFormScreen extends GetView<BudgetCreateController> {
  const BudgetCategoryFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text('BudgetCategoryFormScreen is working'),
      ),
    );
  }
}
