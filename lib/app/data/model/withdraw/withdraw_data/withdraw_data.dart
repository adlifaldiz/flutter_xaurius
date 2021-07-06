class WithdrawData {
  WithdrawData({
    this.id,
    this.orangId,
    this.wdNetwork,
    this.wdAddress,
    this.wdValue,
    this.wdFee,
    this.wdData,
    this.wdStatus,
    this.createdAt,
    this.updatedAt,
    this.wdReal,
    this.wdTxhash,
  });

  int id;
  int orangId;
  String wdNetwork;
  String wdAddress;
  String wdValue;
  String wdFee;
  dynamic wdData;
  String wdStatus;
  DateTime createdAt;
  DateTime updatedAt;
  String wdReal;
  dynamic wdTxhash;

  factory WithdrawData.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return WithdrawData(
      id: json["id"],
      orangId: json["orang_id"],
      wdNetwork: json["wd_network"],
      wdAddress: json["wd_address"],
      wdValue: json["wd_value"],
      wdFee: json["wd_fee"],
      wdData: json["wd_data"],
      wdStatus: json["wd_status"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      wdReal: json["wd_real"],
      wdTxhash: json["wd_txhash"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "orang_id": orangId,
        "wd_network": wdNetwork,
        "wd_address": wdAddress,
        "wd_value": wdValue,
        "wd_fee": wdFee,
        "wd_data": wdData,
        "wd_status": wdStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "wd_real": wdReal,
        "wd_txhash": wdTxhash,
      };
}
