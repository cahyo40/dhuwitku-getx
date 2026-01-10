import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/budget_create_controller.dart';

class BudgetDateFormScreen extends GetView<BudgetCreateController> {
  const BudgetDateFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text('BudgetDateFormScreen is working'),
      ),
    );
  }
}
