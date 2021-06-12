// To parse this JSON data, do
//
//     final responseGetTopUp = responseGetTopUpFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_xaurius/app/data/model/base_resp.dart';

ResponseGetTopUp responseGetTopUpFromJson(String str) => ResponseGetTopUp.fromJson(json.decode(str));

String responseGetTopUpToJson(ResponseGetTopUp data) => json.encode(data.toJson());

class ResponseGetTopUp extends BaseResp {
  ResponseGetTopUp({
    this.data,
  });

  Data data;

  factory ResponseGetTopUp.fromJson(Map<String, dynamic> json) => ResponseGetTopUp()
    ..success = json["success"]
    ..message = json["msg"]
    ..data = Data.fromJson(json["data"]);

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.depoidrs,
  });

  List<Depoidr> depoidrs;

  factory Data.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Data(
      depoidrs: List<Depoidr>.from(json["depoidrs"].map((x) => Depoidr.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "depoidrs": List<dynamic>.from(depoidrs.map((x) => x.toJson())),
      };
}

class Depoidr {
  Depoidr({
    this.id,
    this.orangId,
    this.invoiceId,
    this.depoidrAmount,
    this.depoidrTrfFee,
    this.depoidrStatus,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int orangId;
  int invoiceId;
  String depoidrAmount;
  String depoidrTrfFee;
  String depoidrStatus;
  DateTime createdAt;
  DateTime updatedAt;

  factory Depoidr.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Depoidr(
      id: json["id"],
      orangId: json["orang_id"],
      invoiceId: json["invoice_id"],
      depoidrAmount: json["depoidr_amount"],
      depoidrTrfFee: json["depoidr_trf_fee"],
      depoidrStatus: json["depoidr_status"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "orang_id": orangId,
        "invoice_id": invoiceId,
        "depoidr_amount": depoidrAmount,
        "depoidr_trf_fee": depoidrTrfFee,
        "depoidr_status": depoidrStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
