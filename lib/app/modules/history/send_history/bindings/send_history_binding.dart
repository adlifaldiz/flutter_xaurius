import 'package:get/get.dart';

import '../controllers/send_history_controller.dart';

class SendHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendHistoryController>(
      () => SendHistoryController(),
    );
  }
}
