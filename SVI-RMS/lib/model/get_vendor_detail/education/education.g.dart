// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Education _$EducationFromJson(Map<String, dynamic> json) => Education(
      vendorId: json['vendor_id'] as String?,
      name: json['name'] as String?,
      location: json['location'] as String?,
      educationFile: json['education_file'] as String?,
    );

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
      'vendor_id': instance.vendorId,
      'name': instance.name,
      'location': instance.location,
      'education_file': instance.educationFile,
    };
