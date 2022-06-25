import './project_details/project_details.dart';

import 'package:json_annotation/json_annotation.dart';
part 'project.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Project {
  final ProjectDetail? projectDetail;
  final String? asPId;
  final String? locationId;

  Project({
    required this.projectDetail,
    required this.asPId,
    required this.locationId,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
