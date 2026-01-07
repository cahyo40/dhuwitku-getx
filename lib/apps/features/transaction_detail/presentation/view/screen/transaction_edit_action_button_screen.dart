import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/transaction_detail_controller.dart';

class TransactionEditActionButtonScreen
    extends GetView<TransactionDetailController> {
  const TransactionEditActionButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isEdit.isFalse
          ? YoRow(
              margin: YoPadding.vertical16,
              spacing: YoAdaptive.spacingSm(context),
              children: [
                Expanded(
                  child: YoButton.primary(
                    text: "Edit Data",
                    onPressed: () {
                      controller.toggleEdit();
                    },
                  ),
                ),
                YoButtonIcon.custom(
                  backgroundColor: errorColor,
                  shape: YoIconButtonShape.rounded,
                  size: YoIconButtonSize.large,
                  icon: Icon(Iconsax.trash_outline),
                  onPressed: () {
                    YoConfirmDialog.show(
                      context: context,
                      title: "Hapus Data",
                      message: "Apakah Anda yakin ingin menghapus data ini?",
                    ).then((confirm) {
                      if (confirm == true) {
                        controller.onDeleteTransaction();
                        Get.back(result: true);
                      }
                    });
                  },
                ),
              ],
            )
          : YoRow(
              margin: YoPadding.vertical16,
              spacing: YoAdaptive.spacingSm(context),
              children: [
                Expanded(
                  child: YoButton.primary(
                    text: "Perbarui Data",
                    onPressed: () {
                      controller.onUpdate();
                    },
                  ),
                ),
                YoButtonIcon.custom(
                  backgroundColor: errorColor,
                  shape: YoIconButtonShape.rounded,
                  size: YoIconButtonSize.large,
                  icon: Icon(Icons.close),
                  onPressed: () {
                    controller.toggleEdit();
                  },
                ),
              ],
            ),
    );
  }
}
