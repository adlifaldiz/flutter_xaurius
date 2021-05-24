import 'dart:convert';

SignUpModel responseRequestFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String responseRequestToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  String status;
  String message;

  SignUpModel({this.status, this.message});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        status: json["status"],
        message: json["msg"],
      );

  Map<String, dynamic> toJson() => {"status": status, "msg": message};
}
