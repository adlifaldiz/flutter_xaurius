import 'package:get/get.dart';

import '../controllers/send_xau_controller.dart';

class SendXauBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendXauController>(
      () => SendXauController(),
    );
  }
}
