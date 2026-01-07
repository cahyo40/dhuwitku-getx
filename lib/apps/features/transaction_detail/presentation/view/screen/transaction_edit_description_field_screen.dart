import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/transaction_detail_controller.dart';

class TransactionEditDescriptionFieldScreen
    extends GetView<TransactionDetailController> {
  const TransactionEditDescriptionFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.transaction.value!.description!.isEmpty &&
          controller.isEdit.isFalse) {
        return SizedBox.shrink();
      } else {
        return YoColumn(
          margin: YoPadding.bottom16,
          spacing: YoAdaptive.spacingSm(context),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoText.titleMedium(
              L10n.t.description.toUpperCase(),
              color: gray400,
              fontWeight: .bold,
            ),
            YoTextFormField(
              readOnly: !controller.isEdit.value,
              controller: controller.descriptionController,
              inputStyle: YoInputStyle.modern,
              hintText: L10n.t.hint_input_description,
              fillColor: controller.isEdit.value
                  ? null
                  : context.backgroundColor,
              inputType: YoInputType.multiline,
              prefixIcon: Icon(Icons.description, color: gray400),
            ),
          ],
        );
      }
    });
  }
}
