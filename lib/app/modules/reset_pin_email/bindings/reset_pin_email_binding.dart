import 'package:get/get.dart';

import '../controllers/reset_pin_email_controller.dart';

class ResetPinEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPinEmailController>(
      () => ResetPinEmailController(),
    );
  }
}
