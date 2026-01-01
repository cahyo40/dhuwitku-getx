import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/features/category_create/presentation/controller/category_create_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

class CategoryCreateView extends GetView<CategoryCreateController> {
  const CategoryCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CategoryCreate'.tr), centerTitle: true),
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
              'CategoryCreateView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }),
    );
  }
}
