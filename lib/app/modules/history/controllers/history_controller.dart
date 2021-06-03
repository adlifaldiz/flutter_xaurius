import 'package:flutter_xaurius/app/controller/gold_price_controller.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  GoldPriceController goldPriceController = GoldPriceController();
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
