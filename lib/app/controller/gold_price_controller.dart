import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/dialog_utils.dart';
import 'package:flutter_xaurius/model/buys/response_buys_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:get/get.dart';

class GoldPriceController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ApiProvider provider = ApiProvider();

  var buysResponse = ResponseBuys().obs;
  var listBuys = List<Buy>().obs;

  var isLoading = false.obs;
  var isTimeout = false.obs;
  var isNoConnection = false.obs;
  var buyPrice = '';
  var sellPrice = '';

  @override
  void onInit() {
    getBuys();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getBuys() async {
    isLoading(true);
    try {
      var verifCode = await provider.getBuys();
      if (verifCode == null) {
        buysResponse.value.success = false;
        buysResponse.value.msg = 'Terjadi masalah';
      } else {
        buysResponse.value = verifCode;
      }
    } on TimeoutException {
      isTimeout(true);
      isLoading(false);
      dialogConnection('Oops', 'Waktu habis', () {
        Get.back();
        isTimeout(false);
      });
    } on SocketException {
      isNoConnection(true);
      isLoading(false);
      dialogConnection('Oops', 'Tidak ada koneksi internet', () {
        Get.back();
        isNoConnection(false);
      });
    } finally {
      isLoading(false);
      isTimeout(false);
      isNoConnection(false);
      if (buysResponse.value.success) {
        // successSnackbar('Sukses', buysResponse.value.msg);
        buyPrice = buysResponse.value.data.currentGoldPrice.buy.toString();
        sellPrice = buysResponse.value.data.currentGoldPrice.sell.toString();
        listBuys.value = buysResponse.value.data.buys;
      } else {
        failSnackbar('Fail', buysResponse.value.msg);
      }
    }
    update();
  }
}