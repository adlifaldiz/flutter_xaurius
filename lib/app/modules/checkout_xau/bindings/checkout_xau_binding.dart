import 'package:get/get.dart';

import '../controllers/checkout_xau_controller.dart';

class CheckoutXauBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutXauController>(
      () => CheckoutXauController(),
    );
  }
}
