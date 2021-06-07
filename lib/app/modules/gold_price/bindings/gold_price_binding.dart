import 'package:get/get.dart';

import '../controllers/gold_price_controller.dart';

class GoldPriceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoldPriceController>(
      () => GoldPriceController(),
    );
  }
}
