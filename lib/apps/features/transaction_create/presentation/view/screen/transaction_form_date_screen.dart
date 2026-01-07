import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/transaction_create_controller.dart';

class TransactionFormDateScreen extends GetView<TransactionCreateController> {
  const TransactionFormDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return YoColumn(
      padding: YoPadding.bottom16,
      spacing: YoAdaptive.spacingSm(context),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YoText.titleMedium(
          L10n.t.date.toUpperCase(),
          color: gray400,
          fontWeight: .bold,
        ),
        YoTextFormField(
          readOnly: true,
          onTap: () async {
            final date = await YoDialogPicker.date(
              context: context,
              initialDate: controller.selectedDate.value,
            );
            if (date != null) {
              controller.onChangeSelectedDate(date);
            }
          },
          controller: controller.dateController,
          inputStyle: YoInputStyle.modern,
          hintText: L10n.t.hint_select_date,
          isRequired: true,
          prefixIcon: Icon(Icons.calendar_today, color: gray400),
        ),
      ],
    );
  }
}
