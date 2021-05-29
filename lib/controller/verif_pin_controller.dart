import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/dialog_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/model/auth/signup_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:flutter_xaurius/screen/signup/create_pin.dart';
import 'package:flutter_xaurius/screen/signup/verif_pin.dart';
import 'package:get/get.dart';

class VerifPinController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ApiProvider provider = ApiProvider();
  TextEditingController verifPinController;

  var signUpResponse = SignUpModel().obs;

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
      var verifCode = await provider.addpin(email, otp, pin, verifPin);
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

  void checkVerifPin(email, code, pin) {
    final isValid = formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState.save();
    postVerifPin(email, code, pin, verifPin);
  }
}
