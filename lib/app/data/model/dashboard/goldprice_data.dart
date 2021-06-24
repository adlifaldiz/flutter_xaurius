class CurrentGoldPriceData {
  CurrentGoldPriceData({
    this.id,
    this.chartpriceExchange,
    this.chartpriceDatetime,
    this.chartpriceBuy,
    this.chartpriceSell,
    this.chartpricePrice,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String chartpriceExchange;
  dynamic chartpriceDatetime;
  String chartpriceBuy;
  String chartpriceSell;
  String chartpricePrice;
  DateTime createdAt;
  DateTime updatedAt;

  factory CurrentGoldPriceData.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return CurrentGoldPriceData(
      id: json["id"],
      chartpriceExchange: json["chartprice_exchange"],
      chartpriceDatetime: json["chartprice_datetime"],
      chartpriceBuy: json["chartprice_buy"],
      chartpriceSell: json["chartprice_sell"],
      chartpricePrice: json["chartprice_price"],
      // createdAt: DateTime.parse(json["created_at"] == null ? '0000-00-00' : json["created_at"]),
      // updatedAt: DateTime.parse(json["updated_at"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "chartprice_exchange": chartpriceExchange,
        "chartprice_datetime": chartpriceDatetime,
        "chartprice_buy": chartpriceBuy,
        "chartprice_sell": chartpriceSell,
        "chartprice_price": chartpricePrice,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
