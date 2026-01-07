import 'package:dhuwitku/apps/core/network/firebase_collection.dart';
import 'package:dhuwitku/apps/data/model/budget_model.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/domain/repositories/bottom_nav_bar_repository.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:yo_ui/yo_ui.dart';

class BottomNavBarNetworkDatasource implements BottomNavBarRepository {
  // final Dio _dio;

  BottomNavBarNetworkDatasource();

  @override
  Future<List<BudgetModel>> getBudgets() async {
    try {
      final res = await budgetCollection
          .where("uid", isEqualTo: auth.uid)
          .get();

      return res.docs.map((e) => BudgetModel.fromJson(e.data())).toList();
    } catch (e, s) {
      YoLogger.error("$e -> $s");
      throw Exception(e);
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final res = await categoryCollection
          .where("budgetId", isEqualTo: auth.uid)
          .get();

      return res.docs.map((e) => CategoryModel.fromJson(e.data())).toList();
    } catch (e, s) {
      YoLogger.error("$e -> $s");
      throw Exception(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getSummary() async {
    try {
      final transactions = await getTransactions();

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final lastWeek = today.subtract(const Duration(days: 7));
      final lastMonth = DateTime(now.year, now.month - 1, now.day);

      // Filter transactions by type
      final incomeTransactions = transactions
          .where((t) => t.type == TransactionType.income)
          .toList();
      final expenseTransactions = transactions
          .where((t) => t.type == TransactionType.expense)
          .toList();

      // Helper functions
      int sumAmount(List<TransactionModel> list) =>
          list.fold(0, (sum, t) => sum + t.amount);

      List<TransactionModel> filterByDate(
        List<TransactionModel> list,
        DateTime from,
      ) => list
          .where((t) => t.date.isAfter(from) || t.date.isAtSameMomentAs(from))
          .toList();

      List<TransactionModel> filterToday(List<TransactionModel> list) => list
          .where(
            (t) =>
                t.date.year == today.year &&
                t.date.month == today.month &&
                t.date.day == today.day,
          )
          .toList();

      // Calculate totals
      final totalIncome = sumAmount(incomeTransactions);
      final totalExpense = sumAmount(expenseTransactions);
      final balance = totalIncome - totalExpense;

      // Income by period
      final incomeToday = sumAmount(filterToday(incomeTransactions));
      final incomeLastWeek = sumAmount(
        filterByDate(incomeTransactions, lastWeek),
      );
      final incomeLastMonth = sumAmount(
        filterByDate(incomeTransactions, lastMonth),
      );

      // Expense by period
      final expenseToday = sumAmount(filterToday(expenseTransactions));
      final expenseLastWeek = sumAmount(
        filterByDate(expenseTransactions, lastWeek),
      );
      final expenseLastMonth = sumAmount(
        filterByDate(expenseTransactions, lastMonth),
      );

      // Balance by period
      final balanceToday = incomeToday - expenseToday;
      final balanceLastWeek = incomeLastWeek - expenseLastWeek;
      final balanceLastMonth = incomeLastMonth - expenseLastMonth;

      // Count income
      final countIncome = incomeTransactions.length;
      final countIncomeToday = filterToday(incomeTransactions).length;
      final countIncomeLastWeek = filterByDate(
        incomeTransactions,
        lastWeek,
      ).length;
      final countIncomeLastMonth = filterByDate(
        incomeTransactions,
        lastMonth,
      ).length;

      // Count expense
      final countExpense = expenseTransactions.length;
      final countExpenseToday = filterToday(expenseTransactions).length;
      final countExpenseLastWeek = filterByDate(
        expenseTransactions,
        lastWeek,
      ).length;
      final countExpenseLastMonth = filterByDate(
        expenseTransactions,
        lastMonth,
      ).length;

      return {
        "balance": balance,
        "balance_last_month": balanceLastMonth,
        "balance_last_week": balanceLastWeek,
        "balance_today": balanceToday,

        "income": totalIncome,
        "income_last_month": incomeLastMonth,
        "income_last_week": incomeLastWeek,
        "income_today": incomeToday,

        "expense": totalExpense,
        "expense_last_month": expenseLastMonth,
        "expense_last_week": expenseLastWeek,
        "expense_today": expenseToday,

        "count_income": countIncome,
        "count_income_today": countIncomeToday,
        "count_income_last_month": countIncomeLastMonth,
        "count_income_last_week": countIncomeLastWeek,

        "count_expense": countExpense,
        "count_expense_today": countExpenseToday,
        "count_expense_last_month": countExpenseLastMonth,
        "count_expense_last_week": countExpenseLastWeek,
      };
    } catch (e, s) {
      YoLogger.error("$e -> $s");
      throw Exception(e);
    }
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    try {
      final res = await transactionCollection
          .where("uid", isEqualTo: auth.uid)
          .get();

      return res.docs.map((e) => TransactionModel.fromJson(e.data())).toList();
    } catch (e, s) {
      YoLogger.error("$e -> $s");
      throw Exception(e);
    }
  }
}
