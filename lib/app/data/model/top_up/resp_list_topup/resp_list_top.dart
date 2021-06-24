import 'package:flutter_xaurius/app/data/model/base_resp.dart';
import 'package:flutter_xaurius/app/data/model/depoidr_data/depoird_data.dart';

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
