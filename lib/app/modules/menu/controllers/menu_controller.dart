import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  final _auth = Get.find<AuthController>();

  @override
  void onInit() {
    _auth.getProfileData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
