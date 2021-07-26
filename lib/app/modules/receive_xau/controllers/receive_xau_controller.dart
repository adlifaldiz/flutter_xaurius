import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/balances/balance_data.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ReceiveXauController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var approved = "not";

  QRViewController qrController;
  var dash = Get.find<DashboardController>();
  var auth = Get.find<AuthController>();
  var balance = <BalanceData>[].obs;

  TextEditingController addressController = TextEditingController();

  @override
  Future onInit() async {
    setTextController();
    balance.value = dash.balance;
    approved = auth.userData.orangKycStatus;

    if (auth.userData.orangEthAddress.toString().isEmpty || auth.userData.orangEthAddress.toString() == null) {
      addressController.text = '';
    } else {
      addressController.text = auth.userData.orangEthAddress.toString();
    }

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
  }

  Color checkapr() {
    if (approved == 'approve') {
      return brokenWhiteColor;
    } else {
      return backgroundPanelColor;
    }
  }

  void router() {
    Get.toNamed(Routes.DATA_PERSONAL);
  }
}
