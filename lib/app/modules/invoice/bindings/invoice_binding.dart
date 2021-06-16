import 'package:flutter_xaurius/app/modules/history/controllers/history_controller.dart';
import 'package:get/get.dart';

import '../controllers/invoice_controller.dart';

class InvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceController>(
      () => InvoiceController(),
    );
    // Get.lazyPut<HistoryController>(
    //   () => HistoryController(),
    // );
  }
}
