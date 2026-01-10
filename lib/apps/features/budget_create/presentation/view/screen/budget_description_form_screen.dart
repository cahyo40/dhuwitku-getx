import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/budget_create_controller.dart';

class BudgetDescriptionFormScreen extends GetView<BudgetCreateController> {
  const BudgetDescriptionFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text('BudgetDescriptionFormScreen is working'),
      ),
    );
  }
}
