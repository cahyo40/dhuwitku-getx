import 'package:dhuwitku/apps/core/utils/string.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/transaction_create_controller.dart';

class TransactionFormTypeScreen extends GetView<TransactionCreateController> {
  const TransactionFormTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: YoPadding.bottom16,
      child: YoCard(
        backgroundColor: context.cardColor,
        padding: YoPadding.all8,
        child: YoRow(
          spacing: YoAdaptive.spacingMd(context),
          children: TransactionType.values.map((type) {
            return Expanded(
              child: Obx(
                () => YoButton(
                  text: YoStringHelpers.transaction(type.name),
                  buttonStyle: YoButtonStyle.rounded,
                  backgroundColor: backgroundColor,
                  textColor: controller.transactionType.value == type
                      ? primaryColor
                      : textColor,
                  variant: controller.transactionType.value == type
                      ? YoButtonVariant.custom
                      : YoButtonVariant.ghost,
                  onPressed: () {
                    controller.onChangeTransactionType(type);
                  },
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
