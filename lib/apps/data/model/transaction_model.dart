import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

enum TransactionType { expense, income }

@freezed
abstract class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String id,
    required String uid,
    required String categoryId,
    required String budgetId,
    required String name,
    required int amount,
    required DateTime date,
    String? description,
    required DateTime createdAt,
    required DateTime updatedAt,
    required TransactionType type,
    List<String>? tag,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}
