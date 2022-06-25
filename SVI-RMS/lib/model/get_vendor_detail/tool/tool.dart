import 'package:json_annotation/json_annotation.dart';
part 'tool.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Tool {
  Tool({
    required this.vendorId,
    required this.name,
    required this.image,
  });
  final String? vendorId;
  final String? name;
  final String? image;

    factory Tool.fromJson(Map<String, dynamic> json) => _$ToolFromJson(json);

  Map<String, dynamic> toJson() => _$ToolToJson(this);
}
