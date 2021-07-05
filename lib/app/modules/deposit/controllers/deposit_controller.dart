import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/balances/balance_data.dart';
import 'package:flutter_xaurius/app/helpers/text_controller_utils.dart';
import 'package:flutter_xaurius/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class DepositController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  TextEditingController linkText = TextEditingController();
  List balanceDummy = <BalanceData>[
    BalanceData(balanceSymbol: "XAU", balanceValue: "1"),
    BalanceData(balanceSymbol: "IDR", balanceValue: "10000"),
  ];

  QRViewController qrController;
  var scanArea = (Get.width < 400 || Get.height < 400) ? 150.0 : 300.0;
  var dash = Get.find<DashboardController>();
  var balance = <BalanceData>[].obs;
  var address =
      'https://www.google.com/search?q=how+to+see+japanese+tiktok&safe=strict&client=firefox-b-d&sxsrf=ALeKk0045JlWLCz7pG1JMbORWLGdft1TEg%3A1625397089023&ei=YZfhYIhjzb2tAYW7taAC&oq=how+to+see+japa&gs_lcp=Cgdnd3Mtd2l6EAMYATICCAAyAggAMgIIADICCAAyAggAMgIIADICCAAyBggAEBYQHjIGCAAQFhAeMgYIABAWEB46BwgAEEcQsAM6BQgAEJECOggIABCxAxCDAToICC4QsQMQgwE6BQgAELEDOgsILhCxAxDHARCjAjoECCMQJzoECAAQQzoHCC4QQxCTAjoECAAQCjoHCAAQhwIQFDoCCC5KBAhBGABQopRFWMr5RWCwi0ZoB3ACeACAAa8BiAHYDZIBBDEzLjWYAQCgAQGqAQdnd3Mtd2l6yAEIwAEB&sclient=gws-wiz'
          .obs;

  TextEditingController addressController, xauController;
  NumericTextController idrController;

  @override
  Future onInit() async {
    setTextController();
    balance.value = dash.balance;
    linkText.text = address.toString();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void dispose() {
    qrController.dispose();
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
      xauController.selection = TextSelection.fromPosition(
          TextPosition(offset: xauController.text.length));
    } else if (val[0] == '.') {
      xauController.text = '0.';
      xauController.selection = TextSelection.fromPosition(
          TextPosition(offset: xauController.text.length));
    } else if (val[0] == '0' && val[1].toString().isNum) {
      xauController.text = '0.';
      xauController.selection = TextSelection.fromPosition(
          TextPosition(offset: xauController.text.length));
    } else if (val.contains(',')) {
      xauController.text = val.replaceAll(',', '.');
      xauController.selection = TextSelection.fromPosition(
          TextPosition(offset: xauController.text.length));
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
      idrController.selection = TextSelection.fromPosition(
          TextPosition(offset: idrController.text.length));
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
