import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/budget_create_controller.dart';

class BudgetNameFormScreen extends GetView<BudgetCreateController> {
  const BudgetNameFormScreen({super.key});

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
          hintText: "Budget.name.hint",
          isRequired: true,
          prefixIcon: Icon(Iconsax.money_2_outline),
        ),
      ],
    );
  }
}
