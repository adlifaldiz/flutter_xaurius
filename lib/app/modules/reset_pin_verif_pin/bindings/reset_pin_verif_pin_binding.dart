import 'package:get/get.dart';

import '../controllers/reset_pin_verif_pin_controller.dart';

class ResetPinVerifPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPinVerifPinController>(
      () => ResetPinVerifPinController(),
    );
  }
}
