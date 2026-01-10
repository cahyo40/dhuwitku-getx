import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/budget_create_controller.dart';

class BudgetActionButtonScreen extends GetView<BudgetCreateController> {
  const BudgetActionButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text('BudgetActionButtonScreen is working'),
      ),
    );
  }
}
