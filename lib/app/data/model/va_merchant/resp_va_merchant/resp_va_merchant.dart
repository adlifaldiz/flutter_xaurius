import 'package:flutter_xaurius/app/data/model/base_resp.dart';
import 'package:flutter_xaurius/app/data/model/va_merchant/va_merchant_data/va_merchant_data.dart';

class ResponseVaMerchant extends BaseResp {
  ResponseVaMerchant({
    this.data,
  });

  Data data;

  factory ResponseVaMerchant.fromJson(Map<String, dynamic> json) => ResponseVaMerchant()
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
    this.vaMerchants,
  });

  List<VaMerchant> vaMerchants;

  factory Data.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Data(
      vaMerchants: List<VaMerchant>.from(json["va_merchants"].map((x) => VaMerchant.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "va_merchants": List<dynamic>.from(vaMerchants.map((x) => x.toJson())),
      };
}
