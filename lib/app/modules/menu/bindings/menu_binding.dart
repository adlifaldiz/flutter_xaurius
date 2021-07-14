import 'package:flutter_xaurius/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_xaurius/app/modules/history/controllers/history_controller.dart';
import 'package:flutter_xaurius/app/modules/setting/controllers/setting_controller.dart';
import 'package:flutter_xaurius/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:get/get.dart';

import '../controllers/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuController>(() => MenuController());
    Get.put<DashboardController>(DashboardController());
    Get.put<TransactionController>(TransactionController());
    Get.put<HistoryController>(HistoryController());
    Get.put<SettingController>(SettingController());
  }
}
