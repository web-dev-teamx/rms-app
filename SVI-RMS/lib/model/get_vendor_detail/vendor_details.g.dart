// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorDetails _$VendorDetailsFromJson(Map<String, dynamic> json) => VendorDetails(
    basicInfo: json['basic_info'] == null
        ? null
        : BasicInfo.fromJson(json['basic_info'] as Map<String, dynamic>),
    vendorAttachments: json['vendor_attachments'] != null
        ? (json['vendor_attachments'] as List<dynamic>)
            .map((e) => e == null
                ? null
                : VendorAttachment.fromJson(e as Map<String, dynamic>))
            .toList()
        : [],
    bankDetails: json['bank_details'] != null
        ? (json['bank_details'] as List<dynamic>)
            .map((e) => e == null
                ? null
                : BankDetail.fromJson(e as Map<String, dynamic>))
            .toList()
        : [],
    certificates: json['certificates'] != null
        ? (json['certificates'] as List<dynamic>)
            .map((e) => e == null
                ? null
                : VendorCertificate.fromJson(e as Map<String, dynamic>))
            .toList()
        : [],
    coverageAreas: json['coverage_areas'] != null
        ? (json['coverage_areas'] as List<dynamic>)
            .map((e) => e == null
                ? null
                : CoverageArea.fromJson(e as Map<String, dynamic>))
            .toList()
        : [],
    educations: json['educations'] != null
        ? (json['educations'] as List<dynamic>)
            .map((e) => e == null ? null : Education.fromJson(e as Map<String, dynamic>))
            .toList()
        : [],
    languages: json['languages'] != null ? (json['languages'] as List<dynamic>).map((e) => e == null ? null : Language.fromJson(e as Map<String, dynamic>)).toList() : [],
    rates: json['rates'] != null ? (json['rates'] as List<dynamic>).map((e) => e == null ? null : Language.fromJson(e as Map<String, dynamic>)).toList() : [],
    skills: json['skills'] != null ? (json['skills'] as List<dynamic>).map((e) => e == null ? null : Skill.fromJson(e as Map<String, dynamic>)).toList() : [],
    tools: json['tools'] != null ? (json['tools'] as List<dynamic>).map((e) => e == null ? null : Tool.fromJson(e as Map<String, dynamic>)).toList() : []);

Map<String, dynamic> _$VendorDetailsToJson(VendorDetails instance) =>
    <String, dynamic>{
      'basic_info': instance.basicInfo?.toJson(),
      'vendor_attachments':
          instance.vendorAttachments.map((e) => e?.toJson()).toList(),
      'bank_details': instance.bankDetails.map((e) => e?.toJson()).toList(),
      'certificates': instance.certificates.map((e) => e?.toJson()).toList(),
      'coverage_areas': instance.coverageAreas.map((e) => e?.toJson()).toList(),
      'educations': instance.educations.map((e) => e?.toJson()).toList(),
      'languages': instance.languages.map((e) => e?.toJson()).toList(),
      'rates': instance.rates,
      'skills': instance.skills.map((e) => e?.toJson()).toList(),
      'tools': instance.tools.map((e) => e?.toJson()).toList(),
    };
