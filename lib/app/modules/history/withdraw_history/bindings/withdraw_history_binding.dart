import 'package:get/get.dart';

import '../controllers/withdraw_history_controller.dart';

class WithdrawHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WithdrawHistoryController>(
      () => WithdrawHistoryController(),
    );
  }
}
