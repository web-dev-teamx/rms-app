import 'bank_detail/bank_detail.dart';
import 'basic_info/basic_info.dart';
import 'coverage_area/coverage_area.dart';
import 'education/education.dart';
import 'language/language.dart';
import 'skill/skill.dart';
import 'tool/tool.dart';
import 'vendor_attachment/vendor_attachment.dart';
import 'vendor_certificate/vendor_certificate.dart';

import 'package:json_annotation/json_annotation.dart';
part 'vendor_details.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class VendorDetails {
  VendorDetails({
    required this.basicInfo,
    required this.vendorAttachments,
    required this.bankDetails,
    required this.certificates,
    required this.coverageAreas,
    required this.educations,
    required this.languages,
    required this.rates,
    required this.skills,
    required this.tools,
  });
  BasicInfo? basicInfo;
  final List<VendorAttachment?> vendorAttachments;
  final List<BankDetail?> bankDetails;
  final List<VendorCertificate?> certificates;
  final List<CoverageArea?> coverageAreas;
  final List<Education?> educations;
  final List<Language?> languages;
  final List<dynamic> rates;
  final List<Skill?> skills;
  final List<Tool?> tools;

  factory VendorDetails.fromJson(Map<String, dynamic> json) =>
      _$VendorDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$VendorDetailsToJson(this);
}
