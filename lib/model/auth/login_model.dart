import 'dart:convert';

LoginModel responseRequestFromJson(String str) => LoginModel.fromJson(json.decode(str));

String responseRequestToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String status;
  String message;
  String token;

  LoginModel({this.status, this.message, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["msg"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {"status": status, "msg": message, "token": token};
}
