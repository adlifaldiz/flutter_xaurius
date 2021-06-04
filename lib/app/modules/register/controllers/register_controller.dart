import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  ApiRepository _repo = ApiRepository();
  var isLoading = false.obs;
  var email = '';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void register() async {
    isLoading(true);
    var resp = await _repo.register(email);
    if (resp.success) {
      Get.toNamed(Routes.VERIFY_CODE, arguments: {'email': email});
    } else {
      dialogConnection(
        'Oops',
        resp.message,
        () {
          Get.back();
        },
      );
    }
    isLoading(false);
  }
}
