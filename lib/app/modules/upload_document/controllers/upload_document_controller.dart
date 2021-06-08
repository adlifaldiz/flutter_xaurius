import 'dart:async';
import 'dart:io';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:intl/intl.dart';

import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/auth/user_resp.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadDocumentController extends GetxController {
  final _repo = ApiRepository();
  final auth = Get.find<AuthController>();
  final GlobalKey<FormState> kyc2Key = GlobalKey<FormState>();

  DateFormat formatter = DateFormat('yyyy-MM-dd');
  Country selectedCupertinoCurrency;

  var isLoading = false.obs;

  var isBuy = true.obs;
  var isKycStatus = true.obs;
  var isKycReview = false.obs;

  var valueId = 2;

  String valueIdType = 'KTP';

  var selectedImagePathKtp = ''.obs;
  var selectedImageNetworkKtp = ''.obs;
  var selectedImagePathNpwp = ''.obs;
  var selectedImageNetworkNpwp = ''.obs;

  File ktpPath;
  File npwpPath;

  //kyc2
  TextEditingController nomorKTP = TextEditingController();
  TextEditingController nomorNPWP = TextEditingController();

  @override
  void onInit() {
    selectedCupertinoCurrency = CountryPickerUtils.getCountryByIsoCode('ID');
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future kycDocument(idType) async {
    isLoading(true);
    final resp = await _repo.kycDocument(
        idType, nomorKTP.text, File(selectedImagePathKtp.value), nomorNPWP.text, File(selectedImagePathNpwp.value), auth.token);
    if (resp.success) {
      successSnackbar('Sukses', 'Berhasil melengkapi data kyc tahap pertama');
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  void checkIdentity() {
    final isValid = kyc2Key.currentState.validate();
    if (valueId == 1) {
      valueIdType = 'KTP';
    } else {
      valueIdType = 'Passport';
    }

    if (selectedImagePathKtp.value.isEmpty) {
      failSnackbar('KTP', 'Foto identitas belum kamu pilih');
    } else if (selectedImagePathNpwp.isEmpty) {
      failSnackbar('NPWP', 'Foto NPWP belum kamu pilih');
    } else {
      if (isValid) {
        kyc2Key.currentState.save();
        kycDocument(valueIdType);
      } else {
        failSnackbar('Form', 'Form tidak valid');
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
