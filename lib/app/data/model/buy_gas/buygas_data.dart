class BuyGasJson {
  BuyGasJson({
    this.gasPriceInUnitCurrency,
    this.tokenTransferCostInIdr,
    this.maintenance,
  });

  var gasPriceInUnitCurrency;
  var tokenTransferCostInIdr;
  bool maintenance;

  factory BuyGasJson.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return BuyGasJson(
      gasPriceInUnitCurrency: json["gas_price_in_unit_currency"],
      tokenTransferCostInIdr: json["token_transfer_cost_in_idr"],
      maintenance: json["maintenance"],
    );
  }

  Map<String, dynamic> toJson() => {
        "gas_price_in_unit_currency": gasPriceInUnitCurrency,
        "token_transfer_cost_in_idr": tokenTransferCostInIdr,
        "maintenance": maintenance,
      };
}
