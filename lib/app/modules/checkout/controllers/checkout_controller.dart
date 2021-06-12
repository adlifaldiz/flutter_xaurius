import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/buy_xau/response_post_checkout_model.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/modules/buy_xau/controllers/buy_xau_controller.dart';
import 'package:flutter_xaurius/app/data/model/buy_xau/response_checkout_model.dart';
import 'package:flutter_xaurius/app/modules/gold_price/controllers/gold_price_controller.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final goldPriceController = Get.find<GoldPriceController>();

  final GlobalKey<FormState> checkOutKey = GlobalKey<FormState>();
  final auth = Get.find<AuthController>();
  ApiRepository _repo = ApiRepository();
  TextEditingController walletController;
  var responseCheckOut = ResponseCheckOut().obs;
  var responsePostCheckOut = ResponsePostCheckOut().obs;
  var listVaMerchant = <VaMerchant>[].obs;

  var isLoading = false.obs;
  var isTimeout = false.obs;
  var isNoConnection = false.obs;
  var isLoadingForm = false.obs;
  var isTimeoutForm = false.obs;
  var isNoConnectionForm = false.obs;
  var ethAddress = '0xaaca2da0026c41fd49bd0636fbd67cf704e34b1d';
  var bscAddress = '0xda6bb3cebbed2b1a68b4a3b7e5eb40cc280e3935';

  var buyId = ''.obs;
  var merchantId = 349.obs;
  var voucherCode = ''.obs;
  var useVoucher = false.obs;

  @override
  void onInit() {
    walletController = TextEditingController();
    buyId.value = Get.arguments;
    checkVoucher();
    getCheckOut();
    super.onInit();
  }

  @override
  void onClose() {
    walletController.dispose();
    super.onClose();
  }

  void onChangeMerchant(valueChange) {
    merchantId = valueChange;
    update();
  }

  void checkVoucher() {
    if (auth.userVouchers.isEmpty) {
      voucherCode.value = '';
    } else {
      voucherCode.value = auth.userVouchers[0].voucherCode;
    }
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

  void postCheckOut(String voucherValue) async {
    isLoadingForm(true);
    final resp = await _repo.postCheckout(buyId.value.toString(), walletController.text, merchantId.value, voucherValue, auth.token);

    if (resp.success) {
      responsePostCheckOut.value = resp;
      successSnackbar('Sukses', 'Berhasil memuat invoice');
      Get.toNamed(Routes.INVOICE, arguments: {
        'invoiceId': responsePostCheckOut.value.data.buy.invoiceId,
      });
      goldPriceController.getBuys();
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
    String _voucherValue = '';

    if (!useVoucher.value) {
      _voucherValue = '';
    } else {
      _voucherValue = voucherCode.value.toString();
    }
    if (!isValid) {
      return;
    }
    checkOutKey.currentState.save();
    postCheckOut(_voucherValue);
  }

  void onVoucherChange(bool value) {
    useVoucher.value = value;
    update();
  }
}
