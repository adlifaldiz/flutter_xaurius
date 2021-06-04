import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/base_resp.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:get/get.dart';

class VerifyPinController extends GetxController {
  ApiRepository _repo = ApiRepository();
  TextEditingController verifPinController;

  var signUpResponse = BaseResp().obs;

  var isLoading = false.obs;
  var isTimeout = false.obs;
  var isNoConnection = false.obs;

  var verifPin = '';

  @override
  void onInit() {
    verifPinController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    verifPinController.dispose();
    super.onClose();
  }

  void postVerifPin(email, otp, pin, verifPin) async {
    isLoading(true);
    try {
      var verifCode = await _repo.registerPin(email, otp, pin, verifPin);
      if (verifCode == null) {
        signUpResponse.value.success = false;
        signUpResponse.value.message = 'Terjadi masalah';
      } else {
        signUpResponse.value = verifCode;
      }
    } on TimeoutException {
      isTimeout(true);
      isLoading(false);
      dialogConnection('Oops', 'Waktu habis', () {
        Get.back();
        isTimeout(false);
      });
    } on SocketException {
      isNoConnection(true);
      isLoading(false);
      dialogConnection('Oops', 'Tidak ada koneksi internet', () {
        Get.back();
        isNoConnection(false);
      });
    } finally {
      isLoading(false);
      isTimeout(false);
      isNoConnection(false);
      if (signUpResponse.value.success) {
        successSnackbar('Sukses', signUpResponse.value.message);
      } else {
        failSnackbar('Fail', signUpResponse.value.message);
      }
    }
  }
}
