import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/transaction_create_controller.dart';

class TransactionFormCategoryScreen
    extends GetView<TransactionCreateController> {
  const TransactionFormCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return YoColumn(
      padding: YoPadding.bottom16,
      spacing: YoAdaptive.spacingSm(context),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YoText.titleMedium(
          L10n.t.category.toUpperCase(),
          color: context.gray400,
          fontWeight: .bold,
        ),
        YoTextFormField(
          readOnly: true,
          onTap: () {
            Get.bottomSheet(
              YoBottomSheet(
                title: "Select Category",
                actions: [
                  IconButton(
                    onPressed: () async {
                      Get.back();
                      final result = await Get.toNamed(
                        RouteNames.CATEGORY_CREATE,
                      );
                      if (result == true) {
                        controller.onInit();
                      }
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
                child: controller.categoriesFilter.isEmpty
                    ? YoEmptyState(
                        title: L10n.t.title_no_category,
                        description: L10n.t.desc_no_category,
                        actionText: L10n.t.add_category.capitalizeFirst,
                        onAction: () async {
                          final result = await Get.toNamed(
                            RouteNames.CATEGORY_CREATE,
                          );
                          if (result != null) {
                            controller.onInit();
                          }
                        },
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.categoriesFilter.length,
                        itemBuilder: (context, index) {
                          final category = controller.categoriesFilter[index];
                          final icon = category.icon;
                          return YoListTile(
                            selected:
                                controller.selectedCategory.value?.id ==
                                category.id,
                            title: category.name.capitalize,
                            leading: Icon(
                              IconData(
                                icon.codePoint,
                                fontFamily: icon.fontFamily,
                                fontPackage: icon.fontPackage,
                              ),
                              color: Color(category.color),
                            ),

                            onTap: () {
                              controller.categoryController.text =
                                  category.name.capitalize!;
                              controller.selectedCategory.value = category;
                              Get.back();
                            },
                          );
                        },
                      ),
              ),
            );
          },
          controller: controller.categoryController,
          inputType: YoInputType.text,
          inputStyle: YoInputStyle.modern,
          hintText: L10n.t.hint_select_category,
          isRequired: true,
          prefixIcon: Obx(
            () => controller.selectedCategory.value == null
                ? Icon(Icons.category, color: context.gray400)
                : Icon(
                    IconData(
                      controller.selectedCategory.value!.icon.codePoint,
                      fontFamily:
                          controller.selectedCategory.value!.icon.fontFamily,
                      fontPackage:
                          controller.selectedCategory.value!.icon.fontPackage,
                    ),
                    color: Color(controller.selectedCategory.value!.color),
                  ),
          ),
          suffixIcon: Icon(Icons.arrow_drop_down, color: context.gray400),
        ),
      ],
    );
  }
}
