import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/transaction_detail_controller.dart';

class TransactionDetailView extends GetView<TransactionDetailController> {
  const TransactionDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransactionDetail'.tr),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.value != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.error.value!),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.retry,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return const SafeArea(
          child: Center(
            child: Text(
              'TransactionDetailView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }),
    );
  }
}
