import 'package:dhuwitku/apps/core/utils/l10n.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/transaction_create_controller.dart';

class TransactionFormTitleScreen extends GetView<TransactionCreateController> {
  const TransactionFormTitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return YoColumn(
      padding: YoPadding.bottom16,
      spacing: YoAdaptive.spacingSm(context),
      crossAxisAlignment: .start,
      children: [
        YoText.titleMedium(
          L10n.t.title.toUpperCase(),
          color: gray400,
          fontWeight: .bold,
        ),
        YoTextFormField(
          controller: controller.title,
          inputType: YoInputType.text,
          inputStyle: YoInputStyle.modern,
          hintText: L10n.t.hint_input_title,
          isRequired: true,
          prefixIcon: Icon(FontAwesome.note_sticky, color: gray400),
        ),
      ],
    );
  }
}
