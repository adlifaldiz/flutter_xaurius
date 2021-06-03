import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/base_resp.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:get/get.dart';

class CreatePinController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ApiProvider provider = ApiProvider();
  TextEditingController pinController;

  var signUpResponse = BaseResp().obs;

  var isLoading = false.obs;
  var isTimeout = false.obs;
  var isNoConnection = false.obs;

  var pin = '';

  @override
  void onInit() {
    pinController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    pinController.dispose();
    super.onClose();
  }

  void postPin(email, code, pin) async {
    Get.toNamed(Routes.VERIFY_PIN, arguments: {'email': email, 'code': code, 'pin': pin});
    successSnackbar('Sukses', 'Silahkan melanjutkan');
  }

  void checkPin(email, code) {
    final isValid = formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState.save();
    postPin(email, code, pin);
  }
}
