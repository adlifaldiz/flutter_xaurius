class VaMerchant {
  VaMerchant({
    this.merchantName,
    this.merchantId,
    this.fee,
    this.appBank,
  });

  String merchantName;
  String merchantId;
  String fee;
  String appBank;

  factory VaMerchant.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return VaMerchant(
      merchantName: json["merchantName"],
      merchantId: json["merchantId"],
      fee: json["fee"],
      appBank: json["app_bank"],
    );
  }

  Map<String, dynamic> toJson() => {
        "merchantName": merchantName,
        "merchantId": merchantId,
        "fee": fee,
        "app_bank": appBank,
      };
}
