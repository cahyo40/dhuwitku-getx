import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace_model.freezed.dart';
part 'workspace_model.g.dart';

enum WorkspaceType { personal, shared }

@freezed
abstract class WorkspaceModel with _$WorkspaceModel {
  const factory WorkspaceModel({
    required String id,
    required String name,
    required WorkspaceType type,
    required String uid,
    String? description,
    String? currency,
    String? imageUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _WorkspaceModel;

  factory WorkspaceModel.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceModelFromJson(json);
}
