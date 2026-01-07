import 'package:dhuwitku/apps/core/utils/string.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/category_create_controller.dart';

class CategoryFormTypeScreen extends GetView<CategoryCreateController> {
  const CategoryFormTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: YoPadding.bottom16,
      child: YoCard(
        backgroundColor: context.cardColor,
        padding: YoPadding.all8,
        child: YoRow(
          spacing: YoAdaptive.spacingMd(context),
          children: CategoryType.values.map((type) {
            return Expanded(
              child: Obx(
                () => YoButton(
                  text: YoStringHelpers.transaction(type.name),
                  buttonStyle: YoButtonStyle.rounded,
                  backgroundColor: backgroundColor,
                  textColor: controller.type.value == type
                      ? primaryColor
                      : textColor,
                  variant: controller.type.value == type
                      ? YoButtonVariant.custom
                      : YoButtonVariant.ghost,
                  onPressed: () {
                    controller.onSelectType(type);
                  },
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
