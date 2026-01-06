import 'package:freezed_annotation/freezed_annotation.dart';

part 'icon_model.freezed.dart';
part 'icon_model.g.dart';

@freezed
abstract class IconModel with _$IconModel {
  const factory IconModel({
    @JsonKey(name: 'code_point') required int codePoint,
    @JsonKey(name: 'font_family') String? fontFamily,
    @JsonKey(name: 'font_package') String? fontPackage,
  }) = _IconModel;

  factory IconModel.fromJson(Map<String, dynamic> json) =>
      _$IconModelFromJson(json);
}
