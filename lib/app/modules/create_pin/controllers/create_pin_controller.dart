import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class CreatePinController extends GetxController {
  ApiRepository _repo = ApiRepository();
  var isLoading = false.obs;
  var pin = '';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void createPin(email, code) async {
    final resp = await _repo.registerVerification(email, code);
    if (resp.success) {
      Get.toNamed(Routes.VERIFY_PIN, arguments: {'email': email, 'code': code, 'pin': pin});
      successSnackbar('Sukses', 'Silahkan melanjutkan');
    } else {

    }
  }
}
