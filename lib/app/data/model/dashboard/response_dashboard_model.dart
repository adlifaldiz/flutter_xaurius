import 'package:flutter_xaurius/app/data/model/base_resp.dart';

import '../balances/balance_data.dart';
import 'chart_data.dart';
import 'goldprice_data.dart';
import 'recentbuy_data.dart';

class ResponseDashboard extends BaseResp {
  ResponseDashboard({
    this.data,
  });

  Data data;

  factory ResponseDashboard.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ResponseDashboard()
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
    this.currentGoldPrice,
    this.myBalances,
    this.myTotalBuy,
    this.recentBuys,
    this.charts,
  });

  CurrentGoldPriceData currentGoldPrice;
  List<BalanceData> myBalances;
  String myTotalBuy;
  List<RecentBuy> recentBuys;
  List<ChartData> charts;

  factory Data.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Data(
      currentGoldPrice: CurrentGoldPriceData.fromJson(json["current_gold_price"]),
      myBalances: List<BalanceData>.from(json["my_balances"].map((x) => BalanceData.fromJson(x))),
      myTotalBuy: json["my_total_buy"],
      recentBuys: List<RecentBuy>.from(json["recent_buys"].map((x) => RecentBuy.fromJson(x))),
      charts: List<ChartData>.from(json["charts"].map((x) => ChartData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "current_gold_price": currentGoldPrice.toJson(),
        "my_balances": List<dynamic>.from(myBalances.map((x) => x.toJson())),
        "my_total_buy": myTotalBuy,
        "recent_buys": List<dynamic>.from(recentBuys.map((x) => x.toJson())),
        "charts": List<dynamic>.from(charts.map((x) => x.toJson())),
      };
}
