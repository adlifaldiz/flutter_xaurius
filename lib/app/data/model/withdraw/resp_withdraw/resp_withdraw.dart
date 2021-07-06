import 'package:flutter_xaurius/app/data/model/balances/balance_data.dart';
import 'package:flutter_xaurius/app/data/model/base_resp.dart';
import 'package:flutter_xaurius/app/data/model/withdraw/withdraw_data/withdraw_data.dart';

class ResponseWithdraw extends BaseResp {
  ResponseWithdraw({
    this.data,
  });

  Data data;

  factory ResponseWithdraw.fromJson(Map<String, dynamic> json) => ResponseWithdraw()
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
    this.withdraws,
    this.address,
    this.balances,
  });

  List<WithdrawData> withdraws;
  String address;
  List<BalanceData> balances;

  factory Data.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Data(
      withdraws: List<WithdrawData>.from(json["withdraws"].map((x) => WithdrawData.fromJson(x))),
      address: json["address"],
      balances: List<BalanceData>.from(json["balances"].map((x) => BalanceData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "withdraws": List<dynamic>.from(withdraws.map((x) => x.toJson())),
        "address": address,
        "balances": List<dynamic>.from(balances.map((x) => x.toJson())),
      };
}
