import 'package:get/get.dart';

import 'package:flutter_xaurius/app/modules/history/sell_history/controllers/sell_history_controller.dart';

import '../controllers/sell_history_controller.dart';

class SellHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellHistoryController>(() => SellHistoryController());
  }
}
