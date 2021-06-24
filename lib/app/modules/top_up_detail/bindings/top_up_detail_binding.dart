import 'package:get/get.dart';

import '../controllers/top_up_detail_controller.dart';

class TopUpDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopUpDetailController>(
      () => TopUpDetailController(),
    );
  }
}
