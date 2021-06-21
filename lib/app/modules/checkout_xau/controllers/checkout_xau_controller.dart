import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/modules/buy_xau/controllers/buy_xau_controller.dart';
import 'package:flutter_xaurius/helper/dialog_utils.dart';
import 'package:flutter_xaurius/model/buys/response_checkout_model.dart';
import 'package:flutter_xaurius/model/buys/response_post_checkout_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:get/get.dart';

class CheckoutXauController extends GetxController {
  BuyXauController buyController = Get.put(BuyXauController());
  final GlobalKey<FormState> checkOutKey = GlobalKey<FormState>();
  ApiProvider provider = ApiProvider();
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

  var buyme = ''.obs;
  int merchantId = 349;

  @override
  void onInit() {
    walletController = TextEditingController();
    voucherController = TextEditingController();
    getCheckOut();
    print('==========================> getCheckOut()');

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
    try {
      var checkOut = await provider.getCheckOut(buyController.responseCreateBuy.value.data.buy.id.toString());
      if (checkOut == null) {
        responseCheckOut.value.success = false;
        responseCheckOut.value.msg = 'Terjadi masalah';
      } else {
        responseCheckOut.value = checkOut;
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
      if (responseCheckOut.value.success) {
        listVaMerchant.value = responseCheckOut.value.data.vaMerchants;
        update();
      } else {
        failSnackbar('Fail', responseCheckOut.value.msg);
      }
      update();
    }
    update();
  }

  void postCheckOut() async {
    isLoadingForm(true);
    try {
      var postCheckOut = await provider.postCheckOut(responseCheckOut.value.data.buy.id.toString(),
          responseCheckOut.value.data.buy.orangId.toString(), walletController.value.text, merchantId.toString(), voucherController.value.text);
      if (postCheckOut == null) {
        responsePostCheckOut.value.success = false;
        responsePostCheckOut.value.msg = 'Terjadi masalah';
      } else {
        responsePostCheckOut.value = postCheckOut;
      }
    } on TimeoutException {
      isTimeoutForm(true);
      isLoadingForm(false);
      dialogConnection('Oops', 'Waktu habis', () {
        Get.back();
        isTimeoutForm(false);
      });
    } on SocketException {
      isNoConnectionForm(true);
      isLoadingForm(false);
      dialogConnection('Oops', 'Tidak ada koneksi internet', () {
        Get.back();
        isNoConnectionForm(false);
      });
    } finally {
      isLoadingForm(false);
      isTimeoutForm(false);
      isNoConnectionForm(false);
      if (responsePostCheckOut.value.success) {
        successSnackbar('Sukses', responsePostCheckOut.value.msg);

        update();
      } else {
        failSnackbar('Fail', responsePostCheckOut.value.msg);
      }
      update();
    }
    update();
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
