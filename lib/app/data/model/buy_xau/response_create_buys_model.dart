// To parse this JSON data, do
//
//     final responseCreateBuy = responseCreateBuyFromJson(jsonString);

import 'package:flutter_xaurius/app/data/model/base_resp.dart';

class ResponseCreateBuy extends BaseResp {
  ResponseCreateBuy({
    this.data,
  });

  Data data;

  factory ResponseCreateBuy.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ResponseCreateBuy()
      ..success = json["success"]
      ..message = json["msg"]
      ..data = Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.buy,
  });

  Buy buy;

  factory Data.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Data(
      buy: Buy.fromJson(json["buy"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "buy": buy.toJson(),
      };
}

class Buy {
  Buy({
    this.id,
    this.buyAddress,
    this.buyTxhash,
    this.orangId,
    this.buyQty,
    this.buyStatus,
    this.createdAt,
    this.updatedAt,
    this.invoiceId,
    this.buyAmount,
    this.buyUnitPrice,
    this.buyNetwork,
    this.buyGasJson,
  });

  int id;
  dynamic buyAddress;
  dynamic buyTxhash;
  int orangId;
  String buyQty;
  String buyStatus;
  DateTime createdAt;
  DateTime updatedAt;
  int invoiceId;
  String buyAmount;
  String buyUnitPrice;
  String buyNetwork;
  BuyGasJson buyGasJson;

  factory Buy.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Buy(
      id: json["id"],
      buyAddress: json["buy_address"],
      buyTxhash: json["buy_txhash"],
      orangId: json["orang_id"],
      buyQty: json["buy_qty"],
      buyStatus: json["buy_status"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      invoiceId: json["invoice_id"],
      buyAmount: json["buy_amount"],
      buyUnitPrice: json["buy_unit_price"],
      buyNetwork: json["buy_network"],
      buyGasJson: BuyGasJson.fromJson(json["buy_gas_json"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "buy_address": buyAddress,
        "buy_txhash": buyTxhash,
        "orang_id": orangId,
        "buy_qty": buyQty,
        "buy_status": buyStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "invoice_id": invoiceId,
        "buy_amount": buyAmount,
        "buy_unit_price": buyUnitPrice,
        "buy_network": buyNetwork,
        "buy_gas_json": buyGasJson.toJson(),
      };
}

class BuyGasJson {
  BuyGasJson({
    this.gasPriceInUnitCurrency,
    this.tokenTransferCostInIdr,
    this.maintenance,
  });

  String gasPriceInUnitCurrency;
  double tokenTransferCostInIdr;
  bool maintenance;

  factory BuyGasJson.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return BuyGasJson(
      gasPriceInUnitCurrency: json["gas_price_in_unit_currency"],
      tokenTransferCostInIdr: json["token_transfer_cost_in_idr"].toDouble(),
      maintenance: json["maintenance"],
    );
  }

  Map<String, dynamic> toJson() => {
        "gas_price_in_unit_currency": gasPriceInUnitCurrency,
        "token_transfer_cost_in_idr": tokenTransferCostInIdr,
        "maintenance": maintenance,
      };
}
