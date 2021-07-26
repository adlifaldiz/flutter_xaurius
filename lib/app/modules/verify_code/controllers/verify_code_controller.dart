import 'dart:async';

import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class VerifyCodeController extends GetxController {
  ApiRepository _repo = ApiRepository();
  var isLoading = false.obs;
  var code = '';
  var isAgree = false.obs;
  var showToolTip = false.obs;
  String email = '';

  Timer timer;
  var start = 60.obs;
  var isLoadingOTP = false.obs;
  var isStart = false.obs;

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    email = Get.arguments['email'];
    successSnackbar('Sukses', 'Berhasil terkirim ke $email');
    super.onReady();
  }

  void verifyCode() async {
    if (!isAgree.value) {
      showToolTip(true);
      Future.delayed(Duration(seconds: 5)).then((value) {
        showToolTip(false);
      });
    } else {
      isLoading(true);
      var resp = await _repo.verifyRegistrationCode(email, code);
      if (resp.success) {
        Get.toNamed(Routes.CREATE_PIN, arguments: {'email': email, 'code': code});
      } else {
        failSnackbar('Fail', resp.message);
      }
      isLoading(false);
    }
  }

  Future sendOTP() async {
    isLoadingOTP(true);
    isStart(true);
    final resp = await _repo.resendCode(email);
    if (resp.success) {
      startTimer();
      successSnackbar('succes_alert'.tr, resp.message);
    } else {
      isStart(false);
      start.value = 60;
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoadingOTP(false);
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

  void onAgreeChange(bool value) {
    isAgree.value = value;
    showToolTip(false);
    update();
  }
}
