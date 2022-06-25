import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sv_rms_mobile/model/get_bids_details/biddetail.dart';
import 'package:sv_rms_mobile/model/get_bids_details/get_accepted_bids.model.dart';
import 'package:sv_rms_mobile/model/get_bids_details/get_technicianbid_model.dart';
import 'package:sv_rms_mobile/model/get_bids_details/yourbids.dart';
import 'package:sv_rms_mobile/model/get_complaints/file_complaint_model.dart';
import 'package:sv_rms_mobile/model/get_complaints/get_complaint_model.dart';
import 'package:sv_rms_mobile/model/get_project_detail/get_project_details.dart';
import 'package:sv_rms_mobile/model/get_projects/future_intrested_model.dart';
import 'package:sv_rms_mobile/model/get_projects/get_ActiveProjects_model.dart';
import 'package:sv_rms_mobile/model/get_projects/get_CompletedProjects_model.dart';
import 'package:sv_rms_mobile/model/get_projects/get_IntrestedProject_model.dart';
import 'package:sv_rms_mobile/model/get_projects/project.dart';
import 'package:sv_rms_mobile/model/get_technicians/get_technicians_model.dart';
import 'package:sv_rms_mobile/model/get_vendor_detail/vendor_details.dart';

class ServicesBloc extends ChangeNotifier {
  final String _authToken = "0cfc4e21af1504b2c48894b57cbc36b8";
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://rmsportal.net/api",
      sendTimeout: const Duration(seconds: 20).inMilliseconds,
      connectTimeout: const Duration(seconds: 20).inMilliseconds,
      receiveTimeout: const Duration(seconds: 20).inMilliseconds,
    ),
  );
///////////////Get vender//////////////////////////

  Future<VendorDetails> getVendorDetails({required String id}) async {
    Response response = await _dio.get(
      "/get_vendor_detail.php",
      queryParameters: {
        "auth_token": _authToken,
        "id": id,
      },
    );
    if (response.statusCode == 200 || response.statusCode!.toInt() <= 205) {
      //  print(response.data);
      VendorDetails? vendorDetails;
      vendorDetails = VendorDetails.fromJson(response.data['data']);
      return vendorDetails;
    }
    throw response.statusMessage.toString();
  }

//////////////////Get projects////////////////////////////
  Future<List<Project>>? getProject(String id) async {
    Response response = await _dio.get(
      "/get_projects.php",
      queryParameters: {
        "auth_token": _authToken,
        "id": id,
      },
    );

    if (response.statusCode == 200 || response.statusCode!.toInt() <= 205) {
      // print(response.data);
      final Map<String, dynamic> projectMap =
          response.data as Map? ?? json.decode(response.data);

      List<Project> _list = [];
      dynamic _index = projectMap['data'].length;
      for (var element in projectMap['data']) {
        if (_index > 2) {
          final Project project;
          project = Project.fromJson(element);
          _list.add(project);
        }
        _index--;
      }

      return _list;
    }
    throw response.statusMessage.toString();
  }

  Future<GetProjectDetails> getProjectDetails(
      {required String id,
      required String projectid,
      required String aspid}) async {
    Response response = await _dio.get(
      "/get_project_detail.php",
      queryParameters: {
        "auth_token": _authToken,
        "id": id,
        "project_id": projectid,
        "as_p_id": aspid,
      },
    );
    if (response.statusCode == 200 || response.statusCode!.toInt() <= 205) {
      GetProjectDetails? getProjectDetails;
      getProjectDetails = GetProjectDetails.fromJson(response.data['data']);
      return getProjectDetails;
    }
    throw response.statusMessage.toString();
  }

  Future<GetActiveProjectModel> getActiveProjects(String id) async {
    Response response = await _dio.get(
      "/get_active_projects.php",
      queryParameters: {
        "auth_token": _authToken,
        "id": id,
      },
    );
    if (response.statusCode == 200 || response.statusCode!.toInt() <= 205) {
      //  print(response.data);
      GetActiveProjectModel? getActiveProjectModel;
      getActiveProjectModel = GetActiveProjectModel.fromJson(response.data);
      return getActiveProjectModel;
    }
    throw response.statusMessage.toString();
  }

  Future<GetCompletedProjectModel> getCompletedProjects(String id) async {
    Response response = await _dio.get(
      "/get_completed_projects.php",
      queryParameters: {
        "auth_token": _authToken,
        "id": id,
      },
    );
    if (response.statusCode == 200 || response.statusCode!.toInt() <= 205) {
      //  print(response.data);
      GetCompletedProjectModel? getCompletedProjectModel;
      getCompletedProjectModel =
          GetCompletedProjectModel.fromJson(response.data);
      return getCompletedProjectModel;
    }
    throw response.statusMessage.toString();
  }

  Future<IntrestedProjectModel> getIntrestProjects(String id) async {
    Response response = await _dio.get(
      "/get_interested_projects.php",
      queryParameters: {
        "auth_token": _authToken,
        "id": id,
      },
    );
    if (response.statusCode == 200 || response.statusCode!.toInt() <= 205) {
      //  print(response.data);
      IntrestedProjectModel intrestedProjectModel;
      intrestedProjectModel = IntrestedProjectModel.fromMap(response.data);
      return intrestedProjectModel;
    }
    throw response.statusMessage.toString();
  }

  Future<FutureIntrestedModel> getFutureIntrestProjects(String id) async {
    Response response = await _dio.get(
      "/get_interested_in_future_projects.php",
      queryParameters: {
        "auth_token": _authToken,
        "id": id,
      },
    );
    if (response.statusCode == 200 || response.statusCode!.toInt() <= 205) {
      //  print(response.data);
      FutureIntrestedModel? futureIntrestedModel;
      futureIntrestedModel = FutureIntrestedModel.fromMap(response.data);
      return futureIntrestedModel;
    }
    throw response.statusMessage.toString();
  }

