import 'dart:async';

import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';

class DataPersonalController extends GetxController {
  final provider = ApiRepository();
  final auth = Get.find<AuthController>();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  Country selectedCountry, selectedPhoneCode;
  var isLoading = false.obs;
  var codePhone = ''.obs;
  var phoneNumber = ''.obs;

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
    selectedCountry = CountryPickerUtils.getCountryByIsoCode('ID');
    selectedPhoneCode = CountryPickerUtils.getCountryByIsoCode('ID');
    setText();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setText() {
    namaControl.text = auth.userData.orangName;
    nomorControl.text = auth.userData.orangPhone;

    if (auth.userData.orangBirthday == null || auth.userData.orangBirthday.isEmpty) {
      tanggalControl.text = auth.userData.orangBirthday;
    } else {
      DateTime tempDate = DateTime.parse(auth.userData.orangBirthday);
      tanggalControl.text = formatter.format(tempDate);
    }
    alamatControl.text = auth.userData.orangAddrStreet;
    kotaControl.text = auth.userData.orangAddrCity;
    kodePosControl.text = auth.userData.orangAddrPostal;
    auth.userData.orangAddrCountry != null ? negaraControl.text = auth.userData.orangAddrCountry : negaraControl.text = selectedCountry.isoCode;
    codePhone.value = selectedCountry.phoneCode;
    update();
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
      auth.getProfileData();
      Get.toNamed(Routes.UPLOAD_DOCUMENT);
      successSnackbar('succes_alert'.tr, 'suc_pd'.tr);
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  // onPhoneNumberChange(String value) {
  //   if (value[0] == '0') {
  //     nomorControl.text = value.replaceAll('0', '');
  //     nomorControl.selection = TextSelection.fromPosition(TextPosition(offset: nomorControl.text.length));
  //   }
  // }
}
