import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/dialog_utils.dart';
import 'package:flutter_xaurius/model/kyc/response_kyc_1_model.dart';
import 'package:flutter_xaurius/model/kyc/response_kyc_2_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:get/get.dart';

class KycController extends GetxController {
  final GlobalKey<FormState> kyc1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> kyc2Key = GlobalKey<FormState>();

  DateFormat formatter = DateFormat('yyyy-MM-dd');
  Country selectedCupertinoCurrency;

  ApiProvider provider = ApiProvider();
  var kycResponse = ResponseKyc1().obs;
  var kyc2Response = ResponseKyc2().obs;

  var isLoading = false.obs;
  var isTimeout = false.obs;
  var isNoConnection = false.obs;
  var isLoadingForm = false.obs;
  var isTimeoutForm = false.obs;
  var isNoConnectionForm = false.obs;

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

  RxString nama = ''.obs;
  RxString email = ''.obs;
  DateTime tempDate;
  TextEditingController namaControl = TextEditingController();
  TextEditingController nomorControl = TextEditingController();
  TextEditingController tanggalControl = TextEditingController();
  TextEditingController alamatControl = TextEditingController();
  TextEditingController kotaControl = TextEditingController();
  TextEditingController kodePosControl = TextEditingController();
  TextEditingController negaraControl = TextEditingController();

  //kyc2
  TextEditingController nomorKTP = TextEditingController();
  TextEditingController nomorNPWP = TextEditingController();

  TextEditingController namaBankControl = TextEditingController();
  TextEditingController namaAkunControl = TextEditingController();
  TextEditingController nomorAkunControl = TextEditingController();

  @override
  void onInit() {
    checkKyc1();
    selectedCupertinoCurrency = CountryPickerUtils.getCountryByIsoCode('ID');
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onChangeIdType(valueIdInt) {
    valueId = valueIdInt;
  }

  Future checkKyc1() async {
    isLoading(true);
    try {
      var kyc1 = await provider.getKyc1();
      if (kyc1 == null) {
        kycResponse.value.success = false;
        kycResponse.value.msg = 'Terjadi masalah';
      } else {
        kycResponse.value = kyc1;
      }
    } on TimeoutException {
      isTimeout(true);
      isLoading(false);
      dialogConnection('Oops', 'Waktu habis', () {
        Get.back();
        isNoConnection(false);
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
      if (kycResponse.value.success) {
        email(kycResponse.value.data.orang.orangEmail);
        isKycStatus(kycResponse.value.data.orang.orangKycEditAvailable);
        isKycReview(kycResponse.value.data.orang.orangKycAskForReview);

        nama(kycResponse.value.data.orang.orangName);

        tempDate = DateTime.parse(kycResponse.value.data.orang.orangBirthday);

        namaControl.text = kycResponse.value.data.orang.orangName;
        nomorControl.text = kycResponse.value.data.orang.orangPhone;
        tanggalControl.text = formatter.format(tempDate);
        alamatControl.text = kycResponse.value.data.orang.orangAddrStreet;
        kotaControl.text = kycResponse.value.data.orang.orangAddrCity;
        kodePosControl.text = kycResponse.value.data.orang.orangAddrPostal;
        negaraControl.text = kycResponse.value.data.orang.orangAddrCountry;
        nomorKTP.text = kycResponse.value.data.orang.orangIdNum;
        nomorNPWP.text = kycResponse.value.data.orang.orangNpwpNum;
        namaAkunControl.text = kycResponse.value.data.orang.orangBankHolder;
        namaBankControl.text = kycResponse.value.data.orang.orangBankName;
        nomorAkunControl.text = kycResponse.value.data.orang.orangBankNumber;
        valueIdType = kycResponse.value.data.orang.orangIdType;
        selectedImageNetworkKtp.value = kycResponse.value.data.orang.orangIdFile.url;
        selectedImageNetworkNpwp.value = kycResponse.value.data.orang.orangNpwpFile.url;

        if (valueIdType == 'KTP') {
          valueId = 1;
          update();
        } else {
          valueId = 2;
          update();
        }
        update();
      } else {
        failSnackbar('Fail', kycResponse.value.msg);
      }
    }
    update();
  }

  Future postKyc1() async {
    isLoadingForm(true);
    try {
      var kyc1 = await provider.kyc1(
        namaControl.text,
        nomorControl.text,
        tanggalControl.text,
        alamatControl.text,
        kotaControl.text,
        kodePosControl.text,
        negaraControl.text,
      );
      if (kyc1 == null) {
        kycResponse.value.success = false;
        kycResponse.value.msg = 'Terjadi masalah';
      } else {
        kycResponse.value = kyc1;
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

  Future postKyc2(idType) async {
    isLoadingForm(true);
    try {
      var kyc2 = await provider.kyc2(idType, nomorKTP.text, File(selectedImagePathKtp.value), nomorNPWP.text, File(selectedImagePathNpwp.value));
      if (kyc2 == null) {
        kyc2Response.value.success = false;
        kyc2Response.value.msg = 'Terjadi masalah';
      } else {
        kyc2Response.value = kyc2;
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
      if (kyc2Response.value.success) {
        successSnackbar('Sukses', 'Berhasil melengkapi data kyc tahap pertama');
      } else {
        failSnackbar('Fail', kyc2Response.value.msg);
      }
    }
    update();
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
        postKyc2(valueIdType);
      } else {
        return;
        // failSnackbar('Form', 'Form tidak valid');
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
        successSnackbar('Fail', 'Kamu belum memilih foto');
        print('No image selected.');
      }
      update();
    } catch (e) {
      log(e.toString());
    }
  }

  void takeImageNPWP() async {
    try {
      final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImagePathNpwp.value = pickedFile.path;
        print('image selected.');
      } else {
        successSnackbar('Fail', 'Kamu belum memilih foto');
        print('No image selected.');
      }
      update();
    } catch (e) {
      log(e.toString());
    }
  }
}
