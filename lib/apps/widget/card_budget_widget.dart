import 'package:dhuwitku/apps/data/model/budget_response_model.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:yo_ui/yo_ui.dart';

class CardBudgetWidget extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onLongPress;

  final BudgetResponseModel data;
  const CardBudgetWidget({
    super.key,
    this.onTap,
    this.onLongPress,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final budget = data.budget;
    final totalAmount = data.totalTransactions;
    final countTransactions = data.transactions.length;
    final color = Color(budget.color ?? primaryColor.toARGB32());

    double decimalAmount() {
      final data = (totalAmount / budget.amount);
      return data;
    }

    String percentageAmount() {
      final data = (totalAmount / budget.amount) * 100;
      return "${data.toStringAsFixed(2)} %";
    }

    Color colorChip() {
      if (decimalAmount() > 1) {
        return errorColor;
      } else if (decimalAmount() > 0.74 && decimalAmount() < 0.999) {
        return warningColor;
      } else if (decimalAmount() < 0.74) {
        return successColor;
      } else {
        return gray500;
      }
    }

    IconData iconChip() {
      if (decimalAmount() > 1) {
        return Icons.error;
      } else if (decimalAmount() > 0.74 && decimalAmount() < 0.999) {
        return Icons.warning;
      } else if (decimalAmount() < 0.74) {
        return Icons.check;
      } else {
        return Icons.info;
      }
    }

    return Padding(
      padding: YoPadding.bottom16,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: YoCard(
          child: SizedBox(
            child: YoColumn(
              spacing: YoSpacing.md,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YoRow(
                  spacing: YoSpacing.md,
                  children: [
                    YoAvatar.icon(
                      icon: IconData(
                        budget.icon.codePoint,
                        fontFamily: budget.icon.fontFamily,
                        fontPackage: budget.icon.fontPackage,
                      ),
                      iconColor: color,
                      variant: YoAvatarVariant.rounded,
                      backgroundColor: color.withOpacity(.25),
                    ),
                    Expanded(
                      child: YoColumn(
                        crossAxisAlignment: .start,
                        children: [
                          YoText.titleMedium(
                            budget.name.capitalize!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                          ),
                          YoText.bodySmall(
                            budget.isPrivate ? "Pribadi" : "Share",
                            color: gray400,
                          ),
                        ],
                      ),
                    ),
                    YoAvatar.icon(
                      icon: iconChip(),
                      iconColor: colorChip(),
                      backgroundColor: colorChip().withOpacity(.25),
                    ),
                  ],
                ),

                YoRow(
                  spacing: YoAdaptive.spacingXs(context),
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    YoRow(
                      children: [
                        YoText.bodyMedium("Date Range ", color: gray400),
                        YoText.monoMedium(
                          YoDateFormatter.formatDateRange(
                            budget.startDate,
                            budget.endDate,
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    YoRow(
                      children: [
                        YoText.bodyMedium("Transactions ", color: gray400),
                        YoText.monoMedium(
                          countTransactions.toString(),
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),

                YoProgress.linear(
                  value: decimalAmount(),
                  backgroundColor: color.withOpacity(.25),
                  color: color,
                  size: YoProgressSize.large,
                  label: percentageAmount(),
                ),

                YoRow(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    YoRow(
                      children: [
                        YoText.bodyMedium("Pengeluaran ", color: gray400),
                        YoText.monoMedium(
                          YoCurrencyFormatter.formatCurrency(
                            totalAmount.toDouble(),
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    YoRow(
                      children: [
                        YoText.bodyMedium("Anggaran ", color: gray400),
                        YoText.monoMedium(
                          YoCurrencyFormatter.formatCurrency(
                            budget.amount.toDouble(),
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
