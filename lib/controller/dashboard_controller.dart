import 'package:flutter/material.dart';
import 'package:flutter_xaurius/controller/gold_price_controller.dart';
import 'package:flutter_xaurius/controller/kyc_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class DashboardController extends GetxController {
  final GlobalKey<LiquidPullToRefreshState> refreshIndicatorKey = GlobalKey<LiquidPullToRefreshState>();

  GoldPriceController goldPriceController = Get.put(GoldPriceController());
  KycController kycController = Get.put(KycController());

  var isBuy = true.obs;

  @override
  void onInit() {
    goldPriceController.getBuys();
    kycController.checkKyc1();
    greeting();
    super.onInit();
  }

  Future onRefresh() async {
    goldPriceController.getBuys();
    kycController.checkKyc1();
    update();
  }

  onChangeBuy(bool change) {
    goldPriceController.getBuys();

    isBuy.value = change;
    update();
  }

  String greeting() {
    var hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Selamat Pagi';
    }
    if (hour < 15) {
      return 'Selamat Siang';
    }
    if (hour < 19) {
      return 'Selamat Sore';
    }
    return 'Selamat Malam';
  }
}
