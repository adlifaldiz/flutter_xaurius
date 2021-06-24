import 'dart:async';
import 'dart:io';

import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/modules/menu/views/menu_view.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';

class UploadDocumentController extends GetxController {
  final _repo = ApiRepository();
  final auth = Get.find<AuthController>();
  final GlobalKey<FormState> kyc2Key = GlobalKey<FormState>();

  DateFormat formatter = DateFormat('yyyy-MM-dd');
  Country selectedCupertinoCurrency;

  List<String> listIdType = ['KTP', 'Passport'];

  var isLoading = false.obs;
  var useNpwp = false.obs;

  var valueIdType = 'KTP'.obs;

  var selectedImagePathKtp = ''.obs;
  var selectedImageNetworkKtp = ''.obs;
  var selectedImagePathNpwp = ''.obs;
  var selectedImageNetworkNpwp = ''.obs;

  File ktpPath;
  File npwpPath;

  //kyc2
  TextEditingController nomorKTP;
  TextEditingController nomorNPWP;

  @override
  void onInit() {
    selectedCupertinoCurrency = CountryPickerUtils.getCountryByIsoCode('ID');
    setTextControlelr();
    setText();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setTextControlelr() {
    nomorKTP = TextEditingController();
    nomorNPWP = TextEditingController();
  }

  void onNpwpChange(bool value) {
    useNpwp.value = value;
    update();
  }

  void setText() {
    if (auth.userData.orangIdType == null || auth.userData.orangIdType.isEmpty) {
      valueIdType.value = listIdType.first;
    } else {
      valueIdType.value = auth.userData.orangIdType;
    }
    nomorKTP.text = auth.userData.orangIdNum;
    nomorNPWP.text = auth.userData.orangNpwpNum;
    auth.userData.orangIdFile.url != null ? selectedImageNetworkKtp.value = auth.userData.orangIdFile.url : selectedImageNetworkKtp.value = '';
    auth.userData.orangNpwpFile.url != null ? selectedImageNetworkNpwp.value = auth.userData.orangNpwpFile.url : selectedImageNetworkNpwp.value = '';
    update();
  }

  Future kycDocument() async {
    isLoading(true);
    final resp = await _repo.kycDocument(valueIdType.value.toString(), nomorKTP.text, File(selectedImagePathKtp.value), nomorNPWP.text,
        selectedImagePathNpwp.value == '' ? '' : File(selectedImagePathNpwp.value), auth.token);
    if (resp.success) {
      onInit();
      auth.getProfileData();
      Get.back();
      Get.back();
      successSnackbar('success'.tr, 'suc_ud'.tr);
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  void checkIdentity() {
    final isValid = kyc2Key.currentState.validate();

    if (selectedImagePathKtp.value.isEmpty) {
      failSnackbar('ID', 'id_pict'.tr);
    } else if (nomorNPWP.text.isNotEmpty && selectedImagePathNpwp.isEmpty) {
      failSnackbar('NPWP', 'npwp_pict'.tr);
    } else if (selectedImagePathNpwp.isNotEmpty && nomorNPWP.text.isEmpty) {
      return;
    } else if (selectedImageNetworkNpwp.isNotEmpty && nomorNPWP.text.isEmpty) {
      return;
    } else {
      if (isValid) {
        kyc2Key.currentState.save();
        kycDocument();
      } else {
        return;
      }
    }
  }

  void takeImageKTP() async {
    try {
      final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImagePathKtp.value = pickedFile.path;
        print('image selected.');
      } else {
        failSnackbar('Fail', 'Kamu belum memilih foto');
        print('No image selected.');
      }
      update();
    } catch (e) {
      failSnackbar('Fail', 'Terjadi Kesalahan $e');
    }
  }

  void takeImageNPWP() async {
    try {
      final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImagePathNpwp.value = pickedFile.path;
        print('image selected.');
      } else {
        failSnackbar('Fail', 'Kamu belum memilih foto');
        print('No image selected.');
      }
      update();
    } catch (e) {
      failSnackbar('Fail', 'Terjadi Kesalahan $e');
    }
  }
}
