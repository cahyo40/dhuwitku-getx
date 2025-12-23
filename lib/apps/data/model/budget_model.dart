import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_model.freezed.dart';
part 'budget_model.g.dart';

enum BudgetType { expense, income }

@freezed
abstract class BudgetModel with _$BudgetModel {
  const factory BudgetModel({
    required String id,
    required String name,
    required String workspaceId,
    required String uid,
    required BudgetType type,
    String? description,
    required String amount,
    required String categoryId,
    required DateTime startDate,
    required DateTime endDate,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BudgetModel;

  factory BudgetModel.fromJson(Map<String, dynamic> json) =>
      _$BudgetModelFromJson(json);
}
