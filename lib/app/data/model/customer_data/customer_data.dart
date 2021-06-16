class CustomerData {
  CustomerData({
    this.custName,
  });

  String custName;

  factory CustomerData.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return CustomerData(
      custName: json["custName"],
    );
  }

  Map<String, dynamic> toJson() => {
        "custName": custName,
      };
}
