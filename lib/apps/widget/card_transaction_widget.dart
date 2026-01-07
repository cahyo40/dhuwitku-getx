import 'package:dhuwitku/apps/data/dummy_data.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_ui/yo_ui.dart';

class CardTransactionWidget extends StatelessWidget {
  final void Function()? onTap;
  final TransactionModel transaction;
  final CategoryModel? category;
  const CardTransactionWidget({
    super.key,
    this.onTap,
    required this.transaction,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == TransactionType.income;
    CategoryModel defaultCtg = isIncome
        ? defaultIncomeCategories.first
        : defaultExpenseCategories.first;
    final ctg = category ?? defaultCtg;
    return Padding(
      padding: YoPadding.bottom8,
      child: YoCard(
        onTap: onTap,
        child: YoRow(
          spacing: YoAdaptive.spacingMd(context),
          children: [
            YoAvatar.icon(
              icon: IconData(
                ctg.icon.codePoint,
                fontFamily: ctg.icon.fontFamily,
                fontPackage: ctg.icon.fontPackage,
              ),
              iconColor: Color(ctg.color),
              backgroundColor: Color(ctg.color).withOpacity(.25),
              size: YoAvatarSize.md,
            ),
            Expanded(
              child: YoColumn(
                spacing: YoSpacing.sm,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YoText.titleMedium(transaction.name),
                  YoText.bodySmall(ctg.name.capitalize!, color: gray400),
                ],
              ),
            ),
            YoColumn(
              spacing: YoSpacing.sm,
              crossAxisAlignment: .end,
              children: [
                YoText.monoMedium(
                  " ${isIncome ? "+" : "-"} ${YoCurrencyFormatter.formatCurrency(transaction.amount.toDouble(), symbol: "Rp. ")}",
                  color: isIncome ? successColor : errorColor,
                ),
                YoText.bodySmall(
                  YoDateFormatter.formatDateTime(
                    transaction.createdAt,
                    format: _dateFormat(transaction.createdAt),
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

  String _dateFormat(DateTime date) {
    if (YoDateFormatter.isToday(date)) {
      return "HH:mm";
    } else {
      return "dd MMM yy . HH:mm";
    }
  }
}
