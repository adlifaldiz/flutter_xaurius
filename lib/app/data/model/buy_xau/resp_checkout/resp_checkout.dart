// To parse this JSON data, do
//
//     final responseCheckOut = responseCheckOutFromJson(jsonString);

import 'package:flutter_xaurius/app/data/model/base_resp.dart';
import 'package:flutter_xaurius/app/data/model/buy_data/buy_data.dart';
import 'package:flutter_xaurius/app/data/model/invoice_calc_data.dart/invoice_calc_data.dart';
import 'package:flutter_xaurius/app/data/model/va_merchant/va_merchant_data/va_merchant_data.dart';

class ResponseCheckOut extends BaseResp {
  ResponseCheckOut({
    this.data,
  });

  Data data;

  factory ResponseCheckOut.fromJson(Map<String, dynamic> json) => ResponseCheckOut()
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
    this.invoiceCalculation,
    this.vaMerchants,
  });

  Buy buy;
  InvoiceCalculation invoiceCalculation;
  List<VaMerchant> vaMerchants;

  factory Data.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Data(
      buy: Buy.fromJson(json["buy"]),
      invoiceCalculation: InvoiceCalculation.fromJson(json["invoice_calculation"]),
      vaMerchants: List<VaMerchant>.from(json["va_merchants"].map((x) => VaMerchant.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "buy": buy.toJson(),
        "invoice_calculation": invoiceCalculation.toJson(),
        "va_merchants": List<dynamic>.from(vaMerchants.map((x) => x.toJson())),
      };
}
