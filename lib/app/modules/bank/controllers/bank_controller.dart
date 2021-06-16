import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class BankController extends GetxController {
  final auth = Get.find<AuthController>();
  final _repo = ApiRepository();
  var isLoading = false.obs;

  TextEditingController namaBankControl = TextEditingController();
  TextEditingController namaAkunControl = TextEditingController();
  TextEditingController nomorAkunControl = TextEditingController();

  @override
  void onInit() {
    auth.getProfileData();
    checkBank();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void checkBank() {
    namaBankControl.text = auth.userData.orangBankName;
    namaAkunControl.text = auth.userData.orangBankHolder;
    nomorAkunControl.text = auth.userData.orangBankNumber;
    update();
  }

  Future updateBank() async {
    isLoading(true);
    final resp = await _repo.updateBankProfile(auth.token, namaBankControl.text, namaAkunControl.text, nomorAkunControl.text);
    if (resp.success) {
      successSnackbar('Sukses', 'Berhasil menambahkan data bank');
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }
}
