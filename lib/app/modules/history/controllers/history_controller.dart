import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/modules/gold_price/controllers/gold_price_controller.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HistoryController extends GetxController {
  final goldPriceController = Get.find<GoldPriceController>();
  final GlobalKey<LiquidPullToRefreshState> refreshIndicatorKey = GlobalKey<LiquidPullToRefreshState>();

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

  Future onRefresh() async {
    await goldPriceController.getBuys();
    update();
  }
}
