import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/buy_data/buy_data.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class BuyHistoryController extends GetxController {
  final GlobalKey<LiquidPullToRefreshState> refreshHistory = GlobalKey<LiquidPullToRefreshState>();
  final auth = Get.find<AuthController>();

  final _repo = ApiRepository();
  var listBuys = <Buy>[].obs;

  var isLoading = false.obs;
  @override
  void onInit() {
    getBuys();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void getBuys() async {
    isLoading(true);
    final resp = await _repo.getBuys(auth.token);
    if (resp.success) {
      listBuys(resp.data.buys);
      update();
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  Future onRefresh() async {
    getBuys();
    update();
  }
}
