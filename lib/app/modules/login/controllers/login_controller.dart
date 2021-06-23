import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final auth = Get.find<AuthController>();
  final storage = GetStorage();
  ApiRepository _repo = ApiRepository();
  var isLoading = false.obs;
  var email = '';
  var pin = '';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void login() async {
    isLoading(true);
    var resp = await _repo.login(email, pin);
    if (resp.success) {
      auth.token = resp.token;
      storage.write('username', email);
      await auth.getProfileData();
      await Get.offAllNamed(Routes.MENU);
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }
}
