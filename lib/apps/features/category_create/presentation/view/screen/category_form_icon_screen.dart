import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/data/model/icon_model.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/category_create_controller.dart';

class CategoryFormIconScreen extends GetView<CategoryCreateController> {
  const CategoryFormIconScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return YoColumn(
      padding: YoPadding.bottom16,
      spacing: YoAdaptive.spacingSm(context),
      crossAxisAlignment: .start,
      children: [
        YoText.titleMedium(
          L10n.t.select_icon.toUpperCase(),
          color: gray400,
          fontWeight: .bold,
        ),
        Obx(
          () => YoIconPickerButton(
            selectedIcon: IconData(
              controller.iconSelected.value?.codePoint ?? Icons.add.codePoint,
              fontFamily:
                  controller.iconSelected.value?.fontFamily ?? 'MaterialIcons',
              fontPackage: controller.iconSelected.value?.fontPackage,
            ),
            onIconSelected: (value) {
              final data = IconModel(
                codePoint: value.codePoint,
                fontFamily: value.fontFamily,
                fontPackage: value.fontPackage,
              );
              YoLogger.info(data.toJson().toString());
              controller.iconSelected.value = data;
            },
          ),
        ),
      ],
    );
  }
}