////////////////Get bid///////////////////////////
  Future<BidModel> getbids(String id) async {
    Response response = await _dio.get(
      "/get_your_bids.php",
      queryParameters: {
        "auth_token": _authToken,
        "id": id,
      },
    );
    if (response.statusCode == 200 || response.statusCode!.toInt() <= 205) {
      //  print(response.data);
      BidModel? yourBidModel;
      yourBidModel = BidModel.fromJson(response.data);
      return yourBidModel;
    }
    throw response.statusMessage.toString();
  }

  Future<GetTechnicianBidModel> getTechnicianbids(String id) async {
    Response response = await _dio.get(
      "/get_technician_bids.php",
      queryParameters: {
        "auth_token": _authToken,
        "id": id,
      },
    );
    if (response.statusCode == 200 || response.statusCode!.toInt() <= 205) {
      //  print(response.data);
      GetTechnicianBidModel? getTechnicianBidModel;
      getTechnicianBidModel = GetTechnicianBidModel.fromJson(response.data);
      return getTechnicianBidModel;
    }
    throw response.statusMessage.toString();
  }

  Future<AcceptedBidsModel> getAcceptedbids(String id) async {
    Response response = await _dio.get(
      "/get_accepted_bids.php",
      queryParameters: {
        "auth_token": _authToken,
        "id": id,
      },
    );
    if (response.statusCode == 200 || response.statusCode!.toInt() <= 205) {
      //  print(response.data);
      AcceptedBidsModel? acceptedBidsModel;
      acceptedBidsModel = AcceptedBidsModel.fromJson(response.data);
      return acceptedBidsModel;
    }
    throw response.statusMessage.toString();
  }

  Future<BidDetailModel> getbidsdetails(
      {required String id,
      required String bidId,
      required String detailId}) async {
    Response response = await _dio.get(
      "/get_bid_detail.php",
      queryParameters: {
        "auth_token": _authToken,
        "id": id,
        "bid_id": bidId,
        "detail_id": detailId
      },
    );
    if (response.statusCode == 200 || response.statusCode!.toInt() <= 205) {
      // print(response.data);
      BidDetailModel detailModel = BidDetailModel.fromMap(response.data);
      return detailModel;
    }
    throw response.statusMessage.toString();
  }

////////////////////////////Get Compalints/////////////////
  Future<GetComplaintModel> getComplaints(String id) async {
    Response response = await _dio.get(
      "/get_user_issues.php",
      queryParameters: {
        "auth_token": _authToken,
        "id": id,
      },
    );
    if (response.statusCode == 200 || response.statusCode!.toInt() <= 205) {
      //  print(response.data);
      GetComplaintModel? getComplaintModel;
      getComplaintModel = GetComplaintModel.fromJson(response.data);
      return getComplaintModel;
    }
    throw response.statusMessage.toString();
  }

  ////////////////////Get Technicians///////////////////////
  Future<GetTechnicianModel> getTechnicians(
      {required String id, required String vendorid}) async {
    Response response = await _dio.get(
      "/get_technicians.php",
      queryParameters: {
        "auth_token": _authToken,
        "id": id,
        "vendor_type_id": vendorid
      },
    );
    if (response.statusCode == 200 || response.statusCode!.toInt() <= 205) {
      //  print(response.data);
      GetTechnicianModel? getTechnicianModel;
      getTechnicianModel = GetTechnicianModel.fromJson(response.data);
      return getTechnicianModel;
    }
    throw response.statusMessage.toString();
  }
}
