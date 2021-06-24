import 'package:get/get.dart';

import '../controllers/buy_history_controller.dart';

class BuyHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuyHistoryController>(
      () => BuyHistoryController(),
    );
  }
}
