import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:get/get.dart';

class ResetPinVerifPinController extends GetxController {
  ApiRepository _repo = ApiRepository();
  var isLoading = false.obs;
  var code;
  var email;
  var pin;
  var pinConfirmation = '';

  @override
  void onInit() {
    pin = Get.arguments['pin'];
    email = Get.arguments['email'];
    code = Get.arguments['code'];
    // successSnackbar('Sukses', 'Silahkan melanjutkan');
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void verifyPin() async {
  //   isLoading(true);
  //   var resp = await _repo.registerPin(email, code, pin, pinConfirmation);
  //   if (resp.success) {
  //     // Get.offAllNamed(Routes.LOGIN).then((value) => successSnackbar('Sukses', 'Silahkan lakukan Login untuk masuk kedalam aplikasi'));
  //     Get.back();
  //     Get.back();
  //     Get.back();
  //     Get.back();
  //     successSnackbar('Sukses', 'Silahkan lakukan Login untuk masuk kedalam aplikasi');
  //   } else {
  //     dialogConnection('Oops', resp.message, () {
  //       Get.back();
  //     });
  //   }
  //   isLoading(false);
  // }
}
