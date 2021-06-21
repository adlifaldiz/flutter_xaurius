import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/service/localization_service.dart';
import 'package:get/get.dart';

class SystemController extends GetxController {
  var lightMode = false.obs;
  var langValue = ''.obs;

  @override
  void onInit() {
    langValue.value = LocalizationService().getCurrentLang();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onSwitchChange(bool value) {
    lightMode.value = value;
  }

  void onLangChange(newValue) {
    langValue.value = newValue;
    LocalizationService().changeLocale(newValue);
    update();
  }
}
