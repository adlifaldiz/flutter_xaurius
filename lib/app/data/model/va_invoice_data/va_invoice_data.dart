import 'package:flutter_xaurius/app/data/model/customer_data/customer_data.dart';

class InvoiceVa {
  InvoiceVa({
    this.bankName,
    this.vaNumber,
    this.vaExpiryDate,
    this.totalAmount,
    this.customerData,
  });

  String bankName;
  String vaNumber;
  DateTime vaExpiryDate;
  var totalAmount;
  CustomerData customerData;

  factory InvoiceVa.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return InvoiceVa(
      bankName: json["bank"] == null ? '' : json["bank"],
      vaNumber: json["vaNumber"],
      vaExpiryDate: DateTime.parse(json["vaExpiryDate"]),
      totalAmount: json["totalAmount"],
      customerData: CustomerData.fromJson(json["customerData"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "bank": bankName,
        "vaNumber": vaNumber,
        "vaExpiryDate": vaExpiryDate.toIso8601String(),
        "totalAmount": totalAmount,
        "customerData": customerData.toJson(),
      };
}
