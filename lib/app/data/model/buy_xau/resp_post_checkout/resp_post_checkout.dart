import 'package:flutter_xaurius/app/data/model/base_resp.dart';
import 'package:flutter_xaurius/app/data/model/buy_data/buy_data.dart';
import 'package:flutter_xaurius/app/data/model/invoice_data/invoice_data.dart';

class ResponsePostCheckOut extends BaseResp {
  ResponsePostCheckOut({
    this.data,
  });

  Data data;

  factory ResponsePostCheckOut.fromJson(Map<String, dynamic> json) => ResponsePostCheckOut()
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
    this.buy,
    this.invoice,
  });

  Buy buy;
  Invoice invoice;

  factory Data.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Data(
      buy: Buy.fromJson(json["buy"]),
      invoice: Invoice.fromJson(json["invoice"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "buy": buy.toJson(),
        "invoice": invoice.toJson(),
      };
}
