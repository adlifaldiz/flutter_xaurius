import 'package:get/get.dart';

import '../controllers/sell_history_controller.dart';

class SellHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellHistoryController>(
      () => SellHistoryController(),
    );
  }
}
