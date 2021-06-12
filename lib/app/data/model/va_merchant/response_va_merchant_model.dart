import 'package:flutter_xaurius/app/data/model/base_resp.dart';

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

class VaMerchant {
  VaMerchant({
    this.merchantName,
    this.merchantId,
    this.fee,
    this.appBank,
  });

  String merchantName;
  String merchantId;
  String fee;
  String appBank;

  factory VaMerchant.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return VaMerchant(
      merchantName: json["merchantName"],
      merchantId: json["merchantId"],
      fee: json["fee"],
      appBank: json["app_bank"],
    );
  }

  Map<String, dynamic> toJson() => {
        "merchantName": merchantName,
        "merchantId": merchantId,
        "fee": fee,
        "app_bank": appBank,
      };
}
