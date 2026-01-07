import 'package:dhuwitku/apps/core/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/transaction_controller.dart';

class TransactionFilterScreen extends GetView<TransactionController> {
  const TransactionFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: YoColumn(
        spacing: YoAdaptive.spacingMd(context),
        crossAxisAlignment: .start,
        children: [
          YoRow(
            spacing: YoAdaptive.spacingSm(context),
            padding: YoPadding.horizontal16,
            children: [
              Expanded(
                child: YoText.titleLarge("Daftar Transaksi", fontWeight: .bold),
              ),
              YoButtonIcon.ghost(
                icon: Icon(Iconsax.filter_outline),
                onPressed: () {},
              ),
              YoButtonIcon.ghost(
                icon: Icon(Iconsax.search_normal_outline),
                onPressed: () {},
              ),
            ],
          ),
          Obx(
            () => YoRow(
              spacing: YoAdaptive.spacingSm(context),
              padding: YoPadding.horizontal16,
              children: controller.filter
                  .map(
                    (e) => YoChip(
                      size: YoChipSize.large,
                      label: YoStringHelpers.transaction(e),
                      onTap: () =>
                          controller.changeFilter(controller.filter.indexOf(e)),
                      variant:
                          controller.currentFilter.value ==
                              controller.filter.indexOf(e)
                          ? YoChipVariant.filled
                          : YoChipVariant.outlined,
                    ),
                  )
                  .toList(),
            ),
          ),
          YoSpace.adaptiveSm(),
        ],
      ),
    );
  }
}
