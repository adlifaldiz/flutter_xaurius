import 'package:flutter_xaurius/app/data/model/auth/user_balance.dart';
import 'package:flutter_xaurius/app/data/model/auth/user_data.dart';
import 'package:flutter_xaurius/app/data/model/base_resp.dart';

class UserResp extends BaseResp {
  Data data;

  UserResp({this.data}) : super();

  factory UserResp.fromJson(Map<String, dynamic> json) => UserResp()
    ..success = json["success"]
    ..message = json["msg"]
    ..data = json["data"] != null ? Data.fromJson(json["data"]) : Data();

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": message,
        "data": data.toJson(),
      };
}

class Data {
  UserData orang;
  List<Balance> balances;

  Data({
    this.orang,
    this.balances,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orang: UserData.fromJson(json["orang"]),
        balances: List<Balance>.from(json["balances"].map((x) => Balance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orang": orang.toJson(),
        "balances": List<dynamic>.from(balances.map((x) => x.toJson())),
      };
}
