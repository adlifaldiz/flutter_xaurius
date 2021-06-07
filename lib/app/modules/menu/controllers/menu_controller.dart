import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter_xaurius/app/modules/history/views/history_view.dart';
import 'package:flutter_xaurius/app/modules/setting/views/setting_view.dart';
import 'package:flutter_xaurius/app/modules/transaction/views/transaction_view.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  final _auth = Get.find<AuthController>();
  PageController pageController = PageController();

  List<Widget> screens = [
    DashboardView(),
    TransactionView(),
    HistoryView(),
    SettingView(),
  ];

  var currentIndex = 0.obs;

  @override
  void onInit() {
    _auth.getProfileData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onPageChange(int index) {
    currentIndex.value = index;
    update();
  }

  void onItemSelected(int index) {
    currentIndex.value = index;
    update();
  }
}
