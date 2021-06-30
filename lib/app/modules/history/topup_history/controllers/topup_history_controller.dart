import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/depoidr_data/depoird_data.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/data/provider/api_url.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class TopupHistoryController extends GetxController {
  ApiRepository _repo = ApiRepository();
  ScrollController scrollController = ScrollController();
  final auth = Get.find<AuthController>();
  var listTopTup = <Depoidr>[].obs;
  var page = 1.obs;
  var isLoading = false.obs;
  var isLoadMore = true.obs;
  var triggerFetchMoreSize = 0.0.obs;

  @override
  void onInit() {
    isLoadMore(true);
    if (auth.userData.orangKycStatus == 'approve') {
      onPaginate();
      getTopUp(page);
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

  Future getTopUp(var page) async {
    isLoading(true);
    isLoadMore(true);
    final resp = await _repo.getTopUp(page, auth.token);
    if (resp.success) {
      if (resp.data.depoidrs.length > 0) {
        listTopTup.addAll(resp.data.depoidrs);
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
            getTopUp(page.value);
          }
        }
      });
  }

  Future onRefresh() async {
    if (auth.userData.orangKycStatus == 'approve') {
      listTopTup.clear();
      isLoadMore(true);
      page(1);
      getTopUp(page);
    }
    update();
  }
}
