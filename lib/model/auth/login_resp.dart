import '../base_model.dart';

class LoginResp extends BaseResp {
  String token;

  LoginResp({this.token}) : super();

  factory LoginResp.fromJson(Map<String, dynamic> json) => LoginResp()
    ..token = json["token"]
    ..success = json["success"]
    ..message = json["msg"];

  Map<String, dynamic> toJson() =>
      {"success": success, "msg": message, "token": token};
}
