import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/budget_create_controller.dart';

class BudgetDateFormScreen extends GetView<BudgetCreateController> {
  const BudgetDateFormScreen({super.key});

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
        YoRow(
          spacing: YoAdaptive.spacingSm(context),
          children: controller.dateTypes.map((type) {
            return Expanded(
              child: Obx(
                () => YoButton(
                  text: type.toUpperCase(),
                  buttonStyle: YoButtonStyle.rounded,
                  backgroundColor: backgroundColor,
                  textColor: textColor,
                  variant:
                      controller.selectedDateType.value ==
                          controller.dateTypes.indexOf(type)
                      ? YoButtonVariant.primary
                      : YoButtonVariant.ghost,
                  onPressed: () {
                    controller.onToggleDateType(
                      controller.dateTypes.indexOf(type),
                    );
                  },
                ),
              ),
            );
          }).toList(),
        ),

        YoTextFormField(
          readOnly: true,
          onTap: () async {
            final date = await YoDialogPicker.month(context: context,);

            if (date != null) {
              YoLogger.info("$date");
              controller.startDate.value = date;
              controller.endDate.value = date;
              YoLogger.info("${controller.startDate.value}");
              YoLogger.info("${controller.endDate.value}");
            }
          },

          inputStyle: YoInputStyle.modern,
          hintText: L10n.t.hint_select_date,
          isRequired: true,
          prefixIcon: Icon(Icons.calendar_today, color: gray400),
        ),
      ],
    );
  }
}
