import 'package:meta/meta.dart';
import 'dart:convert';

GetTechnicianModel getTechnicianModelFromJson(String? str) =>
    GetTechnicianModel.fromJson(json.decode(str!));

String? getTechnicianModelToJson(GetTechnicianModel data) =>
    json.encode(data.toJson());

class GetTechnicianModel {
  GetTechnicianModel({
    @required this.code,
    @required this.status,
    @required this.data,
  });

  final int? code;
  final String? status;
  final List<GetTechnicianData>? data;

  factory GetTechnicianModel.fromJson(Map<String, dynamic> json) =>
      GetTechnicianModel(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null
            ? null
            : List<GetTechnicianData>.from(
                json["data"].map((x) => GetTechnicianData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GetTechnicianData {
  GetTechnicianData({
    @required this.id,
    @required this.firstName,
    @required this.city,
    @required this.country,
    @required this.lastName,
    @required this.emailAddress,
    @required this.vendorTypeId,
    @required this.approved,
    @required this.gtmRejectionComment,
  });

  final String? id;
  final String? firstName;
  final String? city;
  final String? country;
  final String? lastName;
  final String? emailAddress;
  final String? vendorTypeId;
  final String? approved;
  final dynamic gtmRejectionComment;

  factory GetTechnicianData.fromJson(Map<String, dynamic> json) =>
      GetTechnicianData(
        id: json["id"],
        firstName: json["first_name"],
        city: json["city"],
        country: json["country"],
        lastName: json["last_name"],
        emailAddress: json["email_address"],
        vendorTypeId: json["vendor_type_id"],
        approved: json["approved"],
        gtmRejectionComment: json["gtm_rejection_comment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "city": city,
        "country": country,
        "last_name": lastName,
        "email_address": emailAddress,
        "vendor_type_id": vendorTypeId,
        "approved": approved,
        "gtm_rejection_comment": gtmRejectionComment,
      };
}
