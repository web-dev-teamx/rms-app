import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/register/register.dart';

Future<Signup> registerRequest(
    {required firstname,
    required lastname,
    required email,
    required countrycode,
    required contactnumber,
    required country,
    required companyname}) async {
  String url =
      "https://rmsportal.net/api/process_register.php?auth_token=0cfc4e21af1504b2c48894b57cbc36b8&vendor_type_id=1&email=$email&sms_notif=on&first_name=$firstname&last_name=$lastname&company_name=$companyname&country_code=$countrycode&phone=$contactnumber&country=$country&city_country_lat=31.5204&city_country_lng=74.3587&checkbox_4[0]=Break-Fix&checkbox_4[1]=Rollout";

  http.Response response = await http.post(
    Uri.parse(url),
  );

  if (response.statusCode == 200 || response.statusCode <= 205) {
    if (kDebugMode) {
      print(response.body);
    }
    return Signup.fromJson(json.decode(response.body));
  }
  throw json.decode(response.body)["message"];
}
