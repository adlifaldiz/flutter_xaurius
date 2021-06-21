import 'package:flutter/cupertino.dart';
import 'package:flutter_xaurius/app/modules/verif_pin/views/verif_pin_view.dart';
import 'package:flutter_xaurius/helper/dialog_utils.dart';
import 'package:flutter_xaurius/model/auth/signup_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:get/get.dart';

class CreatePinController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ApiProvider provider = ApiProvider();
  TextEditingController pinController;

  var signUpResponse = SignUpModel().obs;

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
    Get.to(VerifPinView(email: email, code: code, pin: pin));
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
