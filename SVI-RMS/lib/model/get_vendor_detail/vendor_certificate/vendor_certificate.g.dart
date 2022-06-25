// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorCertificate _$VendorCertificateFromJson(Map<String, dynamic> json) =>
    VendorCertificate(
      vendorId: json['vendor_id'] as String?,
      name: json['name'] as String?,
      certificateFile: json['certificate_file'] as String?,
    );

Map<String, dynamic> _$VendorCertificateToJson(VendorCertificate instance) =>
    <String, dynamic>{
      'vendor_id': instance.vendorId,
      'name': instance.name,
      'certificate_file': instance.certificateFile,
    };
