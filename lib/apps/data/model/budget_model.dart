import 'package:dhuwitku/apps/data/model/icon_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_model.freezed.dart';
part 'budget_model.g.dart';

@freezed
abstract class BudgetModel with _$BudgetModel {
  const factory BudgetModel({
    required String id,
    required String uid,
    required String name,
    String? description,
    required bool isPrivate,
    required BudgetType type,
    required int amount,
    required IconModel icon,
    String? categoryId,
    int? color,
    required DateTime startDate,
    required DateTime endDate,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BudgetModel;

  factory BudgetModel.fromJson(Map<String, dynamic> json) =>
      _$BudgetModelFromJson(json);
}

enum BudgetType { expense, income }
