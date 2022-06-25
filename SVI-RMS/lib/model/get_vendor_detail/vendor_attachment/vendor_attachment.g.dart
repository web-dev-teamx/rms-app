// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorAttachment _$VendorAttachmentFromJson(Map<String, dynamic> json) =>
    VendorAttachment(
      vendorId: json['vendor_id'] as String?,
      name: json['name'] as String?,
      attachmentFile: json['attachment_file'] as String?,
    );

Map<String, dynamic> _$VendorAttachmentToJson(VendorAttachment instance) =>
    <String, dynamic>{
      'vendor_id': instance.vendorId,
      'name': instance.name,
      'attachment_file': instance.attachmentFile,
    };
