import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/data/model/auth/login_resp.dart';
import 'package:flutter_xaurius/app/data/model/auth/signup_model.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  final appdata = GetStorage();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signKey = GlobalKey<FormState>();
  ApiProvider provider = ApiProvider();
  TextEditingController emailController, pinController, addEmailController;
  var loginResponse = LoginModel().obs;
  var signUpResponse = SignUpModel().obs;

  var isLoading = false.obs;
  var isTimeout = false.obs;
  var isNoConnection = false.obs;

  var email = '';
  var signUpEmail = '';
  var pin = '';

  @override
  void onInit() {
    emailController = TextEditingController();
    addEmailController = TextEditingController();
    pinController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
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
        Get.toNamed(Routes.VERIFY_PIN, arguments: {'email': addEmailController.text});
        successSnackbar('Sukses', 'Berhasil');
      } else {
        if (isNoConnection.value != true) {
          Get.toNamed(Routes.VERIFY_PIN, arguments: {'email': addEmailController.text});
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
    formKey.currentState.save();
    postEmail(addEmailController.value.text);
  }
}
