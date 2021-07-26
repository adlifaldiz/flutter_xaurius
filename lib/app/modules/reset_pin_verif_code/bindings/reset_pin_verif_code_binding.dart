import 'package:get/get.dart';

import '../controllers/reset_pin_verif_code_controller.dart';

class ResetPinVerifCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPinVerifCodeController>(
      () => ResetPinVerifCodeController(),
    );
  }
}
