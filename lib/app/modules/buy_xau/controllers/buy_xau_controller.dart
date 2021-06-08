import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/modules/gold_price/controllers/gold_price_controller.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class BuyXauController extends GetxController {
  final goldPriceController = Get.find<GoldPriceController>();
  final GlobalKey<FormState> buyKey = GlobalKey<FormState>();
  final auth = Get.find<AuthController>();
  TextEditingController qtyController;
  TextEditingController totalController;
  ApiRepository _repo = ApiRepository();

  // var responseCreateBuy = ResponseCreateBuy().obs;
  // var listBuys = List<Data>().obs;

  var isLoading = false.obs;
  var isTimeout = false.obs;
  var isNoConnection = false.obs;
  var qty = ''.obs;

  int value = 1;
  String valueIdType = 'BSC';

  @override
  void onInit() {
    qtyController = TextEditingController();
    totalController = TextEditingController();
    goldPriceController.getBuys();
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

  Future postBuys(network) async {
    isLoading(true);
    final resp = await _repo.createBuys(qtyController.text, network, auth.token);
    if (resp.success) {
      Get.toNamed(Routes.CHECKOUT, arguments: resp.data.buy.id.toString());
      // successSnackbar('Sukses', resp.data.buy.id.toString());

      update();
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
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
      postBuys(valueIdType);
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
    }
    //  else if (val.contains('..') || val.contains(',,')) {
    //   qtyController.text = val.replaceAll(RegExp('..'), '.');
    //   qtyController.selection = TextSelection.fromPosition(TextPosition(offset: qtyController.text.length));
    // }
    else if (val.contains(',')) {
      qtyController.text = val.replaceAll(RegExp(','), '.');
      qtyController.selection = TextSelection.fromPosition(TextPosition(offset: qtyController.text.length));
    } else {
      var value = double.parse(val);
      var subtotal = double.parse(goldPriceController.buyPrice) * value;
      var total = subtotal.toInt();
      totalController.text = total.toString();
    }
  }

  onTotalChange(String val) {
    if (val.isEmpty) {
      totalController.text = '';
      totalController.selection = TextSelection.fromPosition(TextPosition(offset: totalController.text.length));
    } else if (val[0] == '.') {
      totalController.text = '5';
      totalController.selection = TextSelection.fromPosition(TextPosition(offset: qtyController.text.length));
    } else if (val.contains('..')) {
      totalController.text = val.replaceAll(RegExp('..'), '.');
      totalController.selection = TextSelection.fromPosition(TextPosition(offset: totalController.text.length));
    } else if (val.contains(',')) {
      totalController.text = val.replaceAll(RegExp(','), '.');
      totalController.selection = TextSelection.fromPosition(TextPosition(offset: totalController.text.length));
    } else {
      var value = double.parse(val);
      var total = value / double.parse(goldPriceController.buyPrice);
      qtyController.text = total.toString();
    }
  }
}
