import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/home_controller.dart';

class HomeTotalBalanceScreen extends GetView<HomeController> {
  const HomeTotalBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .center,
      children: [
        Row(
          spacing: YoSpacing.sm,
          mainAxisAlignment: .center,
          children: [
            YoText.bodyMedium('Total Balance', color: gray400),
            Icon(Iconsax.eye_outline, color: gray400),
          ],
        ),
        YoSpace.adaptiveSm(),
        YoText.monoLarge(
          YoCurrencyFormatter.formatCurrency(4000000),
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        YoSpace.adaptiveSm(),
        Row(
          spacing: YoSpacing.sm,
          mainAxisAlignment: .center,
          children: [
            Icon(Iconsax.trend_up_bold, color: successColor),
            YoText.monoMedium(
              "+ ${YoCurrencyFormatter.formatCurrency(40000)}",
              color: successColor,
            ),
            YoText.bodyMedium("Today", color: gray400),
          ],
        ),
        YoSpace.adaptiveLg(),
        Row(
          spacing: YoSpacing.md,
          children: [
            Expanded(
              child: YoCard.filled(
                padding: YoPadding.all12,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Icon(Iconsax.arrow_down_2_outline, color: successColor),
                        YoText.bodyMedium("INCOME", color: gray400),
                      ],
                    ),
                    YoSpace.adaptiveSm(),
                    YoText.monoLarge(
                      YoCurrencyFormatter.formatCurrency(4000000),
                      fontSize: 18,
                    ),
                    YoSpace.adaptiveSm(),
                    YoText.bodySmall("+25% this month", color: gray400),
                  ],
                ),
              ),
            ),
            Expanded(
              child: YoCard.filled(
                padding: YoPadding.all12,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Icon(Iconsax.arrow_up_1_outline, color: errorColor),
                        YoText.bodyMedium("EXPENSE", color: gray400),
                      ],
                    ),
                    YoSpace.adaptiveSm(),
                    YoText.monoLarge(
                      YoCurrencyFormatter.formatCurrency(4000000),
                      fontSize: 18,
                    ),
                    YoSpace.adaptiveSm(),
                    YoText.bodySmall("+25% this month", color: gray400),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
