import 'dart:convert';

GetCompanyDetail getCompanyDetailFromJson(String str) =>
    GetCompanyDetail.fromJson(json.decode(str));

String getCompanyDetailToJson(GetCompanyDetail data) =>
    json.encode(data.toJson());

class GetCompanyDetail {
  GetCompanyDetail({
    required this.basicInfo,
    required this.companyAttachments,
    required this.certificates,
    required this.escalations,
    required this.coverageAreas,
  });

  BasicInfo? basicInfo;
  List<dynamic>? companyAttachments;
  List<Certificate>? certificates;
  List<Escalation>? escalations;
  List<dynamic>? coverageAreas;

  factory GetCompanyDetail.fromJson(Map<String, dynamic> json) =>
      GetCompanyDetail(
        basicInfo: json["basic_info"] == null
            ? null
            : BasicInfo.fromJson(json["basic_info"]),
        companyAttachments: json["company_attachments"] == null
            ? null
            : List<dynamic>.from(json["company_attachments"].map((x) => x)),
        certificates: json["certificates"] == null
            ? null
            : List<Certificate>.from(
                json["certificates"].map((x) => Certificate.fromJson(x))),
        escalations: json["escalations"] == null
            ? null
            : List<Escalation>.from(
                json["escalations"].map((x) => Escalation.fromJson(x))),
        coverageAreas: json["coverage_areas"] == null
            ? null
            : List<dynamic>.from(json["coverage_areas"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "basic_info": basicInfo == null ? null : basicInfo!.toJson(),
        "company_attachments": companyAttachments == null
            ? null
            : List<dynamic>.from(companyAttachments!.map((x) => x)),
        "certificates": certificates == null
            ? null
            : List<dynamic>.from(certificates!.map((x) => x.toJson())),
        "escalations": escalations == null
            ? null
            : List<dynamic>.from(escalations!.map((x) => x.toJson())),
        "coverage_areas": coverageAreas == null
            ? null
            : List<dynamic>.from(coverageAreas!.map((x) => x)),
      };
}

class BasicInfo {
  BasicInfo({
    required this.id,
    required this.companyName,
    required this.website,
    required this.companyAddress,
    required this.lat,
    required this.lng,
    required this.companyNumber,
    required this.companyTaxNumber,
    required this.companyEmail,
    required this.password,
    required this.companyContactNumber,
    required this.companyAvailability,
    required this.companyGeneralSkills,
    required this.contactMatrixName,
    required this.contactMatrixEmail,
    required this.contactMatrixContactNumber,
    required this.contactMatrixLocation,
    required this.contactMatrixServerDeskEmail,
    required this.contactMatrixServerDeskContact,
    required this.paymentMechanism,
    required this.formPercentage,
    required this.companyProfileAttachment,
    required this.rateCardAttachment,
    required this.profileImage,
    required this.vendorTypeId,
    required this.approved,
    required this.addedBy,
    required this.addedByTitle,
    required this.gtrNotifRead,
    required this.sdcAddedNotifToGtm,
    required this.rejectedByGtr,
    required this.reasonForRejectionGtr,
    required this.rejectedByGtrNotif,
    required this.acceptedByGtrNotif,
    required this.assignedToUser,
    required this.assignedNotifRead,
    required this.gtmRejectionComment,
    required this.gtmApprovalNotifToGtr,
    required this.addedDate,
    required this.editedDate,
    required this.link,
    required this.smsAlert,
    required this.opened,
    required this.suspended,
    required this.fromSite,
    required this.siteRejectionByGtr,
    required this.gtrActivitySeen,
    required this.phoneVerified,
    required this.verificationCode,
  });

  final String id;
  final String companyName;
  final String website;
  final String companyAddress;
  final String lat;
  final String lng;
  final String companyNumber;
  final String companyTaxNumber;
  final String companyEmail;
  final String password;
  final String companyContactNumber;
  final String companyAvailability;
  final String companyGeneralSkills;
  final String contactMatrixName;
  final String contactMatrixEmail;
  final String contactMatrixContactNumber;
  final String contactMatrixLocation;
  final String contactMatrixServerDeskEmail;
  final String contactMatrixServerDeskContact;
  final String paymentMechanism;
  final String formPercentage;
  final String companyProfileAttachment;
  final String rateCardAttachment;
  final String profileImage;
  final String vendorTypeId;
  final String approved;
  final String addedBy;
  final String addedByTitle;
  final String gtrNotifRead;
  final String sdcAddedNotifToGtm;
  final String rejectedByGtr;
  final dynamic reasonForRejectionGtr;
  final String rejectedByGtrNotif;
  final String acceptedByGtrNotif;
  final dynamic assignedToUser;
  final String assignedNotifRead;
  final dynamic gtmRejectionComment;
  final String gtmApprovalNotifToGtr;
  final dynamic addedDate;
  final dynamic editedDate;
  final dynamic link;
  final String smsAlert;
  final String opened;
  final String suspended;
  final String fromSite;
  final String siteRejectionByGtr;
  final String gtrActivitySeen;
  final String phoneVerified;
  final String verificationCode;

  factory BasicInfo.fromJson(Map<String, dynamic> json) => BasicInfo(
        id: json["id"],
        companyName: json["company_name"],
        website: json["website"],
        companyAddress: json["company_address"],
        lat: json["lat"],
        lng: json["lng"],
        companyNumber: json["company_number"],
        companyTaxNumber: json["company_tax_number"],
        companyEmail: json["company_email"],
        password: json["password"],
        companyContactNumber: json["company_contact_number"],
        companyAvailability: json["company_availability"],
        companyGeneralSkills: json["company_general_skills"],
        contactMatrixName: json["contact_matrix_name"],
        contactMatrixEmail: json["contact_matrix_email"],
        contactMatrixContactNumber: json["contact_matrix_contact_number"],
        contactMatrixLocation: json["contact_matrix_location"],
        contactMatrixServerDeskEmail: json["contact_matrix_server_desk_email"],
        contactMatrixServerDeskContact:
            json["contact_matrix_server_desk_contact"],
        paymentMechanism: json["payment_mechanism"],
        formPercentage: json["form_percentage"],
        companyProfileAttachment: json["company_profile_attachment"],
        rateCardAttachment: json["rate_card_attachment"],
        profileImage: json["profile_image"],
        vendorTypeId: json["vendor_type_id"],
        approved: json["approved"],
        addedBy: json["added_by"],
        addedByTitle: json["added_by_title"],
        gtrNotifRead: json["gtr_notif_read"],
        sdcAddedNotifToGtm: json["sdc_added_notif_to_gtm"],
        rejectedByGtr: json["rejected_by_gtr"],
        reasonForRejectionGtr: json["reason_for_rejection_gtr"],
        rejectedByGtrNotif: json["rejected_by_gtr_notif"],
        acceptedByGtrNotif: json["accepted_by_gtr_notif"],
        assignedToUser: json["assigned_to_user"],
        assignedNotifRead: json["assigned_notif_read"],
        gtmRejectionComment: json["gtm_rejection_comment"],
        gtmApprovalNotifToGtr: json["gtm_approval_notif_to_gtr"],
        addedDate: json["added_date"] == null
            ? null
            : DateTime.parse(json["added_date"]),
        editedDate: json["edited_date"],
        link: json["link"],
        smsAlert: json["sms_alert"],
        opened: json["opened"],
        suspended: json["suspended"],
        fromSite: json["from_site"],
        siteRejectionByGtr: json["site_rejection_by_gtr"],
        gtrActivitySeen: json["gtr_activity_seen"],
        phoneVerified: json["phone_verified"],
        verificationCode: json["verification_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_name": companyName,
        "website": website,
        "company_address": companyAddress,
        "lat": lat,
        "lng": lng,
        "company_number": companyNumber,
        "company_tax_number": companyTaxNumber,
        "company_email": companyEmail,
        "password": password,
        "company_contact_number": companyContactNumber,
        "company_availability": companyAvailability,
        "company_general_skills": companyGeneralSkills,
        "contact_matrix_name": contactMatrixName,
        "contact_matrix_email": contactMatrixEmail,
        "contact_matrix_contact_number": contactMatrixContactNumber,
        "contact_matrix_location": contactMatrixLocation,
        "contact_matrix_server_desk_email": contactMatrixServerDeskEmail,
        "contact_matrix_server_desk_contact": contactMatrixServerDeskContact,
        "payment_mechanism": paymentMechanism,
        "form_percentage": formPercentage,
        "company_profile_attachment": companyProfileAttachment,
        "rate_card_attachment": rateCardAttachment,
        "profile_image": profileImage,
        "vendor_type_id": vendorTypeId,
        "approved": approved,
        "added_by": addedBy,
        "added_by_title": addedByTitle,
        "gtr_notif_read": gtrNotifRead,
        "sdc_added_notif_to_gtm": sdcAddedNotifToGtm,
        "rejected_by_gtr": rejectedByGtr,
        "reason_for_rejection_gtr": reasonForRejectionGtr,
        "rejected_by_gtr_notif": rejectedByGtrNotif,
        "accepted_by_gtr_notif": acceptedByGtrNotif,
        "assigned_to_user": assignedToUser,
        "assigned_notif_read": assignedNotifRead,
        "gtm_rejection_comment": gtmRejectionComment,
        "gtm_approval_notif_to_gtr": gtmApprovalNotifToGtr,
        "added_date": addedDate == null
            ? null
            : "${addedDate.year.toString().padLeft(4, '0')}-${addedDate.month.toString().padLeft(2, '0')}-${addedDate.day.toString().padLeft(2, '0')}",
        "edited_date": editedDate,
        "link": link,
        "sms_alert": smsAlert,
        "opened": opened,
        "suspended": suspended,
        "from_site": fromSite,
        "site_rejection_by_gtr": siteRejectionByGtr,
        "gtr_activity_seen": gtrActivitySeen,
        "phone_verified": phoneVerified,
        "verification_code": verificationCode,
      };
}

class Certificate {
  Certificate({
    required this.companyId,
    required this.name,
    required this.file,
  });

  final String companyId;
  final String name;
  final String file;

  factory Certificate.fromJson(Map<String, dynamic> json) => Certificate(
        companyId: json["company_id"],
        name: json["name"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "company_id": companyId,
        "name": name,
        "file": file,
      };
}

class Escalation {
  Escalation({
    required this.companyId,
    required this.escalationContactName,
    required this.escalationContactEmail,
    required this.escalationContactContact,
  });

  final String companyId;
  final String escalationContactName;
  final String escalationContactEmail;
  final String escalationContactContact;

  factory Escalation.fromJson(Map<String, dynamic> json) => Escalation(
        companyId: json["company_id"],
        escalationContactName: json["escalation_contact_name"],
        escalationContactEmail: json["escalation_contact_email"],
        escalationContactContact: json["escalation_contact_contact"],
      );

  Map<String, dynamic> toJson() => {
        "company_id": companyId,
        "escalation_contact_name": escalationContactName,
        "escalation_contact_email": escalationContactEmail,
        "escalation_contact_contact": escalationContactContact,
      };
}
