// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Skill _$SkillFromJson(Map<String, dynamic> json) => Skill(
      vendorId: json['vendor_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      skillLevel: json['skill_level'] as String?,
    );

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'vendor_id': instance.vendorId,
      'name': instance.name,
      'description': instance.description,
      'skill_level': instance.skillLevel,
    };
