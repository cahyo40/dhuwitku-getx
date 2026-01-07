import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/transaction_detail_controller.dart';

class TransactionEditBudgetFieldScreen extends GetView<TransactionDetailController> {
  const TransactionEditBudgetFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text('TransactionEditBudgetFieldScreen is working'),
      ),
    );
  }
}
