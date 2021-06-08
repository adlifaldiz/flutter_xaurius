// To parse this JSON data, do
//
//     final responseDetailInvoice = responseDetailInvoiceFromJson(jsonString);

import 'package:flutter_xaurius/app/data/model/base_resp.dart';

class ResponseDetailInvoice extends BaseResp {
  ResponseDetailInvoice({
    this.data,
  });

  Data data;

  factory ResponseDetailInvoice.fromJson(Map<String, dynamic> json) => ResponseDetailInvoice()
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        buy: Buy.fromJson(json["buy"]),
        invoice: Invoice.fromJson(json["invoice"]),
      );

  Map<String, dynamic> toJson() => {
        "buy": buy.toJson(),
        "invoice": invoice.toJson(),
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
  String buyAddress;
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

  factory Buy.fromJson(Map<String, dynamic> json) => Buy(
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

  factory BuyGasJson.fromJson(Map<String, dynamic> json) => BuyGasJson(
        gasPriceInUnitCurrency: json["gas_price_in_unit_currency"],
        tokenTransferCostInIdr: json["token_transfer_cost_in_idr"].toDouble(),
        maintenance: json["maintenance"],
      );

  Map<String, dynamic> toJson() => {
        "gas_price_in_unit_currency": gasPriceInUnitCurrency,
        "token_transfer_cost_in_idr": tokenTransferCostInIdr,
        "maintenance": maintenance,
      };
}

class Invoice {
  Invoice({
    this.id,
    this.orangId,
    this.invoiceTotal,
    this.invoiceKeterangan,
    this.invoiceBayar,
    this.invoiceVa,
    this.invoiceTax,
    this.invoiceAdmfee,
    this.invoiceSubtotal,
    this.invoiceDiscount,
    this.invoiceDatadetail,
    this.invoiceGas,
    this.voucherId,
    this.invoiceVoucherValue,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int orangId;
  String invoiceTotal;
  String invoiceKeterangan;
  bool invoiceBayar;
  InvoiceVa invoiceVa;
  String invoiceTax;
  String invoiceAdmfee;
  String invoiceSubtotal;
  String invoiceDiscount;
  dynamic invoiceDatadetail;
  String invoiceGas;
  int voucherId;
  String invoiceVoucherValue;
  DateTime createdAt;
  DateTime updatedAt;

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        id: json["id"],
        orangId: json["orang_id"],
        invoiceTotal: json["invoice_total"],
        invoiceKeterangan: json["invoice_keterangan"],
        invoiceBayar: json["invoice_bayar"],
        invoiceVa: InvoiceVa.fromJson(json["invoice_va"]),
        invoiceTax: json["invoice_tax"],
        invoiceAdmfee: json["invoice_admfee"],
        invoiceSubtotal: json["invoice_subtotal"],
        invoiceDiscount: json["invoice_discount"],
        invoiceDatadetail: json["invoice_datadetail"],
        invoiceGas: json["invoice_gas"],
        voucherId: json["voucher_id"],
        invoiceVoucherValue: json["invoice_voucher_value"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "orang_id": orangId,
        "invoice_total": invoiceTotal,
        "invoice_keterangan": invoiceKeterangan,
        "invoice_bayar": invoiceBayar,
        "invoice_va": invoiceVa.toJson(),
        "invoice_tax": invoiceTax,
        "invoice_admfee": invoiceAdmfee,
        "invoice_subtotal": invoiceSubtotal,
        "invoice_discount": invoiceDiscount,
        "invoice_datadetail": invoiceDatadetail,
        "invoice_gas": invoiceGas,
        "voucher_id": voucherId,
        "invoice_voucher_value": invoiceVoucherValue,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class InvoiceVa {
  InvoiceVa({
    this.vaNumber,
    this.vaExpiryDate,
    this.totalAmount,
    this.customerData,
  });

  String vaNumber;
  DateTime vaExpiryDate;
  double totalAmount;
  CustomerData customerData;

  factory InvoiceVa.fromJson(Map<String, dynamic> json) => InvoiceVa(
        vaNumber: json["vaNumber"],
        vaExpiryDate: DateTime.parse(json["vaExpiryDate"]),
        totalAmount: json["totalAmount"],
        customerData: CustomerData.fromJson(json["customerData"]),
      );

  Map<String, dynamic> toJson() => {
        "vaNumber": vaNumber,
        "vaExpiryDate": vaExpiryDate.toIso8601String(),
        "totalAmount": totalAmount,
        "customerData": customerData.toJson(),
      };
}

class CustomerData {
  CustomerData({
    this.custName,
  });

  String custName;

  factory CustomerData.fromJson(Map<String, dynamic> json) => CustomerData(
        custName: json["custName"],
      );

  Map<String, dynamic> toJson() => {
        "custName": custName,
      };
}
