import 'package:flutter_xaurius/app/data/model/base_resp.dart';

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
    this.invoiceForTable,
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
  dynamic invoiceGas;
  int voucherId;
  String invoiceVoucherValue;
  String invoiceForTable;
  DateTime createdAt;
  DateTime updatedAt;

  factory Invoice.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Invoice(
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
      invoiceForTable: json["invoice_for_table"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }

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
        "invoice_for_table": invoiceForTable,
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

  factory InvoiceVa.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return InvoiceVa(
      vaNumber: json["vaNumber"],
      vaExpiryDate: DateTime.parse(json["vaExpiryDate"]),
      totalAmount: json["totalAmount"],
      customerData: CustomerData.fromJson(json["customerData"]),
    );
  }

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

  factory CustomerData.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return CustomerData(
      custName: json["custName"],
    );
  }

  Map<String, dynamic> toJson() => {
        "custName": custName,
      };
}
