import 'package:json_annotation/json_annotation.dart';
part 'get_project_details.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GetProjectDetails {
  GetProjectDetails({
    required this.projectBookingtype,
    required this.pdBtAr,
    required this.projectInterestedbutton,
    required this.projectName,
    required this.projectId,
    required this.projectCategory,
    required this.projectType,
    required this.asPId,
    required this.projectSkills,
    required this.projectStartDatetime,
    required this.projectEndDatetime,
    required this.projectLocation,
    required this.projectCurrencyunit,
    required this.projectIsinterested,
    required this.projectTools,
    required this.projectNoOfFe,
    required this.projectDuration,
    required this.projectDescription,
    required this.vendorTypeId,
    required this.projectLanguages,
    required this.projectMixbudget,
    required this.projectMaxbudget,
  });

  final String? projectBookingtype;
  final String? pdBtAr;
  final String? projectInterestedbutton;
  final String? projectName;
  final String? projectId;
  final String? projectCategory;
  final String? projectType;
  final String? asPId;
  final String? projectSkills;
  final String? projectStartDatetime;
  final String? projectEndDatetime;
  final String? projectLocation;
  final String? projectCurrencyunit;
  final String? projectIsinterested;
  final String? projectTools;
  final String? projectNoOfFe;
  final String? projectDuration;
  final String? projectDescription;
  final String? vendorTypeId;
  final String? projectLanguages;
  final String? projectMixbudget;
  final String? projectMaxbudget;

  factory GetProjectDetails.fromJson(Map<String, dynamic> json) =>
      _$GetProjectDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$GetProjectDetailsToJson(this);
}
