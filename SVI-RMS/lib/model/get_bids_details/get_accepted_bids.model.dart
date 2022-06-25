// To parse this JSON data, do
//
//     final acceptedBidsModel = acceptedBidsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AcceptedBidsModel acceptedBidsModelFromJson(String? str) =>
    AcceptedBidsModel.fromJson(json.decode(str!));

String? acceptedBidsModelToJson(AcceptedBidsModel data) =>
    json.encode(data.toJson());

class AcceptedBidsModel {
  AcceptedBidsModel({
    @required this.code,
    @required this.status,
    @required this.data,
  });

  final int? code;
  final String? status;
  final List<AcceptedBids>? data;

  factory AcceptedBidsModel.fromJson(Map<String, dynamic> json) =>
      AcceptedBidsModel(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null
            ? null
            : List<AcceptedBids>.from(
                json["data"].map((x) => AcceptedBids.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AcceptedBids {
  AcceptedBids({
    @required this.id,
    @required this.detailId,
    @required this.projectName,
    @required this.projectLocation,
    @required this.consultantDetail,
    @required this.callOutRate,
    @required this.travelExpense,
    @required this.purchaseExpense,
    @required this.paymentType,
    @required this.technicianChargesPercentage,
    @required this.providerChargesPercentage,
    @required this.description,
    @required this.bidDate,
    @required this.status,
    @required this.bidStatus,
  });

  final String? id;
  final String? detailId;
  final String? projectName;
  final String? projectLocation;
  final String? consultantDetail;
  final String? callOutRate;
  final String? travelExpense;
  final String? purchaseExpense;
  final String? paymentType;
  final String? technicianChargesPercentage;
  final String? providerChargesPercentage;
  final String? description;
  final DateTime? bidDate;
  final String? status;
  final String? bidStatus;

  factory AcceptedBids.fromJson(Map<String, dynamic> json) => AcceptedBids(
        id: json["id"],
        detailId: json["detail_id"],
        projectName: json["project_name"],
        projectLocation: json["project_location"],
        consultantDetail: json["consultant_detail"],
        callOutRate: json["call_out_rate"],
        travelExpense: json["travel_expense"],
        purchaseExpense: json["purchase_expense"],
        paymentType: json["payment_type"],
        technicianChargesPercentage: json["technician_charges_percentage"],
        providerChargesPercentage: json["provider_charges_percentage"],
        description: json["description"],
        bidDate:
            json["bid_date"] == null ? null : DateTime.parse(json["bid_date"]),
        status: json["status"],
        bidStatus: json["bid_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "detail_id": detailId,
        "project_name": projectName,
        "project_location": projectLocation,
        "consultant_detail": consultantDetail,
        "call_out_rate": callOutRate,
        "travel_expense": travelExpense,
        "purchase_expense": purchaseExpense,
        "payment_type": paymentType,
        "technician_charges_percentage": technicianChargesPercentage,
        "provider_charges_percentage": providerChargesPercentage,
        "description": description,
        "bid_date": bidDate,
        "status": status,
        "bid_status": bidStatus,
      };
}
