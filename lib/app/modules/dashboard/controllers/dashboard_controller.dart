import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/balances/balance_data.dart';
import 'package:flutter_xaurius/app/data/model/dashboard/chart_data.dart';
import 'package:flutter_xaurius/app/data/model/dashboard/goldprice_data.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/widget/carousel_widget/item1.dart';
import 'package:flutter_xaurius/app/widget/carousel_widget/item2.dart';
import 'package:flutter_xaurius/app/widget/carousel_widget/item3.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class DashboardController extends GetxController {
  final GlobalKey<LiquidPullToRefreshState> refreshDash = GlobalKey<LiquidPullToRefreshState>();
  final _repo = ApiRepository();
  final auth = Get.find<AuthController>();
  var isBuy = true.obs;
  var isLoading = false.obs;
  var charts = <ChartData>[].obs;
  var balance = <BalanceData>[].obs;
  var goldPrice = CurrentGoldPriceData().obs;
  var indexBalances = 0.obs;
  var indexPromos = 0.obs;
  List promoList = [Item1(), Item2(), Item3()].obs;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void onInit() {
    auth.getProfileData();
    getDashboardContent();
    super.onInit();
  }

  Future getDashboardContent() async {
    isLoading(true);
    final resp = await _repo.getDashboard(auth.token);
    if (resp.success) {
      charts(resp.data.charts);
      balance(resp.data.myBalances);
      goldPrice(resp.data.currentGoldPrice);
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  Future onRefresh() async {
    await auth.getProfileData();
    await getDashboardContent();
    update();
  }

  Future onChangeBuy(bool change) async {
    isBuy.value = change;
    update();
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'dash_greeting_morning'.tr;
    }
    if (hour < 15) {
      return 'dash_greeting_day'.tr;
    }
    if (hour < 19) {
      return 'dash_greeting_afternoon'.tr;
    }
    return 'dash_greeting_night'.tr;
  }

  void onBalancesChange(int index, CarouselPageChangedReason reason) {
    indexBalances.value = index;
    update();
  }

  void onPromosChange(int index, CarouselPageChangedReason reason) {
    indexPromos.value = index;
    update();
  }
}
