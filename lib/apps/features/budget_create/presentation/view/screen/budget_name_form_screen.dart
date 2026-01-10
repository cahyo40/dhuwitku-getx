import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/budget_create_controller.dart';

class BudgetNameFormScreen extends GetView<BudgetCreateController> {
  const BudgetNameFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text('BudgetNameFormScreen is working'),
      ),
    );
  }
}
