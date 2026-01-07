import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/icon_model.dart';
import 'package:dhuwitku/apps/themes/colors.dart';
import 'package:icons_plus/icons_plus.dart';

final defaultExpenseCategories = [
  CategoryModel(
    id: 'expense_default',
    budgetId: "all",
    name: 'Default Expense',
    type: CategoryType.expense,
    icon: IconModel(
      codePoint: Iconsax.money_send_outline.codePoint,
      fontFamily: Iconsax.money_send_outline.fontFamily,
      fontPackage: Iconsax.money_send_outline.fontPackage,
    ),
    color: gray400.toARGB32(),
    createdAt: DateTime.now(),
  ),
];
final defaultIncomeCategories = [
  CategoryModel(
    id: 'income_default',
    budgetId: "all",
    name: 'Default Income',
    type: CategoryType.income,
    icon: IconModel(
      codePoint: Iconsax.money_recive_outline.codePoint,
      fontFamily: Iconsax.money_recive_outline.fontFamily,
      fontPackage: Iconsax.money_recive_outline.fontPackage,
    ),
    color: gray400.toARGB32(),
    createdAt: DateTime.now(),
  ),
];
