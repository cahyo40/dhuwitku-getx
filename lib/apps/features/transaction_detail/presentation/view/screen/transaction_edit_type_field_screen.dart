import 'package:dhuwitku/apps/core/utils/string.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/transaction_detail_controller.dart';

class TransactionEditTypeFieldScreen
    extends GetView<TransactionDetailController> {
  const TransactionEditTypeFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isEdit.isTrue) {
        return YoText("Edit");
      } else {
        return YoColumn(
          margin: YoPadding.vertical16,
          spacing: YoAdaptive.spacingSm(context),
          children: [
            YoAvatar.icon(
              icon: controller.transaction.value?.type == TransactionType.income
                  ? Iconsax.money_send_bold
                  : Iconsax.money_send_bold,
              size: YoAvatarSize.xl,
              iconColor:
                  controller.transaction.value?.type == TransactionType.income
                  ? successColor
                  : errorColor,
              backgroundColor:
                  controller.transaction.value?.type == TransactionType.income
                  ? successColor.withOpacity(0.25)
                  : errorColor.withOpacity(0.25),
            ),
            YoCard(
              padding: YoPadding.all8,
              child: YoRow(
                spacing: YoAdaptive.spacingXs(context),
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      color:
                          controller.transaction.value?.type ==
                              TransactionType.income
                          ? successColor
                          : errorColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  YoText.labelMedium(
                    YoStringHelpers.transaction(
                      controller.transaction.value?.type.name ?? "income",
                    ).toUpperCase(),
                    fontWeight: .bold,
                  ),
                ],
              ),
            ),
          ],
        );
      }
    });
  }
}
