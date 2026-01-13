import 'package:dhuwitku/apps/data/model/budget_model.dart';
import 'package:dhuwitku/apps/data/model/transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_response_model.freezed.dart';
part 'budget_response_model.g.dart';

@freezed
abstract class BudgetResponseModel with _$BudgetResponseModel {
  const factory BudgetResponseModel({
    required BudgetModel budget,
    required int totalTransactions,
    required List<TransactionModel> transactions,
  }) = _BudgetResponseModel;

  factory BudgetResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BudgetResponseModelFromJson(json);
}
