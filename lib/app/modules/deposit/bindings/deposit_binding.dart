import 'package:flutter_xaurius/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

import '../controllers/deposit_controller.dart';

class DepositBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DepositController>(() => DepositController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
