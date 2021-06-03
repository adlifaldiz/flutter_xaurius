import 'package:get/get.dart';

import '../controllers/verify_pin_controller.dart';

class VerifyPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyPinController>(
      () => VerifyPinController(),
    );
  }
}
