import 'package:json_annotation/json_annotation.dart';
part 'coverage_area.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CoverageArea {
  CoverageArea({
    required this.vendorId,
    required this.city,
    required this.country,
  });
  final String? vendorId;
  final String? city;
  final String? country;

  factory CoverageArea.fromJson(Map<String, dynamic> json) =>
      _$CoverageAreaFromJson(json);

  Map<String, dynamic> toJson() => _$CoverageAreaToJson(this);
}
