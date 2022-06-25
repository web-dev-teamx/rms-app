// // import 'dart:convert';

// import 'package:http/http.dart' as http;

// Future<GetVendorDetail> getVendorDetails() async {
//   String url =
//       "https://rmsportal.net/api/get_vendor_detail.php?auth_token=0cfc4e21af1504b2c48894b57cbc36b8&id=2128";

//   http.Response response = await http.get(
//     Uri.parse(url),
//   );

//   if (response.statusCode == 200 || response.statusCode <= 205) {
//     // return GetVendorDetail.fromJson(json.decode(response.body));
//   }
//   throw json.decode(response.body)["message"];
// }
