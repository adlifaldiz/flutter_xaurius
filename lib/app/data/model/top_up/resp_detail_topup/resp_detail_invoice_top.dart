import 'package:flutter_xaurius/app/data/model/base_resp.dart';
import 'package:flutter_xaurius/app/data/model/invoice_data/invoice_data.dart';

class ResponseDetailInvoiceTopUp extends BaseResp {
  ResponseDetailInvoiceTopUp({
    this.data,
  });

  Data data;

  factory ResponseDetailInvoiceTopUp.fromJson(Map<String, dynamic> json) => ResponseDetailInvoiceTopUp()
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
    this.invoice,
  });

  Invoice invoice;

  factory Data.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Data(
      invoice: Invoice.fromJson(json["invoice"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "invoice": invoice.toJson(),
      };
}
