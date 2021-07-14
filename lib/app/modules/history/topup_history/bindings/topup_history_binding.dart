import 'package:get/get.dart';

import 'package:flutter_xaurius/app/modules/history/topup_history/controllers/topup_history_controller.dart';

import '../controllers/topup_history_controller.dart';

class TopupHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopupHistoryController>(() => TopupHistoryController());
  }
}
