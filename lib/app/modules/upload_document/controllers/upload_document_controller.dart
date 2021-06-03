import 'package:flutter_xaurius/app/controller/kyc_controller.dart';
import 'package:get/get.dart';

class UploadDocumentController extends GetxController {
  KycController kycController = Get.put(KycController());

  void updateValueId(int id) {
    kycController.valueId = id;
    update();
  }

  @override
  void onInit() {
    kycController.checkKyc1();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
