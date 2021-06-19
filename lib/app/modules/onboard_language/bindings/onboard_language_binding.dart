import 'package:get/get.dart';

import '../controllers/onboard_language_controller.dart';

class OnboardLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardLanguageController>(
      () => OnboardLanguageController(),
    );
  }
}
