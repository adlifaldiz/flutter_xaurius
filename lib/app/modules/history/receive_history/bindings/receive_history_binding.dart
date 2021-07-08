import 'package:get/get.dart';

import '../controllers/receive_history_controller.dart';

class ReceiveHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceiveHistoryController>(
      () => ReceiveHistoryController(),
    );
  }
}
