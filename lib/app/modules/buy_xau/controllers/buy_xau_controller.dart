import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/text_controller_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class BuyXauController extends GetxController {
  final GlobalKey<FormState> buyKey = GlobalKey<FormState>();
  final dash = Get.find<DashboardController>();
  final auth = Get.find<AuthController>();
  TextEditingController qtyController;

  NumericTextController totalController;
  ApiRepository _repo = ApiRepository();

  var isLoading = false.obs;
  var isTimeout = false.obs;
  var isNoConnection = false.obs;
  var qty = ''.obs;
  var total = 0.0.obs;

  int value = 1;
  String valueIdType = 'Private';

  @override
  void onInit() {
    setNewController();
    super.onInit();
  }

  @override
  void onClose() {
    qtyController.dispose();
    totalController.dispose();
    super.onClose();
  }

  void setNewController({int precision = 0, double initialValue = 0}) {
    totalController = NumericTextController(thousandSeparator: '.', decimalSeparator: ',', precision: precision, initialValue: initialValue);
    qtyController = TextEditingController();
    update();
  }

  // onChangeBuy(valueInt) {
  //   value = valueInt;
  // }

  Future postBuys() async {
    isLoading(true);
    final resp = await _repo.createBuys(qtyController.text, valueIdType, auth.token);
    if (resp.success) {
      Get.toNamed(Routes.CHECKOUT, arguments: resp.data.buy.id.toString());
      update();
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  void checkBuy() {
    if (!checkkys()) {
      return;
    }
    final isValid = buyKey.currentState.validate();
    if (isValid) {
      buyKey.currentState.save();
      postBuys();
    } else {
      return;
    }
  }

  bool checkkys() {
    if (auth.userData.orangKycAskForReview && !auth.userData.orangKycEditAvailable) {
      dialogConnection('Oops', 'notif_kyc_review'.tr, () {
        Get.back();
      });
      return false;
    }
    if (auth.userData.orangKycEditAvailable) {
      dialogConnection('Oops', 'notif_kyc'.tr, () {
        Get.back();
      });
      return false;
    }
    return true;
  }

  onQtyChange(val) {
    var total = 0;
    if (val.isEmpty) {
      qtyController.text = '';
      qtyController.selection = TextSelection.fromPosition(TextPosition(offset: qtyController.text.length));
    } else if (val[0] == '.') {
      qtyController.text = '0.';
      qtyController.selection = TextSelection.fromPosition(TextPosition(offset: qtyController.text.length));
    } else if (val[0] == '0' && val[1].toString().isNum) {
      qtyController.text = '0.';
      qtyController.selection = TextSelection.fromPosition(TextPosition(offset: qtyController.text.length));
    } else if (val.contains(',')) {
      qtyController.text = val.replaceAll(',', '.');
      qtyController.selection = TextSelection.fromPosition(TextPosition(offset: qtyController.text.length));
    } else {
      var value = double.parse(val);
      var subtotal = double.parse(dash.goldPrice.value.chartpriceBuy) * value;
      total = subtotal.toInt();
    }
    totalController.text = total.toString();
  }

  onTotalChange(val) {
    val = totalController.numberValue;

    if (val.toString().isEmpty) {
      totalController.text = '';
      totalController.selection = TextSelection.fromPosition(TextPosition(offset: totalController.text.length));
    } else {
      var total = val / double.parse(dash.goldPrice.value.chartpriceBuy);
      qtyController.text = total.toString();
    }
  }
}
