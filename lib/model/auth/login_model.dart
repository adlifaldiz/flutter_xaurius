import '../base_model.dart';

class LoginModel extends BaseResp {
  String token;

  LoginModel({this.token}) : super();

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel()
    ..token = json["token"]
    ..success = json["success"]
    ..message = json["msg"];

  Map<String, dynamic> toJson() =>
      {"success": success, "msg": message, "token": token};
}
