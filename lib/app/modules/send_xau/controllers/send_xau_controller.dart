import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/balances/balance_data.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/helpers/text_controller_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_xaurius/app/modules/history/send_history/controllers/send_history_controller.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class SendXauController extends GetxController {
  final GlobalKey<FormState> wdKey = GlobalKey<FormState>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController qrController;
  final _repo = ApiRepository();
  var auth = Get.find<AuthController>();
  var sendHis = Get.find<SendHistoryController>();
  Timer timer;
  var start = 60.obs;
  var isLoadingOTP = false.obs;
  var isLoading = false.obs;
  var isStart = false.obs;
  var scanArea = (Get.width < 400 || Get.height < 400) ? 150.0 : 300.0;
  var dash = Get.find<DashboardController>();
  var balance = <BalanceData>[].obs;
  var address = ''.obs;
  var valueNetwork = 'ETH'.obs;
  var xauBalance = 0.0.obs;
  var mode = AutovalidateMode.disabled.obs;

  List<String> listNetwork = ['ETH', 'BSC'];

  TextEditingController addressController, xauController, otpController;
  NumericTextController idrController;

  @override
  Future onInit() async {
    setTextController();
    balance.value = dash.balance;
    xauBalance.value = double.parse(balance.where((itemBalance) => itemBalance.balanceSymbol == "XAU").single.balanceValue.toString());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    timer.cancel();
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
    otpController = TextEditingController();
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
      idrController.text = '0';
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
      var value = double.parse(val);
      var subtotal = double.parse(dash.goldPrice.value.chartpriceBuy) * value;
      var total = subtotal.toInt();
      idrController.text = total.toString();
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
      var total = val / double.parse(dash.goldPrice.value.chartpriceBuy);
      xauController.text = total.toString();
    }
  }

  Future sendOTP() async {
    isLoadingOTP(true);
    isStart(true);
    final resp = await _repo.getOTP(auth.token);
    if (resp.success) {
      startTimer();
      successSnackbar('succes_alert'.tr, resp.message);
    } else {
      isStart(false);
      timer.cancel();
      start.value = 60;
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoadingOTP(false);
  }

  Future postWD() async {
    isLoading(true);
    final resp = await _repo.postWdXau(addressController.text, xauController.text, valueNetwork.value, otpController.text, auth.token);
    if (resp.success) {
      sendHis.getWd(1);
      successSnackbar('succes_alert'.tr, resp.message);
    } else {
      sendHis.getWd(1);
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
          isStart(false);
          start.value = 60;
          update();
        } else {
          start.value--;
          isStart(true);
          update();
        }
      },
    );
  }

  void checkWD() {
    var isValid = wdKey.currentState.validate();
    timer.cancel();
    start(60);
    isStart(false);
    if (!isValid) {
      mode(AutovalidateMode.onUserInteraction);
      return;
    }
    wdKey.currentState.save();
    postWD();
  }
}
