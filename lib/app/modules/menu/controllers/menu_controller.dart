import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_xaurius/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter_xaurius/app/modules/history/controllers/history_controller.dart';
import 'package:flutter_xaurius/app/modules/history/views/history_view.dart';
import 'package:flutter_xaurius/app/modules/setting/controllers/setting_controller.dart';
import 'package:flutter_xaurius/app/modules/setting/views/setting_view.dart';
import 'package:flutter_xaurius/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:flutter_xaurius/app/modules/transaction/views/transaction_view.dart';
import 'package:flutter_xaurius/app/widget/keep_alive_page.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  final _auth = Get.find<AuthController>();
  // final dash = Get.put<DashboardController>(DashboardController());
  // final trans = Get.put<TransactionController>(TransactionController());
  // final hist = Get.put<HistoryController>(HistoryController());
  // final sett = Get.put<SettingController>(SettingController());

  var currentIndex = 0.obs;
  PageController pageController;

  List<Widget> screens = [
    KeepAlivePage(child: DashboardView()),
    KeepAlivePage(child: TransactionView()),
    KeepAlivePage(child: HistoryView()),
    KeepAlivePage(child: SettingView()),
  ];

  @override
  void onInit() {
    _auth.getProfileData();
    pageController = PageController(initialPage: currentIndex.value);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onPageChange(index) {
    currentIndex.value = index;
    update();
  }

  void onItemSelected(index) async {
    currentIndex.value = index;
    update();
  }
}
