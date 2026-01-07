import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/category_create_controller.dart';

class CategoryFormColorScreen extends GetView<CategoryCreateController> {
  const CategoryFormColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return YoColumn(
      padding: YoPadding.bottom16,
      spacing: YoAdaptive.spacingSm(context),
      crossAxisAlignment: .start,
      children: [
        YoText.titleMedium(
          L10n.t.select_color.toUpperCase(),
          color: gray400,
          fontWeight: .bold,
        ),
        Obx(
          () => YoColorPickerButton(
            selectedColor: Color(
              controller.colorSelected.value ?? primaryColor.toARGB32(),
            ),
            onColorSelected: (color) {
              controller.colorSelected.value = color.value;
            },
          ),
        ),
      ],
    );
  }
}
