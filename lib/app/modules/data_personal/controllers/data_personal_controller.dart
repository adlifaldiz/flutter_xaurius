import 'dart:async';

import 'package:country_currency_pickers/country_pickers.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:intl/intl.dart';

import 'package:country_currency_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataPersonalController extends GetxController {
  final provider = ApiRepository();
  final auth = Get.find<AuthController>();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  Country selectedCupertinoCurrency;
  var isLoading = false.obs;

  RxBool get isKycStatus => (auth.userData.orangKycStatus == 'verified').obs;
  RxBool get isKycReview => auth.userData.orangKycAskForReview.obs;

  TextEditingController namaControl = TextEditingController();
  TextEditingController nomorControl = TextEditingController();
  TextEditingController tanggalControl = TextEditingController();
  TextEditingController alamatControl = TextEditingController();
  TextEditingController kotaControl = TextEditingController();
  TextEditingController kodePosControl = TextEditingController();
  TextEditingController negaraControl = TextEditingController();


  @override
  void onInit() {
    selectedCupertinoCurrency = CountryPickerUtils.getCountryByIsoCode('ID');
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future kycPersonalData() async {
    isLoading(true);
    final resp = await provider.kycPersonalData(
      namaControl.text,
      nomorControl.text,
      tanggalControl.text,
      alamatControl.text,
      kotaControl.text,
      kodePosControl.text,
      negaraControl.text,
      auth.token,
    );
    if (resp.success) {
      successSnackbar('Sukses', 'Berhasil melengkapi data kyc tahap pertama');
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }
}
