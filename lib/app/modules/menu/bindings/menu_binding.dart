import 'package:flutter_xaurius/app/modules/gold_price/controllers/gold_price_controller.dart';
import 'package:get/get.dart';

import '../controllers/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuController>(() => MenuController());
    Get.lazyPut<GoldPriceController>(() => GoldPriceController());
  }
}
