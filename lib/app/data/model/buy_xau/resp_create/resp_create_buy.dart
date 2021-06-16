// To parse this JSON data, do
//
//     final responseCreateBuy = responseCreateBuyFromJson(jsonString);

import 'package:flutter_xaurius/app/data/model/base_resp.dart';
import 'package:flutter_xaurius/app/data/model/buy_data/buy_data.dart';

class ResponseCreateBuy extends BaseResp {
  ResponseCreateBuy({
    this.data,
  });

  Data data;

  factory ResponseCreateBuy.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ResponseCreateBuy()
      ..success = json["success"]
      ..message = json["msg"]
      ..data = Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.buy,
  });

  Buy buy;

  factory Data.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Data(
      buy: Buy.fromJson(json["buy"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "buy": buy.toJson(),
      };
}
