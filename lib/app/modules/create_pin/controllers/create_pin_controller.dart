import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class CreatePinController extends GetxController {
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
    Get.toNamed(Routes.VERIFY_PIN, arguments: {'email': email, 'code': code, 'pin': pin});
  }
}
