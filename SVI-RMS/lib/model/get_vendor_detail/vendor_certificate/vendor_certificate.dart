import 'package:json_annotation/json_annotation.dart';
part 'vendor_certificate.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class VendorCertificate {
  VendorCertificate({
    required this.vendorId,
    required this.name,
    required this.certificateFile,
  });
  final String? vendorId;
  final String? name;
  final String? certificateFile;

   factory VendorCertificate.fromJson(Map<String, dynamic> json) =>
      _$VendorCertificateFromJson(json);

  Map<String, dynamic> toJson() => _$VendorCertificateToJson(this);
}


