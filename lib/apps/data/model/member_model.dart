import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_model.freezed.dart';
part 'member_model.g.dart';

enum MemberRole { admin, member, pending }

@freezed
abstract class MemberModel with _$MemberModel {
  const factory MemberModel({
    required String id,
    required String name,
    required String budgetId,
    required String uid,
    required DateTime createdAt,
    required DateTime joinedAt,
  }) = _MemberModel;

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);
}
