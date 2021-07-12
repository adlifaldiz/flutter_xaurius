import 'package:flutter_xaurius/app/modules/history/topup_history/controllers/topup_history_controller.dart';
import 'package:get/get.dart';

import '../controllers/top_up_controller.dart';

class TopUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopUpController>(
      () => TopUpController(),
    );
    Get.lazyPut<TopupHistoryController>(
      () => TopupHistoryController(),
    );
  }
}
