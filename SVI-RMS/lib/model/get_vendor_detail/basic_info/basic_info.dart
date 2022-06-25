import 'package:json_annotation/json_annotation.dart';
part 'basic_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BasicInfo {
  BasicInfo({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.registrationDate,
    required this.dob,
    required this.nationalId,
    required this.houseNumber,
    required this.streetNumber,
    required this.city,
    required this.province,
    required this.postalCode,
    required this.country,
    required this.lat,
    required this.lng,
    required this.contactNumberPrimary,
    required this.contactNumberSecondary,
    required this.phoneNumberLandline,
    required this.whatsappContactNumber,
    required this.emailAddress,
    required this.password,
    required this.skypeid,
    required this.workingExperienceMonth,
    required this.workingExperienceYear,
    required this.currentLocationCountry,
    required this.interestedIn,
    required this.availability,
    required this.availabilityTimeInBracket,
    required this.noticeTimeForFullDay,
    required this.mobilityRegionLocation,
    required this.employmentStatus,
    required this.paymentMechanism,
    required this.consultantHiredFrom,
    required this.positionAgainst,
    required this.otherPosition,
    required this.coverageId,
    required this.requestId,
    required this.sdcCityCountryId,
    required this.profileImage,
    required this.formPercentage,
    required this.vendorTypeId,
    required this.vendorId,
    required this.companyId,
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
    required this.gtmActivityNew,
    required this.gtmActivitySent,
    required this.gtrActivitySeen,
    required this.phoneVerified,
    required this.verificationCode,
  });
  final String? id;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? registrationDate;
  final String? dob;
  final String? nationalId;
  final String? houseNumber;
  final String? streetNumber;
  final String? city;
  final String? province;
  final String? postalCode;
  final String? country;
  final String? lat;
  final String? lng;
  final String? contactNumberPrimary;
  final String? contactNumberSecondary;
  final String? phoneNumberLandline;
  final String? whatsappContactNumber;
  final String? emailAddress;
  final String? password;
  final String? skypeid;
  final String? workingExperienceMonth;
  final String? workingExperienceYear;
  final String? currentLocationCountry;
  final String? interestedIn;
  final String? availability;
  final String? availabilityTimeInBracket;
  final String? noticeTimeForFullDay;
  final String? mobilityRegionLocation;
  final String? employmentStatus;
  final String? paymentMechanism;
  final String? consultantHiredFrom;
  final String? positionAgainst;
  final String? otherPosition;
  final String? coverageId;
  final String? requestId;
  final String? sdcCityCountryId;
  final String? profileImage;
  final String? formPercentage;
  final String? vendorTypeId;
  final String? vendorId;
  final String? companyId;
  final String? approved;
  final String? addedBy;
  final String? addedByTitle;
  final String? gtrNotifRead;
  final String? sdcAddedNotifToGtm;
  final String? rejectedByGtr;
  final String? reasonForRejectionGtr;
  final String? rejectedByGtrNotif;
  final String? acceptedByGtrNotif;
  final String? assignedToUser;
  final String? assignedNotifRead;
  final String? gtmRejectionComment;
  final String? gtmApprovalNotifToGtr;
  final String? addedDate;
  final String? editedDate;
  final String? link;
  final String? smsAlert;
  final String? opened;
  final String? suspended;
  final String? fromSite;
  final String? siteRejectionByGtr;
  final String? gtmActivityNew;
  final String? gtmActivitySent;
  final String? gtrActivitySeen;
  final String? phoneVerified;
  final String? verificationCode;

  factory BasicInfo.fromJson(Map<String, dynamic> json) =>
      _$BasicInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BasicInfoToJson(this);
}
