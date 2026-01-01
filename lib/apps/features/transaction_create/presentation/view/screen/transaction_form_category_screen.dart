import 'package:dhuwitku/apps/core/utils/l10n.dart';
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
          controller: controller.categoryController,
          inputType: YoInputType.text,
          inputStyle: YoInputStyle.modern,
          hintText: L10n.t.hint_select_category,
          isRequired: true,
          prefixIcon: Icon(Icons.category, color: context.gray400),
          suffixIcon: Icon(Icons.arrow_drop_down, color: context.gray400),
        ),
      ],
    );
  }
}
