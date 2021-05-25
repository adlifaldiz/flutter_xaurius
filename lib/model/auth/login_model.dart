import 'dart:convert';

LoginModel responseRequestFromJson(String str) => LoginModel.fromJson(json.decode(str));

String responseRequestToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool success;
  String message;
  String token;

  LoginModel({this.success, this.message, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        message: json["msg"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {"success": success, "msg": message, "token": token};
}
