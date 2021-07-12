import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/buy_data/buy_data.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class BuyHistoryController extends GetxController {
  final GlobalKey<LiquidPullToRefreshState> refreshHistory = GlobalKey<LiquidPullToRefreshState>();
  ScrollController scrollController = ScrollController();
  final auth = Get.find<AuthController>();

  final _repo = ApiRepository();
  var listBuys = <Buy>[];
  var page = 1.obs;

  var isLoading = false.obs;
  var isLoadMore = true.obs;

  @override
  void onInit() async {
    isLoadMore(true);
    onPaginate();
    getBuys(page);
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

  Future getBuys(var page) async {
    isLoading(true);
    isLoadMore(true);
    final resp = await _repo.getBuys(page, auth.token);
    if (resp.success) {
      if (resp.data.buys.length > 0) {
        listBuys.addAll(resp.data.buys);
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

  // For Pagination
  void onPaginate() {
    scrollController
      ..addListener(() {
        if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
          page.value++;
          if (isLoadMore.value) {
            getBuys(page.value);
          }
        }
      });
  }

  Future onRefresh() async {
    listBuys.clear();
    isLoadMore(true);
    onPaginate();
    page(1);
    getBuys(page);
    update();
  }
}
