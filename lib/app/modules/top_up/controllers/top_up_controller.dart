import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/auth/top_up/response_get_top_up_model.dart';
import 'package:flutter_xaurius/app/data/model/va_merchant/response_va_merchant_model.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class TopUpController extends GetxController {
  ApiRepository _repo = ApiRepository();
  TextEditingController nominalTopUpControl;
  int merchantId = 349;
  final auth = Get.find<AuthController>();
  var isLoading = false.obs;
  var isLoadingForm = false.obs;
  var listMerchant = <VaMerchant>[].obs;
  var listTopTup = <Depoidr>[].obs;

  @override
  void onInit() {
    nominalTopUpControl = TextEditingController();
    getVaMerchant();
    getTopUp();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    auth.dispose();
  }

  Future onRefresh() async {
    getTopUp();

    update();
  }

  void onChangeMerchant(valueChange) {
    merchantId = valueChange;
    update();
  }

  void getVaMerchant() async {
    isLoading(true);
    final resp = await _repo.getVaMerchant(auth.token);
    if (resp.success) {
      listMerchant.value = resp.data.vaMerchants;
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  void postTopUp() async {
    isLoadingForm(true);
    final resp = await _repo.postTopUp(merchantId, nominalTopUpControl.text, auth.token);
    if (resp.success) {
      getTopUp();
      successSnackbar('Sukses', 'Berhasil membuat invoice');
    } else {
      dialogConnection('Oops', resp.message + nominalTopUpControl.text, () {
        Get.back();
      });
    }
    isLoadingForm(false);
  }

  void getTopUp() async {
    isLoading(true);
    final resp = await _repo.getTopUp(auth.token);
    if (resp.success) {
      listTopTup(resp.data.depoidrs);
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }
}
