import 'package:flutter_xaurius/app/data/model/auth/user_data.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final auth = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void Router(id) {
    switch (id) {
      case 1:
        Get.toNamed(Routes.DATA_PERSONAL);
        break;
      case 2:
        Get.toNamed(Routes.DATA_PERSONAL);
        break;
      case 3:
        Get.toNamed(Routes.UPLOAD_DOCUMENT);
        break;
    }
  }
}
