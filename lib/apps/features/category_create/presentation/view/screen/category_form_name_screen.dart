import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/category_create_controller.dart';

class CategoryFormNameScreen extends GetView<CategoryCreateController> {
  const CategoryFormNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return YoColumn(
      padding: YoPadding.bottom16,
      spacing: YoAdaptive.spacingSm(context),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YoText.titleMedium(
          L10n.t.title.toUpperCase(),
          color: gray400,
          fontWeight: .bold,
        ),
        YoTextFormField(
          controller: controller.name,
          inputType: YoInputType.text,
          inputStyle: YoInputStyle.modern,
          hintText: L10n.t.hint_input_category,
          isRequired: true,
          prefixIcon: Icon(Iconsax.category_outline),
        ),
      ],
    );
  }
}
