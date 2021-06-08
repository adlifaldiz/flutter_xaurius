import 'package:flutter_xaurius/app/modules/gold_price/controllers/gold_price_controller.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  final goldPriceController = Get.find<GoldPriceController>();
  @override
  void onInit() {
    goldPriceController.getBuys();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
