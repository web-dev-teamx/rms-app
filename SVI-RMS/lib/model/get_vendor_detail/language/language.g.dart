// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      vendorId: json['vendor_id'] as String?,
      name: json['name'] as String?,
      languageLevel: json['language_level'] as String?,
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'vendor_id': instance.vendorId,
      'name': instance.name,
      'language_level': instance.languageLevel,
    };
