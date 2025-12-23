import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_model.freezed.dart';
part 'activity_model.g.dart';

enum ActivityType {
  createWorkspace,
  memberJoin,
  memberAddTransaction,
  memberEditTransaction,
  memberDeleteTransaction,
  memberAddBudget,
  memberEditBudget,
  memberDeleteBudget,
  memberLeaveWorkspace,
  updateWorkspace,
}

@freezed
abstract class ActivityModel with _$ActivityModel {
  const factory ActivityModel({
    required String id,
    required String workspaceId,
    required String uid,
    required ActivityType type,
    required DateTime createdAt,
  }) = _ActivityModel;

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);
}
