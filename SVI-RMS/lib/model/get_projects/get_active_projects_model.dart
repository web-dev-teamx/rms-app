import 'package:meta/meta.dart';
import 'dart:convert';

GetActiveProjectModel getActiveProjectModelFromJson(String? str) =>
    GetActiveProjectModel.fromJson(json.decode(str!));

String? getActiveProjectModelToJson(GetActiveProjectModel data) =>
    json.encode(data.toJson());

class GetActiveProjectModel {
  GetActiveProjectModel({
    @required this.code,
    @required this.status,
    @required this.data,
  });

  final int? code;
  final String? status;
  final List<ActiveProjectData>? data;

  factory GetActiveProjectModel.fromJson(Map<String, dynamic> json) =>
      GetActiveProjectModel(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null
            ? null
            : List<ActiveProjectData>.from(
                json["data"].map((x) => ActiveProjectData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ActiveProjectData {
  ActiveProjectData({
    @required this.projectId,
    @required this.asPId,
    @required this.totalNewDeliverables,
    @required this.projectName,
    @required this.projectLocation,
    @required this.startDateTime,
    @required this.endDateTime,
    @required this.bookingType,
    @required this.consultantDetail,
    @required this.callOutRate,
    @required this.travelExpense,
    @required this.purchaseExpense,
    @required this.paymentType,
    @required this.providerServiceChargesPercentage,
    @required this.technicianServiceChargesPercentage,
    @required this.description,
    @required this.bidDate,
    @required this.status,
  });

  final String? projectId;
  final String? asPId;
  final String? totalNewDeliverables;
  final String? projectName;
  final String? projectLocation;
  final String? startDateTime;
  final String? endDateTime;
  final String? bookingType;
  final String? consultantDetail;
  final String? callOutRate;
  final String? travelExpense;
  final String? purchaseExpense;
  final String? paymentType;
  final String? providerServiceChargesPercentage;
  final String? technicianServiceChargesPercentage;
  final String? description;
  final DateTime? bidDate;
  final String? status;

  factory ActiveProjectData.fromJson(Map<String, dynamic> json) =>
      ActiveProjectData(
        projectId: json["project_id"],
        asPId: json["as_p_id"],
        totalNewDeliverables: json["total_new_deliverables"],
        projectName: json["project_name"],
        projectLocation: json["project_location"],
        startDateTime: json["start_date_time"],
        endDateTime: json["end_date_time"],
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
        description: json["description"],
        bidDate:
            json["bid_date"] == null ? null : DateTime.parse(json["bid_date"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "project_id": projectId,
        "as_p_id": asPId,
        "total_new_deliverables": totalNewDeliverables,
        "project_name": projectName,
        "project_location": projectLocation,
        "start_date_time": startDateTime,
        "end_date_time": endDateTime,
        "booking_type": bookingType,
        "consultant_detail": consultantDetail,
        "call_out_rate": callOutRate,
        "travel_expense": travelExpense,
        "purchase_expense": purchaseExpense,
        "payment_type": paymentType,
        "provider_service_charges_percentage": providerServiceChargesPercentage,
        "technician_service_charges_percentage":
            technicianServiceChargesPercentage,
        "description": description,
        "bid_date": bidDate == null,
        "status": status,
      };
}
