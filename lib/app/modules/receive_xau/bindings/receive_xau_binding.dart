import 'package:get/get.dart';

import '../controllers/receive_xau_controller.dart';

class ReceiveXauBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceiveXauController>(
      () => ReceiveXauController(),
    );
  }
}
