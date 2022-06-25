// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tool _$ToolFromJson(Map<String, dynamic> json) => Tool(
      vendorId: json['vendor_id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ToolToJson(Tool instance) => <String, dynamic>{
      'vendor_id': instance.vendorId,
      'name': instance.name,
      'image': instance.image,
    };
