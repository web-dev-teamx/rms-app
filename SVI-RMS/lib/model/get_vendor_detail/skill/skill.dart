import 'package:json_annotation/json_annotation.dart';
part 'skill.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Skill {
  Skill({
    required this.vendorId,
    required this.name,
    required this.description,
    required this.skillLevel,
  });
  final String? vendorId;
  final String? name;
  final String? description;
  final String? skillLevel;

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  Map<String, dynamic> toJson() => _$SkillToJson(this);
}
