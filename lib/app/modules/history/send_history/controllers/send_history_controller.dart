import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/withdraw/withdraw_data/withdraw_data.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class SendHistoryController extends GetxController {
  final GlobalKey<LiquidPullToRefreshState> refreshWd = GlobalKey<LiquidPullToRefreshState>();
  ScrollController scrollController = ScrollController();
  final _repo = ApiRepository();
  final auth = Get.find<AuthController>();
  var page = 1.obs;
  var wdData = <WithdrawData>[].obs;
  var isLoading = false.obs;
  var isLoadMore = true.obs;

  @override
  void onInit() async {
    if (auth.userData.orangKycStatus == 'approve') {
      await getWd(page);
      onPaginate();
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future getWd(var page) async {
    isLoading(true);
    isLoadMore(true);
    final resp = await _repo.getWdXau(page.toString(), auth.token);
    if (resp.success) {
      if (resp.data.withdraws.length > 0) {
        wdData.addAll(resp.data.withdraws);
        isLoading(false);
      } else {
        print('no more data');
        isLoadMore(false);
      }
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  void onPaginate() {
    scrollController
      ..addListener(() {
        if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
          page.value++;
          if (isLoadMore.value) {
            getWd(page.value);
          }
        }
      });
  }

  Future onRefresh() async {
    if (auth.userData.orangKycStatus == 'approve') {
      wdData.clear();
      isLoadMore(true);
      onPaginate();
      page(1);
      getWd(page);
      update();
    }
  }
}
