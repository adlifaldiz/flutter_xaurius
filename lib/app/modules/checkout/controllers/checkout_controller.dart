import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/buy_xau/response_post_checkout_model.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/modules/buy_xau/controllers/buy_xau_controller.dart';
import 'package:flutter_xaurius/app/data/model/buy_xau/response_checkout_model.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  BuyXauController buyController = Get.put(BuyXauController());
  final GlobalKey<FormState> checkOutKey = GlobalKey<FormState>();
  final auth = Get.find<AuthController>();
  ApiRepository _repo = ApiRepository();
  TextEditingController walletController, voucherController;
  var responseCheckOut = ResponseCheckOut().obs;
  var responsePostCheckOut = ResponsePostCheckOut().obs;
  var listVaMerchant = List<VaMerchant>().obs;

  var isLoading = false.obs;
  var isTimeout = false.obs;
  var isNoConnection = false.obs;
  var isLoadingForm = false.obs;
  var isTimeoutForm = false.obs;
  var isNoConnectionForm = false.obs;
  var ethAddress = '0xaaca2da0026c41fd49bd0636fbd67cf704e34b1d';
  var bscAddress = '0xda6bb3cebbed2b1a68b4a3b7e5eb40cc280e3935';

  var buyId = ''.obs;
  int merchantId = 349;

  @override
  void onInit() {
    walletController = TextEditingController();
    voucherController = TextEditingController();
    buyId.value = Get.arguments;
    getCheckOut();
    super.onInit();
  }

  @override
  void onClose() {
    walletController.dispose();
    voucherController.dispose();
    super.onClose();
  }

  void onChangeMerchant(valueChange) {
    merchantId = valueChange;
    update();
  }

  void getCheckOut() async {
    isLoading(true);
    final resp = await _repo.getCheckout(buyId.value.toString(), auth.token);
    if (resp.success) {
      responseCheckOut.value = resp;
      listVaMerchant.value = resp.data.vaMerchants;
      successSnackbar('Sukses', responseCheckOut.value.data.buy.buyUnitPrice);

      update();
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  void postCheckOut() async {
    isLoadingForm(true);
    final resp = await _repo.postCheckout(buyId.value.toString(), walletController.text, merchantId, voucherController.text, auth.token);
    if (resp.success) {
      Get.toNamed(Routes.INVOICE, arguments: responseCheckOut.value.data.buy.invoiceId);
      successSnackbar('Sukses', resp.message);

      update();
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoadingForm(false);
  }

  void checkCheckOut() {
    final isValid = checkOutKey.currentState.validate();
    if (!isValid) {
      return;
    }
    checkOutKey.currentState.save();
    postCheckOut();
  }
}
