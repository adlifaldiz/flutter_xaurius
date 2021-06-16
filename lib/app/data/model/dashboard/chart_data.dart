class ChartData {
  ChartData({
    this.id,
    this.copen,
    this.clow,
    this.chigh,
    this.cclose,
    this.createdAt,
    this.updatedAt,
    this.cdate,
    this.cdatestr,
  });

  int id;
  String copen;
  String clow;
  String chigh;
  String cclose;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime cdate;
  DateTime cdatestr;

  factory ChartData.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return ChartData(
      id: json["id"],
      copen: json["copen"],
      clow: json["clow"],
      chigh: json["chigh"],
      cclose: json["cclose"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      cdate: json["cdate"] == null ? null : DateTime.parse(json["cdate"]),
      cdatestr: json["cdatestr"] == null ? null : DateTime.parse(json["cdatestr"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "copen": copen,
        "clow": clow,
        "chigh": chigh,
        "cclose": cclose,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "cdate": cdate == null ? null : cdate.toIso8601String(),
        "cdatestr": cdatestr == null
            ? null
            : "${cdatestr.year.toString().padLeft(4, '0')}-${cdatestr.month.toString().padLeft(2, '0')}-${cdatestr.day.toString().padLeft(2, '0')}",
      };
}
