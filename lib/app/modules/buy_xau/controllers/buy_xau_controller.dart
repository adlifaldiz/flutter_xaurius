import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/controller/gold_price_controller.dart';
import 'package:flutter_xaurius/app/modules/checkout_xau/views/checkout_xau_view.dart';
import 'package:flutter_xaurius/helper/dialog_utils.dart';
import 'package:flutter_xaurius/model/buys/response_create_buys_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:get/get.dart';

class BuyXauController extends GetxController {
  GoldPriceController goldPriceController = Get.put(GoldPriceController());
  final GlobalKey<FormState> buyKey = GlobalKey<FormState>();

  TextEditingController qtyController;
  TextEditingController totalController;
  ApiProvider provider = ApiProvider();

  var responseCreateBuy = ResponseCreateBuy().obs;

  var isLoadingForm = false.obs;
  var isTimeoutForm = false.obs;
  var isNoConnectionForm = false.obs;
  var qty = ''.obs;

  int value = 1;
  String valueIdType = 'BSC';

  @override
  void onInit() {
    qtyController = TextEditingController();
    totalController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    qtyController.dispose();
    totalController.dispose();
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
        Get.to(() => CheckoutXauView(buyId: responseCreateBuy.value.data.buy.id.toString()));
        successSnackbar('Sukses', responseCreateBuy.value.data.buy.id.toString());
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

  onQtyChange(String val) {
    if (val.isEmpty) {
      qtyController.text = '';
      qtyController.selection = TextSelection.fromPosition(TextPosition(offset: qtyController.text.length));
    } else if (val[0] == '.') {
      qtyController.text = '0.';
      qtyController.selection = TextSelection.fromPosition(TextPosition(offset: qtyController.text.length));
    } else if (val.contains('..') || val.contains(',,')) {
      qtyController.text = val.replaceAll(RegExp('..'), '.');
      qtyController.selection = TextSelection.fromPosition(TextPosition(offset: qtyController.text.length));
    } else if (val.contains(',')) {
      qtyController.text = val.replaceAll(RegExp(','), '.');
      qtyController.selection = TextSelection.fromPosition(TextPosition(offset: qtyController.text.length));
    } else {
      var value = double.parse(val);
      var subtotal = double.parse(goldPriceController.buysResponse.value.data.currentGoldPrice.buy) * value;
      var total = subtotal.toInt();
      totalController.text = total.toString();
    }
  }

  onTotalChange(String val) {
    if (val.isEmpty) {
      totalController.text = '';
      totalController.selection = TextSelection.fromPosition(TextPosition(offset: totalController.text.length));
    } else if (val.contains('0', 0)) {
      totalController.text = '';
      totalController.selection = TextSelection.fromPosition(TextPosition(offset: totalController.text.length));
    } else if (val.contains('..')) {
      totalController.text = val.replaceAll(RegExp('..'), '.');
      totalController.selection = TextSelection.fromPosition(TextPosition(offset: totalController.text.length));
    } else if (val.contains(',')) {
      totalController.text = val.replaceAll(RegExp(','), '.');
      totalController.selection = TextSelection.fromPosition(TextPosition(offset: totalController.text.length));
    } else {
      var value = double.parse(val);
      var total = value / double.parse(goldPriceController.buysResponse.value.data.currentGoldPrice.buy);
      qtyController.text = total.toString();
    }
  }
}
