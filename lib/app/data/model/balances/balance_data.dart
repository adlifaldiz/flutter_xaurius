class BalanceData {
  BalanceData({
    this.id,
    this.orangId,
    this.balanceSymbol,
    this.balanceValue,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int orangId;
  String balanceSymbol;
  String balanceValue;
  DateTime createdAt;
  DateTime updatedAt;

  factory BalanceData.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return BalanceData(
      id: json["id"],
      orangId: json["orang_id"],
      balanceSymbol: json["balance_symbol"],
      balanceValue: json["balance_value"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "orang_id": orangId,
        "balance_symbol": balanceSymbol,
        "balance_value": balanceValue,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
