import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/controller/gold_price_controller.dart';
import 'package:flutter_xaurius/helper/dialog_utils.dart';
import 'package:flutter_xaurius/model/buys/response_create_buys_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class BuyController extends GetxController {
  GoldPriceController goldPriceController = Get.put(GoldPriceController());
  final GlobalKey<FormState> buyKey = GlobalKey<FormState>();

  TextEditingController qtyController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  ApiProvider provider = ApiProvider();

  var responseCreateBuy = ResponseCreateBuy().obs;

  var isLoadingForm = false.obs;
  var isTimeoutForm = false.obs;
  var isNoConnectionForm = false.obs;

  int value = 1;
  String valueIdType = 'BSC';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    qtyController.clear();
    qtyController.clear();
    super.onClose();
  }

  onChangeBuy(valueInt) {
    value = valueInt;
  }

  Future createBuy(network) async {
    isLoadingForm(true);
    try {
      var crateBuy = await provider.createBuy(qtyController.text, network);
      if (crateBuy == null) {
        responseCreateBuy.value.success = false;
        responseCreateBuy.value.msg = 'Terjadi masalah';
      } else {
        responseCreateBuy.value = crateBuy;
      }
    } on TimeoutException {
      isTimeoutForm(true);
      isLoadingForm(false);
      dialogConnection('Oops', 'Waktu habis', () {
        Get.back();
        isTimeoutForm(false);
      });
    } on SocketException {
      isNoConnectionForm(true);
      isLoadingForm(false);
      dialogConnection('Oops', 'Tidak ada koneksi internet', () {
        Get.back();
        isNoConnectionForm(false);
      });
    } finally {
      isLoadingForm(false);
      isTimeoutForm(false);
      isNoConnectionForm(false);
      if (responseCreateBuy.value.success) {
        successSnackbar('Sukses', 'Berhasil');
      } else {
        failSnackbar('Fail', responseCreateBuy.value.msg);
      }
    }
    update();
  }

  void checkBuy() {
    if (value == 1) {
      valueIdType = 'ETH';
    } else {
      valueIdType = 'BSC';
    }

    final isValid = buyKey.currentState.validate();
    if (isValid) {
      buyKey.currentState.save();
      createBuy(valueIdType);
    } else {
      return;
    }
  }
}
