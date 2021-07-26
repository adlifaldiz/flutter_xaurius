import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ResetPinCreatePinController extends GetxController {
  var isLoading = false.obs;
  var pin = '';
  var email;
  var code;
  var froms;

  @override
  void onInit() {
    email = Get.arguments['email'];
    code = Get.arguments['code'];
    froms = Get.arguments['froms'];
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void createPin() async {
    router();
  }

  void router() {
    Get.toNamed(Routes.RESET_PIN_VERIF_PIN,
        arguments: {'email': email, 'code': code, 'pin': pin, 'froms': froms});
  }
}
