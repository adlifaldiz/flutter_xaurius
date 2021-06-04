import 'package:get/get.dart';

import '../controllers/buy_xau_controller.dart';

class BuyXauBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuyXauController>(
      () => BuyXauController(),
    );
  }
}
