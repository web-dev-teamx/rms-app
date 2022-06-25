import 'dart:convert';

Signup signupFromJson(String str) => Signup.fromJson(json.decode(str));

String signupToJson(Signup data) => json.encode(data.toJson());

class Signup {
  Signup({
    required this.code,
    required this.status,
    required this.message,
  });

  int code;
  String status;
  String message;

  factory Signup.fromJson(Map<String, dynamic> json) => Signup(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
