import 'package:flutter_xaurius/app/data/model/auth/user_resp.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final auth = Get.find<AuthController>();
  final dash = Get.find<DashboardController>();

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

  Future onRefresh() async {
    auth.getProfileData();
    dash.onInit();
    update();
  }
}
