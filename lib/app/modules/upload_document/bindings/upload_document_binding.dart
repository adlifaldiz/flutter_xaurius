import 'package:get/get.dart';

import '../controllers/upload_document_controller.dart';

class UploadDocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadDocumentController>(
      () => UploadDocumentController(),
    );
  }
}
