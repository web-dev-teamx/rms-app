// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      projectDetail: json['project_detail'] == null
          ? null
          : ProjectDetail.fromJson(
              json['project_detail'] as Map<String, dynamic>),
      asPId: json['as_p_id'] as String?,
      locationId: json['location_id'] as String?,
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'project_detail': instance.projectDetail?.toJson(),
      'as_p_id': instance.asPId,
      'location_id': instance.locationId,
    };
