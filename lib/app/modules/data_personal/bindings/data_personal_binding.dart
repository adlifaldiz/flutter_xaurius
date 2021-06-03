import 'package:get/get.dart';

import '../controllers/data_personal_controller.dart';

class DataPersonalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataPersonalController>(
      () => DataPersonalController(),
    );
  }
}
