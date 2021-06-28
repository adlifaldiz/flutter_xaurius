import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class VerifyCodeController extends GetxController {
  ApiRepository _repo = ApiRepository();
  var isLoading = false.obs;
  var code = '';
  var isAgree = false.obs;
  var showToolTip = false.obs;
  String email = '';

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    email = Get.arguments['email'];
    successSnackbar('Sukses', 'Berhasil terkirim ke $email');
    super.onReady();
  }

  void verifyCode() async {
    if (!isAgree.value) {
      showToolTip(true);
      Future.delayed(Duration(seconds: 5)).then((value) {
        showToolTip(false);
      });
    } else {
      isLoading(true);
      var resp = await _repo.verifyRegistrationCode(email, code);
      if (resp.success) {
        Get.toNamed(Routes.CREATE_PIN, arguments: {'email': email, 'code': code});
      } else {
        failSnackbar('Fail', resp.message);
      }
      isLoading(false);
    }
  }

  void onAgreeChange(bool value) {
    isAgree.value = value;
    showToolTip(false);
    update();
  }
}
