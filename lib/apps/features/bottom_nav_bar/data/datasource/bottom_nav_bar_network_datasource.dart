import 'package:dhuwitku/apps/core/network/firebase_collection.dart';
import 'package:dhuwitku/apps/data/model/budget_model.dart';
import 'package:dhuwitku/apps/data/model/budget_response_model.dart';
import 'package:dhuwitku/apps/data/model/category_model.dart';
import 'package:dhuwitku/apps/data/model/summary_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/domain/repositories/bottom_nav_bar_repository.dart';
import 'package:dhuwitku/apps/features/bottom_nav_bar/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:yo_ui/yo_ui.dart';

class BottomNavBarNetworkDatasource implements BottomNavBarRepository {
  // final Dio _dio;

  BottomNavBarNetworkDatasource();

  /// Mendapatkan daftar budget beserta transaksi dan total transaksi
  /// dengan filter optional:
  /// - [uid] - User ID (default: auth.uid)
  /// - [categoryId] - Category ID (optional)
  /// - [startDate] - Tanggal mulai filter (optional)
  /// - [endDate] - Tanggal akhir filter (optional)
  @override
  Future<List<BudgetResponseModel>> getBudgets() async {
    try {
      final userId = auth.uid;

      // Get all budgets for the user
      final budgetRes = await budgetCollection
          .where("uid", isEqualTo: userId)
          .orderBy("createdAt", descending: true)
          .get();

      final budgets = budgetRes.docs
          .map((e) => BudgetModel.fromJson(e.data()))
          .toList();

      // Build response with filtered transactions for each budget
      final result = <BudgetResponseModel>[];

      for (final budget in budgets) {
        // Start with base query for transactions of this budget
        var query = transactionCollection
            .where("uid", isEqualTo: userId)
            .where("categoryId", isEqualTo: budget.categoryId);

        final transRes = await query.get();

        // Convert to list of TransactionModel
        var transactions = transRes.docs
            .map((e) => TransactionModel.fromJson(e.data()))
            .toList();

        // Apply date filters in memory

        transactions = transactions
            .where(
              (t) =>
                  t.date.isAfter(budget.startDate) ||
                  t.date.isAtSameMomentAs(budget.startDate),
            )
            .toList();

        final endOfDay = DateTime(
          budget.endDate.year,
          budget.endDate.month,
          budget.endDate.day,
          23,
          59,
          59,
        );
        transactions = transactions
            .where(
              (t) =>
                  t.date.isBefore(endOfDay) ||
                  t.date.isAtSameMomentAs(endOfDay),
            )
            .toList();

        // Calculate total amount
        final totalAmount = transactions.fold<int>(
          0,
          (sum, t) => sum + t.amount,
        );

        result.add(
          BudgetResponseModel(
            budget: budget,
            transactions: transactions,
            totalTransactions: totalAmount,
          ),
        );
      }

      return result;
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
  Future<SummaryModel> getSummary() async {
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

      return SummaryModel(
        balance: balance,
        balanceLastMonth: balanceLastMonth,
        balanceLastWeek: balanceLastWeek,
        balanceToday: balanceToday,

        income: totalIncome,
        incomeLastMonth: incomeLastMonth,
        incomeLastWeek: incomeLastWeek,
        incomeToday: incomeToday,

        expense: totalExpense,
        expenseLastMonth: expenseLastMonth,
        expenseLastWeek: expenseLastWeek,
        expenseToday: expenseToday,

        countIncome: countIncome,
        countIncomeToday: countIncomeToday,
        countIncomeLastMonth: countIncomeLastMonth,
        countIncomeLastWeek: countIncomeLastWeek,

        countExpense: countExpense,
        countExpenseToday: countExpenseToday,
        countExpenseLastMonth: countExpenseLastMonth,
        countExpenseLastWeek: countExpenseLastWeek,
      );
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
          .orderBy("createdAt", descending: true)
          .get();

      return res.docs.map((e) => TransactionModel.fromJson(e.data())).toList();
    } catch (e, s) {
      YoLogger.error("$e -> $s");
      throw Exception(e);
    }
  }
}
