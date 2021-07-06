import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/balances/balance_data.dart';
import 'package:flutter_xaurius/app/helpers/text_controller_utils.dart';
import 'package:flutter_xaurius/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class DepositController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  TextEditingController linkText = TextEditingController();

  QRViewController qrController;
  var dash = Get.find<DashboardController>();
  var balance = <BalanceData>[].obs;

  TextEditingController addressController;

  @override
  Future onInit() async {
    setTextController();
    balance.value = dash.balance;
    addressController.text = '0xC825cc4B19f8BE6d9f6686927b47745709fFDAc9';
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
  }

  void setTextController() {
    addressController = TextEditingController();
  }
}
