import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/modules/menus/dashboard/views/dashboard_view.dart';
import 'package:flutter_xaurius/app/modules/menus/history/views/history_view.dart';
import 'package:flutter_xaurius/app/modules/menus/settings/views/settings_view.dart';
import 'package:flutter_xaurius/app/modules/menus/transaction/views/transaction_view.dart';

import 'package:get/get.dart';

class MenusController extends GetxController {
  PageController pageController = PageController();

  List<Widget> screens = [
    DashboardView(),
    TransactionView(),
    HistoryView(),
    SettingsView(),
  ];

  var currentIndex = 0.obs;

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

  void onPageChange(int index) {
    currentIndex.value = index;
    update();
  }

  void onItemSelected(int index) {
    currentIndex.value = index;
    update();
  }
}
