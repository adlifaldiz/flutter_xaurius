import 'package:flutter/cupertino.dart';
import 'package:flutter_xaurius/app/helpers/text_controller_utils.dart';
import 'package:flutter_xaurius/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class SellXauController extends GetxController {
  //TODO: Implement SellXauController
  final dash = Get.find<DashboardController>();
  TextEditingController qtyController;
  TextEditingController totalController;

  final count = 0.obs;
  @override
  void onInit() {
    setNewController();
    super.onInit();
  }

  @override
  void onClose() {
    qtyController.dispose();
    totalController.dispose();
    super.onClose();
  }

  void setNewController({int precision = 0, double initialValue = 0}) {
    totalController = TextEditingController();
    qtyController = TextEditingController();
    update();
  }

  void countLive(sellNumber) {
    var placeholder = 'Total (IDR) *min 50.000.00';
    if (sellNumber.toString().isEmpty) {
      totalController.text = placeholder;
    } else {
      var sellPrice = double.parse(dash.goldPrice.value.chartpriceSell);
      var total = double.parse(sellNumber) * sellPrice;
      totalController.text = total.toString();
    }
  }
}
