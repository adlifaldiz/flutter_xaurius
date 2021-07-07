import 'package:flutter_xaurius/app/data/model/balances/balance_data.dart';
import 'package:flutter_xaurius/app/data/model/base_resp.dart';
import 'package:flutter_xaurius/app/data/model/deposit/deposit_data/deposit_data.dart';
import 'package:flutter_xaurius/app/data/model/withdraw/withdraw_data/withdraw_data.dart';

class ResponseDeposit extends BaseResp {
  ResponseDeposit({
    this.data,
  });

  Data data;

  factory ResponseDeposit.fromJson(Map<String, dynamic> json) => ResponseDeposit()
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
    this.deposits,
    this.address,
    this.balances,
  });

  List<DepositData> deposits;
  String address;
  List<BalanceData> balances;

  factory Data.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Data(
      deposits: List<DepositData>.from(json["deposits"].map((x) => DepositData.fromJson(x))),
      address: json["address"],
      balances: List<BalanceData>.from(json["balances"].map((x) => BalanceData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "deposits": List<dynamic>.from(deposits.map((x) => x.toJson())),
        "address": address,
        "balances": List<dynamic>.from(balances.map((x) => x.toJson())),
      };
}
