import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/budget_controller.dart';

class BudgetFilterScreen extends GetView<BudgetController> {
  const BudgetFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text('BudgetFilterScreen is working'),
      ),
    );
  }
}
