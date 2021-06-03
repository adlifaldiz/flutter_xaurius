import 'dart:convert';

ResponsePostCheckOut responsePostCheckOutFromJson(String str) => ResponsePostCheckOut.fromJson(json.decode(str));

String responsePostCheckOutToJson(ResponsePostCheckOut data) => json.encode(data.toJson());

class ResponsePostCheckOut {
  ResponsePostCheckOut({
    this.success,
    this.msg,
  });

  bool success;
  String msg;

  factory ResponsePostCheckOut.fromJson(Map<String, dynamic> json) => ResponsePostCheckOut(
        success: json["success"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
      };
}
