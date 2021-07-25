import 'package:flutter/cupertino.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ResetPinEmailController extends GetxController {
  ApiRepository _repo = ApiRepository();
  var isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  var email = '';

  @override
  void onInit() {
    email = Get.arguments['email'];

    setTextController();

    if (email.toString().isEmpty || email.toString() == null) {
      emailController.text = '';
    } else {
      emailController.text = email.toString();
    }

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setTextController() {
    emailController = TextEditingController();
  }

  void register() async {
    isLoading(true);
    var resp = await _repo.register(email);
    // if (resp.success) {
    //   Get.toNamed(Routes.VERIFY_CODE, arguments: {'email': email});
    // } else {
    //   Get.toNamed(Routes.VERIFY_CODE, arguments: {'email': email});

    //   // dialogConnection(
    //   //   'Oops',
    //   //   resp.message,
    //   //   () {
    //   //     Get.back();
    //   //   },
    //   // );
    // }
    isLoading(false);
  }

  void router() {
    Get.toNamed(Routes.RESET_PIN_VERIF_CODE, arguments: {'email': email});
  }
}
