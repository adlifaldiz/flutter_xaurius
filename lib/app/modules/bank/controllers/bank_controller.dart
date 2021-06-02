import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/controller/kyc_controller.dart';
import 'package:flutter_xaurius/helper/dialog_utils.dart';
import 'package:flutter_xaurius/model/kyc/response_kyc_1_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';


class BankController extends GetxController {
  KycController kycController = Get.put(KycController());
  final GlobalKey<FormState> bankKey = GlobalKey<FormState>();
  ApiProvider provider = ApiProvider();
  var kycResponse = ResponseKyc1().obs;

  var isLoadingForm = false.obs;
  var isTimeoutForm = false.obs;
  var isNoConnectionForm = false.obs;

  TextEditingController namaBankControl = TextEditingController();
  TextEditingController namaAkunControl = TextEditingController();
  TextEditingController nomorAkunControl = TextEditingController();

  @override
  void onInit() {
    kycController.checkKyc1();
    checkBank();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkBank() {
    namaBankControl.text = kycController.namaBankControl.text;
    namaAkunControl.text = kycController.namaAkunControl.text;
    nomorAkunControl.text = kycController.nomorAkunControl.text;
    update();
  }

  Future postBank() async {
    isLoadingForm(true);
    try {
      var bankPost = await provider.bank(namaBankControl.text, namaAkunControl.text, nomorAkunControl.text);
      if (bankPost == null) {
        kycResponse.value.success = false;
        kycResponse.value.msg = 'Terjadi masalah';
      } else {
        kycResponse.value = bankPost;
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
      if (kycResponse.value.success) {
        successSnackbar('Sukses', 'Berhasil melengkapi data kyc tahap pertama');
      } else {
        failSnackbar('Fail', kycResponse.value.msg);
      }
    }
    update();
  }

  void checkPostBank() {
    final isValid = bankKey.currentState.validate();

    if (!isValid) {
      return;
    }
    bankKey.currentState.save();
    postBank();
  }
}
