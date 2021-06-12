import 'package:flutter_xaurius/app/data/model/auth/user_resp.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final auth = Get.find<AuthController>();

  var saldoIDR = '0'.obs;
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

  // void setText() {
  //   if (auth.userBalance.isEmpty) {
  //     saldoIDR.value = '0';
  //   }
  // }
}
