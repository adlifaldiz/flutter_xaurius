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
  var isLoading = false.obs;
  @override
  void onInit() async {
    await getDepo();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future getDepo() async {
    isLoading(true);
    final resp = await _repo.getDepoXau(auth.token);
    if (resp.success) {
      depoData(resp.data.deposits);
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  Future onRefresh() async {
    depoData.clear();
    onInit();
    update();
  }
}
