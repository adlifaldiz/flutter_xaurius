import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ResetPinCreatePinController extends GetxController {
  var isLoading = false.obs;
  var pin = '';
  var email;
  var code;

  @override
  void onInit() {
    email = Get.arguments['email'];
    code = Get.arguments['code'];
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void createPin() async {
    Get.toNamed(Routes.RESET_PIN_VERIF_PIN,
        arguments: {'email': email, 'code': code, 'pin': pin});
  }
}
