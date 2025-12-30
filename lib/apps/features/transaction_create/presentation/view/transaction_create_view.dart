import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../controller/transaction_create_controller.dart';

class TransactionCreateView extends GetView<TransactionCreateController> {
  const TransactionCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TransactionCreate'.tr), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: YoLoading());
        }

        if (controller.error.value != null) {
          return Center(
            child: YoErrorState(
              onRetry: controller.retry,
              title: L10n.t.error_title,
              description: controller.error.value!,
            ),
          );
        }

        return const SafeArea(
          child: Center(
            child: Text(
              'TransactionCreateView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }),
    );
  }
}
