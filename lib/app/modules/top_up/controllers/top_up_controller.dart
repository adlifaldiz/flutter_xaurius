import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/depoidr_data/depoird_data.dart';
import 'package:flutter_xaurius/app/data/model/top_up/resp_list_topup/resp_list_top.dart';
import 'package:flutter_xaurius/app/data/model/va_merchant/resp_va_merchant/resp_va_merchant.dart';
import 'package:flutter_xaurius/app/data/model/va_merchant/va_merchant_data/va_merchant_data.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class TopUpController extends GetxController {
  ApiRepository _repo = ApiRepository();
  TextEditingController nominalTopUpControl;

  final auth = Get.find<AuthController>();
  var isLoading = false.obs;
  var isLoadingForm = false.obs;
  var isLoadingList = false.obs;
  var listMerchant = <VaMerchant>[].obs;
  var listTopTup = <Depoidr>[].obs;
  var merchantId = '0'.obs;

  @override
  void onInit() {
    getTopUp();
    nominalTopUpControl = TextEditingController();
    getVaMerchant();
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
    getTopUp();
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
    final resp = await _repo.postTopUp(merchantId.value.toString(), nominalTopUpControl.text, auth.token);
    if (resp.success) {
      getTopUp();
      successSnackbar('Sukses', 'Berhasil membuat invoice');
      Get.toNamed(Routes.TOP_UP_DETAIL, arguments: resp.data.invoice.id);
    } else {
      dialogConnection('Oops', resp.message + nominalTopUpControl.text, () {
        Get.back();
      });
    }
    isLoadingForm(false);
  }

  void getTopUp() async {
    isLoadingList(true);
    final resp = await _repo.getTopUp(auth.token);
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
