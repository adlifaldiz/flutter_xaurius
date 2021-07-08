class DepositData {
  DepositData({
    this.id,
    this.depositNetwork,
    this.depositValue,
    this.createdAt,
    this.updatedAt,
    this.depositTxhash,
  });

  int id;
  String depositNetwork;
  String depositValue;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic depositTxhash;

  factory DepositData.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return DepositData(
      id: json["id"],
      depositNetwork: json["deposit_network"],
      depositValue: json["deposit_value"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      depositTxhash: json["deposit_txhash"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "deposit_network": depositNetwork,
        "deposit_value": depositValue,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deposit_txhash": depositTxhash,
      };
}
