import 'package:json_annotation/json_annotation.dart';
part 'project_details.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ProjectDetail {
  ProjectDetail({
    required this.id,
    required this.projectName,
    required this.clientLocation,
    required this.sameScope,
    required this.site,
    required this.scope,
    required this.isInterested,
    required this.referrenceId,
    required this.campaignEndDate,
    required this.sendToSsdc,
    required this.ssdcSeenSend,
    required this.ssdcApproval,
    required this.ssdcRejectionComment,
    required this.approvalSsdcNotif,
    required this.sendToSdm,
    required this.sdmApproval,
    required this.approvalSdmNotif,
    required this.sdmRejectionComment,
    required this.status,
    required this.addedBy,
    required this.postedDate,
    required this.retainerProjectId,
    required this.retainerType,
    required this.sdmActivityNew,
    required this.tools,
    required this.description,
    required this.category,
    required this.location,
    required this.skills,
    required this.startDateTime,
    required this.endDateTime,
  });
  late final String? id;
  late final String? projectName;
  late final String? clientLocation;
  late final String? sameScope;
  late final String? site;
  late final String? scope;
  late final String? isInterested;
  late final String? referrenceId;
  late final String? campaignEndDate;
  late final String? sendToSsdc;
  late final String? ssdcSeenSend;
  late final String? ssdcApproval;
  late final String? ssdcRejectionComment;
  late final String? approvalSsdcNotif;
  late final String? sendToSdm;
  late final String? sdmApproval;
  late final String? approvalSdmNotif;
  late final String? sdmRejectionComment;
  late final String? status;
  late final String? addedBy;
  late final String? postedDate;
  late final String? retainerProjectId;
  late final String? retainerType;
  late final String? sdmActivityNew;
  late final String? tools;
  late final String? description;
  late final String? category;
  late final String? location;
  late final String? skills;
  late final String? startDateTime;
  late final String? endDateTime;

  factory ProjectDetail.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDetailToJson(this);
}
