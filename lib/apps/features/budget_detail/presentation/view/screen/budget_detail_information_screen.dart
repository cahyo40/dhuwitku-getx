import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yo_ui/yo_ui.dart';

import '../../controller/budget_detail_controller.dart';

class BudgetDetailInformationScreen extends GetView<BudgetDetailController> {
  const BudgetDetailInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final budget = controller.budget.value!.budget;
    final totalTransaction = controller.budget.value!.totalTransactions;

    final countTransaction = controller.budget.value!.transactions.length;

    double sisaBudget() {
      return (budget.amount - totalTransaction).toDouble();
    }

    final color = Color(budget.color!);

    double decimalTransaction() {
      return totalTransaction / budget.amount;
    }

    String percentageTransaction() {
      return "${decimalTransaction() * 100}%";
    }

    IconData iconChip() {
      if (decimalTransaction() > 1) {
        return Icons.error;
      } else if (decimalTransaction() > 0.74 && decimalTransaction() < 0.999) {
        return Icons.warning;
      } else if (decimalTransaction() < 0.74) {
        return Icons.check;
      } else {
        return Icons.info;
      }
    }

    Color colorChip() {
      if (decimalTransaction() > 1) {
        return errorColor;
      } else if (decimalTransaction() > 0.74 && decimalTransaction() < 0.999) {
        return warningColor;
      } else if (decimalTransaction() < 0.74) {
        return successColor;
      } else {
        return gray500;
      }
    }

    return YoColumn(
      crossAxisAlignment: .start,
      spacing: YoAdaptive.spacingSm(context),
      children: [
        YoRow(
          spacing: YoAdaptive.spacingSm(context),
          children: [
            Expanded(
              child: YoText.headlineMedium(
                budget.name.toUpperCase(),
                fontWeight: .bold,
              ),
            ),
            YoAvatar.icon(
              icon: IconData(
                budget.icon.codePoint,
                fontFamily: budget.icon.fontFamily,
                fontPackage: budget.icon.fontPackage,
              ),
              size: YoAvatarSize.lg,
              iconColor: color,
              backgroundColor: color.withOpacity(.25),
            ),
          ],
        ),
        YoRow(
          spacing: YoAdaptive.spacingXs(context),
          children: [
            Icon(Iconsax.calendar_2_outline, color: gray400),
            YoText.bodySmall(
              YoDateFormatter.formatDateRange(budget.startDate, budget.endDate),
              color: gray400,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        YoSpace.adaptiveSm(),
        YoCard(
          child: YoColumn(
            spacing: YoAdaptive.spacingMd(context),
            crossAxisAlignment: .stretch,
            children: [
              YoText.titleSmall("TERPAKAI", color: gray400),
              Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: YoCurrencyFormatter.formatCurrency(
                              totalTransaction.toDouble(),
                            ),
                            style: context.yoCurrencyLarge.copyWith(
                              fontSize: context.yoHeadlineSmall.fontSize,
                            ),
                          ),
                          TextSpan(
                            text:
                                "/${YoCurrencyFormatter.formatCurrency(budget.amount.toDouble())}",
                            style: context.yoCurrencyLarge.copyWith(
                              fontSize: context.yoTitleMedium.fontSize,
                              color: gray400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  YoChip(
                    label: percentageTransaction(),

                    backgroundColor: color.withOpacity(.25),
                  ),
                ],
              ),
              YoProgress.linear(
                value: decimalTransaction(),
                color: color,
                size: YoProgressSize.large,
                backgroundColor: color.withOpacity(.25),
              ),
              YoRow(
                mainAxisAlignment: .spaceBetween,
                children: [
                  YoText.titleSmall("SISA BUDGET", color: gray400),
                  YoSpace.adaptiveSm(),
                  YoText.monoMedium(
                    YoCurrencyFormatter.formatCurrency(sisaBudget()),
                    color: color,
                  ),
                ],
              ),
            ],
          ),
        ),
        YoRow(
          spacing: YoAdaptive.spacingMd(context),
          children: [
            Expanded(
              child: YoCard(
                child: YoColumn(
                  children: [
                    YoText.bodySmall("TOTAL TRANSAKSI", color: gray400),
                    YoText(
                      countTransaction.toString(),
                      style: context.yoCurrencyLarge.copyWith(
                        fontSize: context.yoHeadlineLarge.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: YoCard(
                child: YoColumn(
                  children: [
                    YoText.bodySmall("STATUS TRANSAKSI", color: gray400),
                    YoAvatar.icon(
                      icon: iconChip(),
                      iconColor: colorChip(),
                      backgroundColor: colorChip().withOpacity(.25),
                    ),
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
