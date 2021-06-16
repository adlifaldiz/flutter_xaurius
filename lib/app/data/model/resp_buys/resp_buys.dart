import 'package:flutter_xaurius/app/data/model/base_resp.dart';
import 'package:flutter_xaurius/app/data/model/buy_data/buy_data.dart';
import 'package:flutter_xaurius/app/data/model/dashboard/goldprice_data.dart';

class ResponseBuys extends BaseResp {
  ResponseBuys({
    this.data,
  });

  Data data;

  factory ResponseBuys.fromJson(Map<String, dynamic> json) => ResponseBuys()
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
    this.buys,
    this.currentGoldPrice,
  });

  List<Buy> buys;
  CurrentGoldPriceData currentGoldPrice;

  factory Data.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Data(
      buys: List<Buy>.from(json["buys"].map((x) => Buy.fromJson(x))),
      currentGoldPrice: CurrentGoldPriceData.fromJson(json["current_gold_price"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "buys": List<dynamic>.from(buys.map((x) => x.toJson())),
        "current_gold_price": currentGoldPrice.toJson(),
      };
}
