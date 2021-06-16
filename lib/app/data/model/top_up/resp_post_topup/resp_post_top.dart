import 'package:flutter_xaurius/app/data/model/base_resp.dart';
import 'package:flutter_xaurius/app/data/model/depoidr_data/depoird_data.dart';
import 'package:flutter_xaurius/app/data/model/invoice_data/invoice_data.dart';

class ResponsePostTopUp extends BaseResp {
  ResponsePostTopUp({
    this.data,
  });

  Data data;

  factory ResponsePostTopUp.fromJson(Map<String, dynamic> json) => ResponsePostTopUp()
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
    this.depoidr,
    this.invoice,
  });

  Depoidr depoidr;
  Invoice invoice;

  factory Data.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Data(
      depoidr: Depoidr.fromJson(json["depoidr"]),
      invoice: Invoice.fromJson(json["invoice"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "depoidr": depoidr.toJson(),
        "invoice": invoice.toJson(),
      };
}
