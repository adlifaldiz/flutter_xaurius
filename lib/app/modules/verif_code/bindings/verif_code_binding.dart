import 'package:get/get.dart';

import '../controllers/verif_code_controller.dart';

class VerifCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifCodeController>(
      () => VerifCodeController(),
    );
  }
}
