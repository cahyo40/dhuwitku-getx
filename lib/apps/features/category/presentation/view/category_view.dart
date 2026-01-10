import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/core/utils/string.dart';
import 'package:dhuwitku/apps/routes/route_names.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:dhuwitku/apps/widget/card_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../controller/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.t.category), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Get.toNamed(RouteNames.CATEGORY_CREATE);
          if (result != null) {
            controller.retry();
          }
        },
        child: const Icon(Icons.add),
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

        return SafeArea(
          child: YoColumn(
            spacing: YoAdaptive.spacingSm(context),

            children: [
              YoRow(
                spacing: YoAdaptive.spacingMd(context),
                children: List.generate(controller.filterCategory.length, (
                  index,
                ) {
                  final category = YoStringHelpers.transaction(
                    controller.filterCategory[index],
                  );
                  return Expanded(
                    child: YoButton.custom(
                      text: category,
                      onPressed: () => controller.toggleCategoryType(index),
                      backgroundColor: index == controller.categoryType.value
                          ? primaryColor
                          : backgroundColor,
                    ),
                  );
                }),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.categoriesFilter.length,
                  padding: YoPadding.all16,
                  itemBuilder: (context, index) {
                    final category = controller.categoriesFilter[index];
                    final countTransaction = controller.transactions
                        .where((e) => e.categoryId == category.id)
                        .length;
                    return CardCategoryWidget(
                      onDelete: () {
                        YoConfirmDialog.show(
                          context: context,
                          title: 'Delete Category',
                          message:
                              'Are you sure you want to delete this category?',
                        ).then((confirm) {
                          if (confirm == true && context.mounted) {
                            controller.onDeleteCategory(category.id);
                            controller.retry();
                            YoSnackBar.success(
                              context,
                              'Category deleted successfully',
                            );
                          }
                        });
                      },
                      category: category,
                      countTransaction: countTransaction,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
