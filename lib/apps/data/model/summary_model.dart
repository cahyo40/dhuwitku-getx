import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_model.freezed.dart';
part 'summary_model.g.dart';

@freezed
abstract class SummaryModel with _$SummaryModel {
  const factory SummaryModel({
    // Balance
    @Default(0) int balance,
    @Default(0) int balanceLastMonth,
    @Default(0) int balanceLastWeek,
    @Default(0) int balanceToday,

    // Income
    @Default(0) int income,
    @Default(0) int incomeLastMonth,
    @Default(0) int incomeLastWeek,
    @Default(0) int incomeToday,

    // Expense
    @Default(0) int expense,
    @Default(0) int expenseLastMonth,
    @Default(0) int expenseLastWeek,
    @Default(0) int expenseToday,

    // Count Income
    @Default(0) int countIncome,
    @Default(0) int countIncomeToday,
    @Default(0) int countIncomeLastMonth,
    @Default(0) int countIncomeLastWeek,

    // Count Expense
    @Default(0) int countExpense,
    @Default(0) int countExpenseToday,
    @Default(0) int countExpenseLastMonth,
    @Default(0) int countExpenseLastWeek,
  }) = _SummaryModel;

  factory SummaryModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryModelFromJson(json);
}
