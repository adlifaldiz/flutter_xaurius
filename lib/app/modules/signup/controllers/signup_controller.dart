import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/modules/verif_code/views/verif_code_view.dart';
import 'package:flutter_xaurius/helper/dialog_utils.dart';
import 'package:flutter_xaurius/model/auth/signup_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> signKey = GlobalKey<FormState>();
  ApiProvider provider = ApiProvider();
  TextEditingController addEmailController;

  var signUpResponse = SignUpModel().obs;

  var isLoading = false.obs;
  var isTimeout = false.obs;
  var isNoConnection = false.obs;

  var email = '';
  var signUpEmail = '';
  var pin = '';

  @override
  void onInit() {
    addEmailController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    addEmailController.dispose();
    super.onClose();
  }

  void postEmail(email) async {
    isLoading(true);
    try {
      var signUp = await provider.addEmail(email);
      if (signUp == null) {
        signUpResponse.value.success = false;
        signUpResponse.value.message = 'Terjadi masalah';
      } else {
        signUpResponse.value = signUp;
      }
    } on TimeoutException {
      isTimeout(true);
      isLoading(false);
      dialogConnection('Oops', 'Waktu habis', () {
        Get.back();
        isNoConnection(false);
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

      if (signUpResponse.value.success) {
        Get.to(VerifCodeView(email: addEmailController.text));
        successSnackbar('Sukses', 'Berhasil');
      } else {
        if (isNoConnection.value != true) {
          Get.to(VerifCodeView(email: addEmailController.text));
          failSnackbar('Fail', signUpResponse.value.message);
        }
      }
    }
  }

  void checkEmail() {
    final isValidEmail = signKey.currentState.validate();
    if (!isValidEmail) {
      return;
    }
    signKey.currentState.save();
    postEmail(addEmailController.value.text);
  }
}
