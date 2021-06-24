class BaseResp {
  bool success;
  String message;

  BaseResp({this.success, this.message});

  factory BaseResp.fromJson(Map<String, dynamic> json) => BaseResp(
    success: json["success"],
    message: json["msg"],
  );

  Map<String, dynamic> toJson() => {"success": success, "msg": message};
}
