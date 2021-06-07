import 'package:flutter_xaurius/app/data/model/auth/user_data.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _repo = ApiRepository();

  String token;
  UserData userData;

  var isLoading = false.obs;
  var isError = false.obs;

  Future<void> getProfileData() async {
    isLoading(true);
    final resp = await _repo.getPersonalInfo(token);
    if (resp.success) {
      userData = resp.data.orang;
      isError(false);
      update();
    } else {
      isError(true);
    }
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
