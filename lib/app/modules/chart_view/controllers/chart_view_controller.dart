import 'package:flutter_xaurius/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChartViewController extends GetxController {
  var dashboard = Get.find<DashboardController>();
  DateFormat formatter = DateFormat('yyyy-MM-dd');

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
}
