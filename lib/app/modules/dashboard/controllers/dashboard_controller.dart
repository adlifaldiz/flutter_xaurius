import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/controller/gold_price_controller.dart';
import 'package:flutter_xaurius/app/controller/kyc_controller.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class DashboardController extends GetxController {
  final auth = Get.find<AuthController>();
  final GlobalKey<LiquidPullToRefreshState> refreshIndicatorKey = GlobalKey<LiquidPullToRefreshState>();
  GoldPriceController goldPriceController = Get.put(GoldPriceController());
  var isBuy = true.obs;

  @override
  void onInit() {
    goldPriceController.getBuys();
    auth.getProfileData();
    super.onInit();
  }

  Future onRefresh() async {
    await goldPriceController.getBuys();
    update();
  }

  Future onChangeBuy(bool change) async{
    await goldPriceController.getBuys();
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
