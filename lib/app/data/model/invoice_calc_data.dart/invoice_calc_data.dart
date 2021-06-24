class InvoiceCalculation {
  InvoiceCalculation({
    this.discount,
    this.admfee,
    this.gas,
    this.total,
    this.voucherValue,
  });

  String discount;
  String admfee;
  double gas;
  int total;
  int voucherValue;

  factory InvoiceCalculation.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return InvoiceCalculation(
      discount: json["discount"],
      admfee: json["admfee"],
      gas: json["gas"].toDouble(),
      total: json["total"],
      voucherValue: json["voucher_value"],
    );
  }

  Map<String, dynamic> toJson() => {
        "discount": discount,
        "admfee": admfee,
        "gas": gas,
        "total": total,
        "voucher_value": voucherValue,
      };
}
