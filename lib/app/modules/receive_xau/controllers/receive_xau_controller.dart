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

  TextEditingController addressController;

  @override
  Future onInit() async {
    setTextController();
    balance.value = dash.balance;
    approved = auth.userData.orangKycStatus;
    //if (auth.userData.orangKycStatus == 'approve') {
    if (auth.userData.orangEthAddress.toString().isEmpty ||
        auth.userData.orangEthAddress.toString() == " ") {
      addressController.text = auth.userData.orangEthAddress.toString();
    } else {
      addressController.clear();
    }
    // } else {
    //   addressController.text = 'notif_kyc_review_no_space'.tr;
    // }
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

  Color checkapr() {
    if (approved == 'approved') {
      return brokenWhiteColor;
    } else {
      return backgroundPanelColor;
    }
  }

  void router() {
    Get.toNamed(Routes.DATA_PERSONAL);
  }
}
