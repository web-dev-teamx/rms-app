// To parse this JSON data, do
//
//     final futureIntrestedModel = futureIntrestedModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FutureIntrestedModel futureIntrestedModelFromMap(String? str) =>
    FutureIntrestedModel.fromMap(json.decode(str!));

String? futureIntrestedModelToMap(FutureIntrestedModel data) =>
    json.encode(data.toMap());

class FutureIntrestedModel {
  FutureIntrestedModel({
    @required this.code,
    @required this.status,
    @required this.data,
  });

  final int? code;
  final String? status;
  final List<Datum>? data;

  factory FutureIntrestedModel.fromMap(Map<String, dynamic> json) =>
      FutureIntrestedModel(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    @required this.projectId,
    @required this.asPId,
    @required this.projectName,
    @required this.postedDate,
    @required this.description,
    @required this.category,
    @required this.location,
    @required this.skills,
    @required this.tools,
    @required this.startDateTime,
    @required this.endDateTime,
    @required this.currencyUnit,
    @required this.minBudget,
    @required this.maxBudget,
    @required this.duration,
  });

  final String? projectId;
  final String? asPId;
  final String? projectName;
  final DateTime? postedDate;
  final String? description;
  final String? category;
  final String? location;
  final String? skills;
  final String? tools;
  final String? startDateTime;
  final String? endDateTime;
  final String? currencyUnit;
  final String? minBudget;
  final String? maxBudget;
  final String? duration;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        projectId: json["project_id"],
        asPId: json["as_p_id"],
        projectName: json["project_name"],
        postedDate: json["posted_date"] == null
            ? null
            : DateTime.parse(json["posted_date"]),
        description: json["description"],
        category: json["category"],
        location: json["location"],
        skills: json["skills"],
        tools: json["tools"],
        startDateTime: json["start_date_time"],
        endDateTime: json["end_date_time"],
        currencyUnit: json["currency_unit"],
        minBudget: json["min_budget"],
        maxBudget: json["max_budget"],
        duration: json["duration"],
      );

  Map<String, dynamic> toMap() => {
        "project_id": projectId,
        "as_p_id": asPId,
        "project_name": projectName,
        "posted_date": postedDate,
        "description": description,
        "category": category,
        "location": location,
        "skills": skills,
        "tools": tools,
        "start_date_time": startDateTime,
        "end_date_time": endDateTime,
        "currency_unit": currencyUnit,
        "min_budget": minBudget,
        "max_budget": maxBudget,
        "duration": duration,
      };
}
