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
    return YoColumn(
      crossAxisAlignment: .center,
      children: [
        YoCard(
          backgroundColor: context.primaryColor,
          child: YoRow(
            children: [
              Expanded(
                child: YoColumn(
                  spacing: YoAdaptive.spacingMd(context),
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      spacing: YoSpacing.sm,
                      mainAxisAlignment: .start,
                      children: [
                        YoText.bodyMedium('Total Balance', color: gray700),
                        Icon(Iconsax.eye_outline, color: gray700),
                      ],
                    ),

                    YoText.monoLarge(
                      YoCurrencyFormatter.formatCurrency(4000000),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                    Container(
                      padding: YoPadding.all8,
                      decoration: BoxDecoration(
                        borderRadius: YoAdaptive.borderRadiusLg(context),
                        color: textColor.withOpacity(.25),
                      ),
                      child: Row(
                        mainAxisSize: .min,
                        spacing: 4,
                        mainAxisAlignment: .start,
                        children: [
                          Icon(
                            Iconsax.trend_down_outline,
                            color: gray700,
                            size: 18,
                          ),
                          YoText.monoSmall(
                            "+ 12% dari bulan lalu",
                            color: gray700,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              YoAvatar.icon(
                size: YoAvatarSize.lg,
                icon: Iconsax.wallet_2_bold,
                iconColor: textColor,
                variant: YoAvatarVariant.rounded,
                backgroundColor: textColor.withOpacity(.25),
              ),
            ],
          ),
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
