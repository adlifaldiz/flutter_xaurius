import 'package:get/get.dart';

import 'package:flutter_xaurius/app/modules/history/send_history/controllers/send_history_controller.dart';

import '../controllers/send_history_controller.dart';

class SendHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendHistoryController>(() => SendHistoryController());
  }
}
