import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class VerifyPinController extends GetxController {
  ApiRepository _repo = ApiRepository();
  var isLoading = false.obs;
  var pinConfirmation = '';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void verifyPin(email, otp, pin) async {
    isLoading(true);
    var resp = await _repo.registerPin(email, otp, pin, pinConfirmation);
    if (resp.success) {
      Get.offAllNamed(Routes.LOGIN);
      successSnackbar('Sukses', 'Silahkan lakukan Login untuk masuk kedalam aplikasi');
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }
}
