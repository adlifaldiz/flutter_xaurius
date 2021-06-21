import 'package:get/get.dart';

import '../controllers/verif_pin_controller.dart';

class VerifPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifPinController>(
      () => VerifPinController(),
    );
  }
}
