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
  var totalRecords = 0.obs;

  @override
  void onInit() async {
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

  void getBuys(var page) async {
    isLoading(true);
    final resp = await _repo.getBuys(page, auth.token);
    if (resp.success && resp.data.buys.isNotEmpty) {
      totalRecords(resp.data.buys.length);
      listBuys.addAll(resp.data.buys);
    } else if (resp.success && resp.data.buys.isEmpty) {
      isLoading(false);
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  // For Pagination
  void onPaginate() {
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        print("reached end");
        page.value++;
        getBuys(page.value);
      }
    });
  }

  Future onRefresh() async {
    listBuys.clear();
    totalRecords(0);
    page(1);
    getBuys(page);
    update();
  }
}
