import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/budget_create_controller.dart';

class BudgetDescriptionFormScreen extends GetView<BudgetCreateController> {
  const BudgetDescriptionFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return YoColumn(
      padding: YoPadding.bottom16,
      spacing: YoAdaptive.spacingSm(context),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YoText.titleMedium(
          L10n.t.description.toUpperCase(),
          color: gray400,
          fontWeight: .bold,
        ),
        YoTextFormField(
          controller: controller.description,
          inputStyle: YoInputStyle.modern,
          hintText: L10n.t.hint_input_description,
          inputType: YoInputType.multiline,

          prefixIcon: Icon(Icons.description, color: gray400),
        ),
      ],
    );
  }
}
