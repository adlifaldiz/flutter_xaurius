import 'package:get/get.dart';

import '../controllers/re_login_controller.dart';

class ReLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReLoginController>(
      () => ReLoginController(),
    );
  }
}
