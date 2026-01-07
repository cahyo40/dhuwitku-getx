import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/transaction_detail_controller.dart';

class TransactionEditAmountFieldScreen
    extends GetView<TransactionDetailController> {
  const TransactionEditAmountFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => YoColumn(
        margin: YoPadding.vertical16,
        spacing: YoAdaptive.spacingSm(context),
        children: [
          if (controller.isEdit.isTrue)
            Center(
              child: YoText.titleMedium(
                L10n.t.amount.toUpperCase(),
                color: gray400,
                fontWeight: .bold,
              ),
            ),
          YoTextFormField(
            isRequired: true,
            readOnly: !controller.isEdit.value,
            textAlign: TextAlign.center,
            inputStyle: YoInputStyle.filled,
            focusedBorderColor: context.backgroundColor,
            fillColor: context.backgroundColor,
            textStyle: context.yoCurrencyLarge.copyWith(fontSize: 48),
            controller: controller.amountController,
            inputFormatters: [IndonesiaCurrencyFormatter()],
            inputType: YoInputType.number,
            hintText: L10n.t.hint_input_amount,
            hintStyle: context.yoBodyMedium.copyWith(color: gray400),
          ),
        ],
      ),
    );
  }
}
