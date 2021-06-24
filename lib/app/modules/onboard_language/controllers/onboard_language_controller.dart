import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/service/localization_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardLanguageController extends GetxController {
  final appData = GetStorage();
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

  void onLangChange(newValue) {
    langValue.value = newValue;
    LocalizationService().changeLocale(newValue);
    update();
  }

  void onProceed() {
    appData.write('isBoarding', 'onBoarding');
    Get.offAllNamed(Routes.LOGIN);
  }
}
