import 'dart:convert';

SignUpModel responseRequestFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String responseRequestToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  bool success;
  String message;

  SignUpModel({this.success, this.message});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        success: json["success"],
        message: json["msg"],
      );

  Map<String, dynamic> toJson() => {"success": success, "msg": message};
}
