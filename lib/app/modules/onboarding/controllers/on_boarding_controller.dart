import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onProceed() {
    // storage.write('isBoarding', 'onBoarding');
    Get.offAllNamed(Routes.ONBOARD_LANGUAGE);
  }
}
