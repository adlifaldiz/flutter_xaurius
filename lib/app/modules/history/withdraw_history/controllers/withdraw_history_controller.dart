import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/withdraw/withdraw_data/withdraw_data.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class WithdrawHistoryController extends GetxController {
  final GlobalKey<LiquidPullToRefreshState> refreshWd = GlobalKey<LiquidPullToRefreshState>();
  ScrollController scrollController = ScrollController();
  final _repo = ApiRepository();
  final auth = Get.find<AuthController>();
  var wdData = <WithdrawData>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() async {
    await getWd();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future getWd() async {
    isLoading(true);
    final resp = await _repo.getWdXau(auth.token);
    if (resp.success) {
      wdData(resp.data.withdraws);
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  Future onRefresh() async {
    onInit();
    update();
  }
}
