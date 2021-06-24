class Voucher {
  Voucher({
    this.id,
    this.orangId,
    this.voucherCode,
    this.voucherValue,
    this.createdAt,
    this.updatedAt,
    this.voucherStatus,
  });

  int id;
  String orangId;
  String voucherCode;
  String voucherValue;
  DateTime createdAt;
  DateTime updatedAt;
  String voucherStatus;

  factory Voucher.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Voucher(
      id: json["id"],
      orangId: json["orang_id"],
      voucherCode: json["voucher_code"],
      voucherValue: json["voucher_value"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      voucherStatus: json["voucher_status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "orang_id": orangId,
        "voucher_code": voucherCode,
        "voucher_value": voucherValue,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "voucher_status": voucherStatus,
      };
}
