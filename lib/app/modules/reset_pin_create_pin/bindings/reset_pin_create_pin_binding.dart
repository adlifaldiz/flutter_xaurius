import 'package:get/get.dart';

import '../controllers/reset_pin_create_pin_controller.dart';

class ResetPinCreatePinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPinCreatePinController>(
      () => ResetPinCreatePinController(),
    );
  }
}
