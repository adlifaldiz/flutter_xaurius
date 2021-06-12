import 'package:flutter_xaurius/app/modules/history/controllers/history_controller.dart';
import 'package:get/get.dart';

import '../controllers/transaction_controller.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(() => TransactionController());
  }
}
