import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/widget/coming_soon.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  var appData = GetStorage();

  void logout() {
    appData.erase();
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void router(id) {
    switch (id) {
      case 1:
        //setting profile
        Get.toNamed(Routes.PROFILE);
        break;
      case 2:
        //bank account
        Get.toNamed(Routes.BANK);
        break;
      case 3:
        //setting referal
        Get.to(ComingSoonScreen());
        break;
      case 4:
        //voucher
        Get.toNamed(Routes.VOUCHER);
        break;
      case 5:
        //FAQ
        Get.toNamed(Routes.FAQ);
        break;
      case 6:
        //TNC
        Get.toNamed(Routes.TNC);
        break;
      case 7:
        //privacy
        Get.toNamed(Routes.PRIVACY_POLICY);
        break;
      case 8:
        //system setting
        Get.toNamed(Routes.SYSTEM);
        break;
    }
  }
}
