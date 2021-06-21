import 'package:get/get.dart';

import '../controllers/invoice_xau_controller.dart';

class InvoiceXauBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceXauController>(
      () => InvoiceXauController(),
    );
  }
}
