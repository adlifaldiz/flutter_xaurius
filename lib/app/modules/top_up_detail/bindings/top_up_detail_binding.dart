import 'package:flutter_xaurius/app/modules/top_up/controllers/top_up_controller.dart';
import 'package:get/get.dart';

import '../controllers/top_up_detail_controller.dart';

class TopUpDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopUpDetailController>(() => TopUpDetailController());
    Get.lazyPut<TopUpController>(() => TopUpController());
  }
}
