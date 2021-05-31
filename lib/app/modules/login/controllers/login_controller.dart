import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  ApiRepository()

  final count = 0.obs;
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
  void increment() => count.value++;
}
