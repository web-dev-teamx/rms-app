// To parse this JSON data, do
//
//     final fileComplaintModel = fileComplaintModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FileComplaintModel fileComplaintModelFromJson(String? str) =>
    FileComplaintModel.fromJson(json.decode(str!));

String fileComplaintModelToJson(FileComplaintModel data) =>
    json.encode(data.toJson());

class FileComplaintModel {
  FileComplaintModel({
    @required this.code,
    @required this.status,
    @required this.message,
  });

  final int? code;
  final String? status;
  final String? message;

  factory FileComplaintModel.fromJson(Map<String, dynamic> json) =>
      FileComplaintModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
