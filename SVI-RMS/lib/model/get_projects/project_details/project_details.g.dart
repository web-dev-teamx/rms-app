// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDetail _$ProjectDetailFromJson(Map<String, dynamic> json) =>
    ProjectDetail(
      id: json['id'] as String?,
      projectName: json['project_name'] as String?,
      clientLocation: json['client_location'] as String?,
      sameScope: json['same_scope'] as String?,
      site: json['site'] as String?,
      scope: json['scope'] as String?,
      isInterested: json['is_interested'] as String?,
      referrenceId: json['referrence_id'] as String?,
      campaignEndDate: json['campaign_end_date'] as String?,
      sendToSsdc: json['send_to_ssdc'] as String?,
      ssdcSeenSend: json['ssdc_seen_send'] as String?,
      ssdcApproval: json['ssdc_approval'] as String?,
      ssdcRejectionComment: json['ssdc_rejection_comment'] as String?,
      approvalSsdcNotif: json['approval_ssdc_notif'] as String?,
      sendToSdm: json['send_to_sdm'] as String?,
      sdmApproval: json['sdm_approval'] as String?,
      approvalSdmNotif: json['approval_sdm_notif'] as String?,
      sdmRejectionComment: json['sdm_rejection_comment'] as String?,
      status: json['status'] as String?,
      addedBy: json['added_by'] as String?,
      postedDate: json['posted_date'] as String?,
      retainerProjectId: json['retainer_project_id'] as String?,
      retainerType: json['retainer_type'] as String?,
      sdmActivityNew: json['sdm_activity_new'] as String?,
      tools: json['tools'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      location: json['location'] as String?,
      skills: json['skills'] as String?,
      startDateTime: json['start_date_time'] as String?,
      endDateTime: json['end_date_time'] as String?,
    );

Map<String, dynamic> _$ProjectDetailToJson(ProjectDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_name': instance.projectName,
      'client_location': instance.clientLocation,
      'same_scope': instance.sameScope,
      'site': instance.site,
      'scope': instance.scope,
      'is_interested': instance.isInterested,
      'referrence_id': instance.referrenceId,
      'campaign_end_date': instance.campaignEndDate,
      'send_to_ssdc': instance.sendToSsdc,
      'ssdc_seen_send': instance.ssdcSeenSend,
      'ssdc_approval': instance.ssdcApproval,
      'ssdc_rejection_comment': instance.ssdcRejectionComment,
      'approval_ssdc_notif': instance.approvalSsdcNotif,
      'send_to_sdm': instance.sendToSdm,
      'sdm_approval': instance.sdmApproval,
      'approval_sdm_notif': instance.approvalSdmNotif,
      'sdm_rejection_comment': instance.sdmRejectionComment,
      'status': instance.status,
      'added_by': instance.addedBy,
      'posted_date': instance.postedDate,
      'retainer_project_id': instance.retainerProjectId,
      'retainer_type': instance.retainerType,
      'sdm_activity_new': instance.sdmActivityNew,
      'tools': instance.tools,
      'description': instance.description,
      'category': instance.category,
      'location': instance.location,
      'skills': instance.skills,
      'start_date_time': instance.startDateTime,
      'end_date_time': instance.endDateTime,
    };
