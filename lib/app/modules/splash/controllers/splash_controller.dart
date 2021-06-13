import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final storage = GetStorage();
  bool isUserLogged = false;
  bool isUserBoarding = false;
  @override
  void onInit() {
    isUserLogged = storage.read('username') != null ? true : false;
    isUserBoarding = storage.read('isBoarding') != null ? true : false;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
