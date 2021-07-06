import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final storage = GetStorage();
  bool isUserLogged = false;
  bool isUserBoarding = false;
  var isLoading = false.obs;
  var duration = Duration(milliseconds: 1500);

  @override
  void onInit() {
    isUserLogged = storage.read('username') != null ? true : false;
    isUserBoarding = storage.read('isBoarding') != null ? true : false;
    waitOpacity();
    onSplashLoad();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void waitOpacity() {
    Future.delayed(Duration(milliseconds: 300)).then((value) {
      isLoading.value = true;
    });
  }

  void onSplashLoad() {
    Future.delayed(Duration(milliseconds: 5000)).then((value) {
      if (isUserLogged && isUserBoarding) {
        Get.offAllNamed(Routes.DEPOSIT);
      } else if (isUserLogged == false && isUserBoarding) {
        Get.offAllNamed(Routes.DEPOSIT);
      } else {
        Get.offAllNamed(Routes.DEPOSIT);
      }
    });
  }
}
