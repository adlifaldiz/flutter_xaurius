import 'package:get/get.dart';

import '../controllers/document_identity_controller.dart';

class DocumentIdentityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentIdentityController>(
      () => DocumentIdentityController(),
    );
  }
}
