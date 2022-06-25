// To parse this JSON data, do
//
//     final getComplaintModel = getComplaintModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetComplaintModel getComplaintModelFromJson(String? str) =>
    GetComplaintModel.fromJson(json.decode(str!));

String? getComplaintModelToJson(GetComplaintModel data) =>
    json.encode(data.toJson());

class GetComplaintModel {
  GetComplaintModel({
    @required this.code,
    @required this.status,
    @required this.data,
  });

  final int? code;
  final String? status;
  final List<GetComplaints>? data;

  factory GetComplaintModel.fromJson(Map<String, dynamic> json) =>
      GetComplaintModel(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null
            ? null
            : List<GetComplaints>.from(
                json["data"].map((x) => GetComplaints.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GetComplaints {
  GetComplaints({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.status,
    @required this.comment,
    @required this.addedBy,
    @required this.addedDate,
  });

  final String? id;
  final String? title;
  final String? description;
  final String? image;
  final String? status;
  final String? comment;
  final String? addedBy;
  final String? addedDate;

  factory GetComplaints.fromJson(Map<String, dynamic> json) => GetComplaints(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      image: json["image"],
      status: json["status"],
      comment: json["comment"],
      addedBy: json["added_by"],
      addedDate: json["added_date"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "status": status,
        "comment": comment,
        "added_by": addedBy,
        "added_date": addedDate,
      };
}
