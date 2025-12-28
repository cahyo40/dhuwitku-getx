import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

class CardTransactionWidget extends StatelessWidget {
  final void Function()? onTap;
  const CardTransactionWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isIncome = false;
    return Padding(
      padding: YoPadding.bottom8,
      child: YoCard(
        onTap: () {},
        child: YoRow(
          spacing: YoAdaptive.spacingMd(context),
          children: [
            YoAvatar.icon(
              icon: FontAwesome.youtube_brand,
              iconColor: Colors.red,
              backgroundColor: Colors.red.withOpacity(.25),
              size: YoAvatarSize.md,
            ),
            Expanded(
              child: YoColumn(
                spacing: YoSpacing.sm,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YoText.titleMedium("Youtube Subscription"),
                  YoText.bodySmall("Langganan", color: gray400),
                ],
              ),
            ),
            YoColumn(
              spacing: YoSpacing.sm,
              crossAxisAlignment: .end,
              children: [
                YoText.monoMedium(
                  " ${isIncome ? "+" : "-"} Rp 100.000",
                  color: isIncome ? successColor : errorColor,
                ),
                YoText.bodySmall(
                  YoDateFormatter.formatDateTime(
                    DateTime.now(),
                    format: "dd MMM yy . HH:mm",
                  ),
                  color: gray400,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
