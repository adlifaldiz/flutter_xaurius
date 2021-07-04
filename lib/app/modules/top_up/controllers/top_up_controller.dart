import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/depoidr_data/depoird_data.dart';
import 'package:flutter_xaurius/app/data/model/va_merchant/va_merchant_data/va_merchant_data.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/helpers/text_controller_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class TopUpController extends GetxController {
  final GlobalKey<LiquidPullToRefreshState> refreshTopUp = GlobalKey<LiquidPullToRefreshState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ApiRepository _repo = ApiRepository();
  NumericTextController nominalTopUpControl;
  final auth = Get.find<AuthController>();
  var page = 1.obs;
  var isLoading = false.obs;
  var isLoadingForm = false.obs;
  var isLoadingList = false.obs;
  var mode = AutovalidateMode.disabled.obs;

  var listMerchant = <VaMerchant>[].obs;
  var listTopTup = <Depoidr>[].obs;
  var merchantId = '0'.obs;

  @override
  void onInit() async {
    nominalTopUpControl = NumericTextController();
    getVaMerchant();
    getTopUp(page);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    listTopTup.clear();
  }

  Future onRefresh() async {
    getTopUp(page);
    update();
  }

  void onChangeMerchant(valueChange) {
    merchantId.value = valueChange;
    update();
  }

  void getVaMerchant() async {
    isLoading(true);
    final resp = await _repo.getVaMerchant(auth.token);
    if (resp.success) {
      listMerchant.value = resp.data.vaMerchants;
      merchantId.value = listMerchant[1].merchantId;
      listMerchant.removeAt(0);
      update();
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  void postTopUp() async {
    isLoadingForm(true);
    final resp = await _repo.postTopUp(merchantId.value.toString(), nominalTopUpControl.numberValue, auth.token);
    if (resp.success) {
      getTopUp(1);
      successSnackbar('Sukses', 'Berhasil membuat invoice');
      Get.toNamed(Routes.TOP_UP_DETAIL, arguments: resp.data.invoice.id);
    } else {
      dialogConnection('Oops', resp.message + nominalTopUpControl.text, () {
        Get.back();
      });
    }
    isLoadingForm(false);
  }

  void getTopUp(var page) async {
    isLoadingList(true);
    final resp = await _repo.getTopUp(page, auth.token);
    if (resp.success) {
      listTopTup(resp.data.depoidrs);
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoadingList(false);
  }
}
