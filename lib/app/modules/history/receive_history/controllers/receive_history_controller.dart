import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/deposit/deposit_data/deposit_data.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:get/get.dart';

class ReceiveHistoryController extends GetxController {
  final GlobalKey<LiquidPullToRefreshState> refreshWd = GlobalKey<LiquidPullToRefreshState>();
  ScrollController scrollController = ScrollController();
  final _repo = ApiRepository();
  final auth = Get.find<AuthController>();
  var depoData = <DepositData>[].obs;
  var page = 1.obs;
  var isLoading = false.obs;
  var isLoadMore = true.obs;
  @override
  void onInit() async {
    await getDepo(page);
    onPaginate();
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

  Future getDepo(var page) async {
    isLoading(true);
    isLoadMore(true);
    final resp = await _repo.getDepoXau(page.toString(), auth.token);
    if (resp.success) {
      if (resp.data.deposits.length > 0) {
        depoData.addAll(resp.data.deposits);
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
            getDepo(page.value);
          }
        }
      });
  }

  Future onRefresh() async {
    depoData.clear();
    isLoadMore(true);
    onPaginate();
    page(1);
    getDepo(page);
    update();
  }
}
