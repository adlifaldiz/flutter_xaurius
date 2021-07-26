import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ResetPinVerifPinController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var mode = AutovalidateMode.disabled;
  ApiRepository _repo = ApiRepository();
  var appData = GetStorage();
  var login = Get.put(LoginController());
  var isLoading = false.obs;
  var code;
  var email;
  var pin;
  var pinConfirmation = '';
  var froms;

  @override
  void onInit() {
    pin = Get.arguments['pin'];
    email = Get.arguments['email'];
    code = Get.arguments['code'];
    froms = Get.arguments['froms'];
    // successSnackbar('Sukses', 'Silahkan melanjutkan');
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void verifyResetPin() async {
    isLoading(true);
    var resp = await _repo.resetPinRecreate(email, code, pin, pinConfirmation);
    if (resp.success) {
      logout();
      successSnackbar(
          'Sukses', 'Silahkan lakukan Login untuk masuk kedalam aplikasi');
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  void logout() {
    appData.remove('username');
    Get.until((route) => Get.currentRoute == Routes.LOGIN);
  }
}
