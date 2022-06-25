import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sv_rms_mobile/model/login/login.dart';

Future<LoginModel> login(String username, String password) async {
  String url =
      "https://rmsportal.net/api/process_login.php?auth_token=0cfc4e21af1504b2c48894b57cbc36b8&username=$username&password=$password";

  http.Response response = await http.get(
    Uri.parse(url),
  );

  if (response.statusCode == 200 || response.statusCode <= 203) {
    // print(response.body);
    return LoginModel.fromJson(json.decode(response.body));
  }
  throw json.decode(response.body)["message"];
}
