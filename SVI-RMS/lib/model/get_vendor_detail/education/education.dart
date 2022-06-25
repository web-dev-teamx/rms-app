import 'package:json_annotation/json_annotation.dart';
part 'education.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Education {
  Education({
    required this.vendorId,
    required this.name,
    required this.location,
    required this.educationFile,
  });
  final String? vendorId;
  final String? name;
  final String? location;
  final String? educationFile;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);
}
