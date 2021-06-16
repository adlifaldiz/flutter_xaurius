import 'package:flutter_xaurius/app/data/model/va_invoice_data/va_invoice_data.dart';

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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
