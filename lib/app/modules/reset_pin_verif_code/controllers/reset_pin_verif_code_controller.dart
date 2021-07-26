import 'dart:async';

import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ResetPinVerifCodeController extends GetxController {
  ApiRepository _repo = ApiRepository();
  var isLoading = false.obs;
  var code = '';
  var isAgree = false.obs;
  var showToolTip = false.obs;
  var froms;
  String email = '';

  Timer timer;
  var start = 60.obs;
  var isLoadingOTP = false.obs;
  var isStart = false.obs;

  @override
  void onInit() {
    email = Get.arguments['email'];
    froms = Get.arguments['froms'];
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

  void verifyCodeReset() async {
    isLoading(true);
    print('Starting Verivication');
    var resp = await _repo.resetPinVerifCode(email, code);
    if (resp.success) {
      print('codeResetTrue');
      Get.toNamed(Routes.RESET_PIN_CREATE_PIN, arguments: {'email': email, 'code': code, 'froms': froms});
    } else {
      failSnackbar('Fail', resp.message);
    }
    isLoading(false);
  }

  Future sendOTP() async {
    isLoadingOTP(true);
    isStart(true);
    final resp = await _repo.resetPinEmail(email);
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
