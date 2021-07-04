import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/balances/balance_data.dart';
import 'package:flutter_xaurius/app/helpers/text_controller_utils.dart';
import 'package:flutter_xaurius/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class WithdrawController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController qrController;
  var scanArea = (Get.width < 400 || Get.height < 400) ? 150.0 : 300.0;
  var dash = Get.find<DashboardController>();
  var balance = <BalanceData>[].obs;
  var address = ''.obs;
  var valueNetwork = 'ETH'.obs;

  List<String> listNetwork = ['ETH', 'BSC'];

  TextEditingController addressController, xauController;
  NumericTextController idrController;

  @override
  Future onInit() async {
    setTextController();
    balance.value = dash.balance;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    qrController.dispose();
    super.dispose();
  }

  void setTextController() {
    addressController = TextEditingController();
    xauController = TextEditingController();
    idrController = NumericTextController();
  }

  Future onQRViewCreated(QRViewController qrController) async {
    this.qrController = qrController;
    qrController.scannedDataStream.take(1).listen((scanData) {
      String s = scanData.code.substring(scanData.code.indexOf(':') + 1);
      addressController.text = s.trim();
      Get.back();
    });
  }

  onQtyChange(val) {
    if (val.isEmpty) {
      xauController.text = '';
      xauController.selection = TextSelection.fromPosition(TextPosition(offset: xauController.text.length));
    } else if (val[0] == '.') {
      xauController.text = '0.';
      xauController.selection = TextSelection.fromPosition(TextPosition(offset: xauController.text.length));
    } else if (val[0] == '0' && val[1].toString().isNum) {
      xauController.text = '0.';
      xauController.selection = TextSelection.fromPosition(TextPosition(offset: xauController.text.length));
    } else if (val.contains(',')) {
      xauController.text = val.replaceAll(',', '.');
      xauController.selection = TextSelection.fromPosition(TextPosition(offset: xauController.text.length));
    } else {
      // var value = double.parse(val);
      // var subtotal = double.parse(dash.goldPrice.value.chartpriceBuy) * value;
      // var total = subtotal.toInt();
      // idrController.text = total.toString();
    }
  }

  onTotalChange(val) {
    val = idrController.numberValue;

    if (val.toString().isEmpty) {
      idrController.text = '';
      idrController.selection = TextSelection.fromPosition(TextPosition(offset: idrController.text.length));
    }
    // else if (val[0] == '.') {
    //   idrController.text = '5';
    //   idrController.selection = TextSelection.fromPosition(TextPosition(offset: qtyController.text.length));
    // } else if (val.contains('..')) {
    //   idrController.text = val.replaceAll(RegExp('..'), '');
    //   idrController.selection = TextSelection.fromPosition(TextPosition(offset: idrController.text.length));
    // } else if (val.contains(',')) {
    //   idrController.text = val.replaceAll(RegExp(','), '');
    //   idrController.selection = TextSelection.fromPosition(TextPosition(offset: idrController.text.length));
    // }
    else {
      // var total = val / double.parse(dash.goldPrice.value.chartpriceBuy);
      // xauController.text = total.toString();
    }
  }
}
