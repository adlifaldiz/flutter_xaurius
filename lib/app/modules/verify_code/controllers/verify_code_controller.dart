import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class VerifyCodeController extends GetxController {
  ApiRepository _repo = ApiRepository();
  var isLoading = false.obs;
  var code = '';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void verifyCode(String email) async {
    isLoading(true);
    var resp = await _repo.verifyRegistrationCode(email, code);
    if (resp.success) {
      Get.toNamed(Routes.CREATE_PIN, arguments: {'email': email, 'code': code});
      successSnackbar('Sukses', resp.message);
    } else {
      failSnackbar('Fail', resp.message);
    }
  }
}
