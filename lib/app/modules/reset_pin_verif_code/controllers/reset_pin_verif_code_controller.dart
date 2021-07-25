import 'package:flutter/cupertino.dart';
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
    // if (!isAgree.value) {
    //   print("1st Check");
    //   showToolTip(true);
    //   Future.delayed(Duration(seconds: 5)).then((value) {
    //     showToolTip(false);
    //   });
    // } else {
    isLoading(true);
    print('Starting Verivication');
    var resp = await _repo.resetPinVerifCode(email, code);
    if (resp.success) {
      print('codeResetTrue');
      Get.toNamed(Routes.RESET_PIN_CREATE_PIN,
          arguments: {'email': email, 'code': code, 'froms': froms});
    } else {
      failSnackbar('Fail', resp.message);
    }
    isLoading(false);
    //}
  }

  void onAgreeChange(bool value) {
    isAgree.value = value;
    showToolTip(false);
    update();
  }

  // void router() {
  //   Get.toNamed(Routes.RESET_PIN_CREATE_PIN,
  //       arguments: {'email': email, 'code': code});
  // }
}
