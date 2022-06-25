import 'package:meta/meta.dart';
import 'dart:convert';

GetTechnicianBidModel getTechnicianBidModelFromMap(String? str) =>
    GetTechnicianBidModel.fromJson(json.decode(str!));

String? getTechnicianBidModelToMap(GetTechnicianBidModel data) =>
    json.encode(data.toJson());

class GetTechnicianBidModel {
  GetTechnicianBidModel({
    @required this.code,
    @required this.status,
    @required this.data,
  });

  final int? code;
  final String? status;
  final List<TechnicainData>? data;

  factory GetTechnicianBidModel.fromJson(Map<String?, dynamic> json) =>
      GetTechnicianBidModel(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null
            ? null
            : List<TechnicainData>.from(
                json["data"].map((x) => TechnicainData.fromMap(x))),
      );

  Map<String?, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class TechnicainData {
  TechnicainData({
    @required this.id,
    @required this.detailId,
    @required this.projectName,
    @required this.projectLocation,
    @required this.bookingType,
    @required this.consultantDetail,
    @required this.callOutRate,
    @required this.travelExpense,
    @required this.purchaseExpense,
    @required this.paymentType,
    @required this.providerServiceChargesPercentage,
    @required this.technicianServiceChargesPercentage,
    @required this.bidDate,
    @required this.description,
    @required this.status,
  });

  final String? id;
  final String? detailId;
  final String? projectName;
  final String? projectLocation;
  final String? bookingType;
  final String? consultantDetail;
  final String? callOutRate;
  final String? travelExpense;
  final String? purchaseExpense;
  final String? paymentType;
  final String? providerServiceChargesPercentage;
  final String? technicianServiceChargesPercentage;
  final DateTime? bidDate;
  final String? description;
  final String? status;

  factory TechnicainData.fromMap(Map<String?, dynamic> json) => TechnicainData(
        id: json["id"],
        detailId: json["detail_id"],
        projectName: json["project_name"],
        projectLocation: json["project_location"],
        bookingType: json["booking_type"],
        consultantDetail: json["consultant_detail"],
        callOutRate: json["call_out_rate"],
        travelExpense: json["travel_expense"],
        purchaseExpense: json["purchase_expense"],
        paymentType: json["payment_type"],
        providerServiceChargesPercentage:
            json["provider_service_charges_percentage"],
        technicianServiceChargesPercentage:
            json["technician_service_charges_percentage"],
        bidDate:
            json["bid_date"] == null ? null : DateTime.parse(json["bid_date"]),
        description: json["description"],
        status: json["status"],
      );

  Map<String?, dynamic> toMap() => {
        "id": id,
        "detail_id": detailId,
        "project_name": projectName,
        "project_location": projectLocation,
        "booking_type": bookingType,
        "consultant_detail": consultantDetail,
        "call_out_rate": callOutRate,
        "travel_expense": travelExpense,
        "purchase_expense": purchaseExpense,
        "payment_type": paymentType,
        "provider_service_charges_percentage": providerServiceChargesPercentage,
        "technician_service_charges_percentage":
            technicianServiceChargesPercentage,
        "bid_date": bidDate == null,
        "description": description,
        "status": status,
      };
}
