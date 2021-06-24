import 'package:get/get.dart';

import '../controllers/chart_view_controller.dart';

class ChartViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartViewController>(
      () => ChartViewController(),
    );
  }
}
