import 'package:flutter_xaurius/app/controller/kyc_controller.dart';
import 'package:get/get.dart';

class DataPersonalController extends GetxController {
  KycController kycController = Get.put(KycController());
  @override
  void onInit() {
    kycController.onInit();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
