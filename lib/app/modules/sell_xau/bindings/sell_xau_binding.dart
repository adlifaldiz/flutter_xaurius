import 'package:get/get.dart';

import '../controllers/sell_xau_controller.dart';

class SellXauBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellXauController>(
      () => SellXauController(),
    );
  }
}
