import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/menu/controllers/menu_controller.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ResetPinVerifPinController extends GetxController {
  ApiRepository _repo = ApiRepository();
  var appData = GetStorage();
  var menu = Get.find<MenuController>();
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
      // Get.offAllNamed(Routes.LOGIN).then((value) => successSnackbar('Sukses', 'Silahkan lakukan Login untuk masuk kedalam aplikasi'));
      // Get.back();
      // Get.back();
      // Get.back();
      // Get.back();
      successSnackbar(
          'Sukses', 'Silahkan lakukan Login untuk masuk kedalam aplikasi');
      if (froms == 2) {
        logout();
      } else {
        Get.back();
        Get.back();
        Get.back();
        Get.back();
      }
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  void logout() {
    appData.remove('username');
    menu.currentIndex(0);
    Get.offAllNamed(Routes.LOGIN);
  }
}
