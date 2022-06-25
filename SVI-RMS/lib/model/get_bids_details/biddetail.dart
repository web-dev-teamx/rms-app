// To parse this JSON Detaildata, do
//
//     final bidDetailModel = bidDetailModelFromMap(jsonString);

import 'dart:convert';

BidDetailModel bidDetailModelFromMap(String? str) =>
    BidDetailModel.fromMap(json.decode(str!));

String? bidDetailModelToMap(BidDetailModel data) => json.encode(data.toMap());

class BidDetailModel {
  BidDetailModel({
    this.code,
    this.status,
    this.data,
  });

  final int? code;
  final String? status;
  final Detaildata? data;

  factory BidDetailModel.fromMap(Map<String, dynamic> json) => BidDetailModel(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null ? null : Detaildata.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "data": data == null ? null : data!.toMap(),
      };
}

class Detaildata {
  Detaildata({
    this.projectBookingtype,
    this.pdBtAr,
    this.projectName,
    this.projectId,
    this.projectCategory,
    this.projectType,
    this.projectSkills,
    this.projectStartDatetime,
    this.projectEndDatetime,
    this.projectLocation,
    this.projectTools,
    this.projectNoOfFe,
    this.bidPaymenttype,
    this.paymentType,
    this.fPt,
    this.cvFile,
    this.techName,
    this.month,
    this.rate,
    this.fCor,
    this.vendorTypeId,
    this.fEhr,
    this.percFRcsc,
    this.percFRcicsc,
    this.fTeAbc,
    this.fTeAbcRate,
    this.fPeAbc,
    this.fPeAbcRate,
    this.cet,
    this.rc,
    this.projectLanguages,
    this.description,
    this.bidId,
    this.detailId,
    this.deliverables,
  });

  final String? projectBookingtype;
  final String? pdBtAr;
  final String? projectName;
  final String? projectId;
  final String? projectCategory;
  final String? projectType;
  final String? projectSkills;
  final String? projectStartDatetime;
  final String? projectEndDatetime;
  final String? projectLocation;
  final String? projectTools;
  final String? projectNoOfFe;
  final String? bidPaymenttype;
  final String? paymentType;
  final String? fPt;
  final String? cvFile;
  final String? techName;
  final String? month;
  final String? rate;
  final String? fCor;
  final String? vendorTypeId;
  final String? fEhr;
  final String? percFRcsc;
  final String? percFRcicsc;
  final String? fTeAbc;
  final String? fTeAbcRate;
  final String? fPeAbc;
  final String? fPeAbcRate;
  final String? cet;
  final String? rc;
  final String? projectLanguages;
  final String? description;
  final String? bidId;
  final String? detailId;
  final String? deliverables;

  factory Detaildata.fromMap(Map<String, dynamic> json) => Detaildata(
        projectBookingtype: json["project_bookingtype"],
        pdBtAr: json["pd_bt_ar"],
        projectName: json["project_name"],
        projectId: json["project_id"],
        projectCategory: json["project_category"],
        projectType: json["project_type"],
        projectSkills: json["project_skills"],
        projectStartDatetime: json["project_start_datetime"],
        projectEndDatetime: json["project_end_datetime"],
        projectLocation: json["project_location"],
        projectTools: json["project_tools"],
        projectNoOfFe: json["project_no_of_fe"],
        bidPaymenttype: json["bid_paymenttype"],
        paymentType: json["payment_type"],
        fPt: json["f_pt"],
        cvFile: json["cv_file"],
        techName: json["tech_name"],
        month: json["month"],
        rate: json["rate"],
        fCor: json["f_cor"],
        vendorTypeId: json["vendor_type_id"],
        fEhr: json["f_ehr"],
        percFRcsc: json["perc_f_rcsc"],
        percFRcicsc: json["perc_f_rcicsc"],
        fTeAbc: json["f_te_abc"],
        fTeAbcRate: json["f_te_abc_rate"],
        fPeAbc: json["f_pe_abc"],
        fPeAbcRate: json["f_pe_abc_rate"],
        cet: json["cet"],
        rc: json["rc"],
        projectLanguages: json["project_languages"],
        description: json["description"],
        bidId: json["bid_id"],
        detailId: json["detail_id"],
        deliverables: json["deliverables"],
      );

  Map<String, dynamic> toMap() => {
        "project_bookingtype": projectBookingtype,
        "pd_bt_ar": pdBtAr,
        "project_name": projectName,
        "project_id": projectId,
        "project_category": projectCategory,
        "project_type": projectType,
        "project_skills": projectSkills,
        "project_start_datetime": projectStartDatetime,
        "project_end_datetime": projectEndDatetime,
        "project_location": projectLocation,
        "project_tools": projectTools,
        "project_no_of_fe": projectNoOfFe,
        "bid_paymenttype": bidPaymenttype,
        "payment_type": paymentType,
        "f_pt": fPt,
        "cv_file": cvFile,
        "tech_name": techName,
        "month": month,
        "rate": rate,
        "f_cor": fCor,
        "vendor_type_id": vendorTypeId,
        "f_ehr": fEhr,
        "perc_f_rcsc": percFRcsc,
        "perc_f_rcicsc": percFRcicsc,
        "f_te_abc": fTeAbc,
        "f_te_abc_rate": fTeAbcRate,
        "f_pe_abc": fPeAbc,
        "f_pe_abc_rate": fPeAbcRate,
        "cet": cet,
        "rc": rc,
        "project_languages": projectLanguages,
        "description": description,
        "bid_id": bidId,
        "detail_id": detailId,
        "deliverables": deliverables,
      };
}
