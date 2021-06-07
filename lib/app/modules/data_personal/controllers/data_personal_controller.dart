import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DataPersonalController extends GetxController {
  // KycController kycController = Get.put(KycController());
  final GlobalKey<FormState> kyc1Key = GlobalKey<FormState>();
  ApiRepository _repo = ApiRepository();
  final auth = Get.find<AuthController>();
  var isLoading = false.obs;

  TextEditingController namaControl;
  TextEditingController nomorControl;
  TextEditingController tanggalControl;
  TextEditingController alamatControl;
  TextEditingController kotaControl;
  TextEditingController kodePosControl;
  TextEditingController negaraControl;

  DateFormat formatter = DateFormat('yyyy-MM-dd');
  Country selectedCupertinoCurrency;

  var nama = '';
  var phone = '';
  var birthDate = '';
  var addressStreet = '';
  var addressCity = '';
  var addressPostal = '';
  var addressCountry = '';

  @override
  void onInit() {
    setTextController();
    selectedCupertinoCurrency = CountryPickerUtils.getCountryByIsoCode('ID');
    auth.getProfileData();
    setTextValue();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setTextController() {
    namaControl = TextEditingController();
    nomorControl = TextEditingController();
    tanggalControl = TextEditingController();
    alamatControl = TextEditingController();
    kotaControl = TextEditingController();
    kodePosControl = TextEditingController();
    negaraControl = TextEditingController();
  }

  void setTextValue() {
    namaControl.text = auth.userData.orangName;
    nomorControl.text = auth.userData.orangPhone;
    if (auth.userData.orangBirthday == null || auth.userData.orangBirthday.isEmpty) {
      tanggalControl.text = auth.userData.orangBirthday;
    } else {
      birthDate = auth.userData.orangBirthday;
      tanggalControl.text = formatter.format(DateTime.parse(birthDate));
    }
    alamatControl.text = auth.userData.orangAddrStreet;
    kotaControl.text = auth.userData.orangAddrCity;
    kodePosControl.text = auth.userData.orangAddrPostal;
    negaraControl.text = auth.userData.orangAddrCountry;
  }

  void checkPersonalData() {
    final isValid = kyc1Key.currentState.validate();
    if (!isValid) {
      return;
    }
    kyc1Key.currentState.save();
    postPersonalData();
  }

  void postPersonalData() async {
    isLoading(true);
    var resp = await _repo.kycPersonalData(namaControl.text, nomorControl.text, tanggalControl.text, alamatControl.text, kotaControl.text,
        kodePosControl.text, negaraControl.text, auth.token);
    if (resp.success) {
      onInit();
      Get.back();
      successSnackbar('Berhasil', 'Kamu berhasil melengkapi data personal');
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }
}
