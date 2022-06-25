import 'package:json_annotation/json_annotation.dart';
part 'vendor_attachment.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VendorAttachment {
  VendorAttachment({
    required this.vendorId,
    required this.name,
    required this.attachmentFile,
  });
  final String? vendorId;
  final String? name;
  final String? attachmentFile;

  factory VendorAttachment.fromJson(Map<String, dynamic> json) =>
      _$VendorAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$VendorAttachmentToJson(this);
}
