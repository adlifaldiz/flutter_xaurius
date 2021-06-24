import 'package:flutter_xaurius/app/data/model/depoidr_data/depoird_data.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class TopupHistoryController extends GetxController {
  ApiRepository _repo = ApiRepository();
  final auth = Get.find<AuthController>();
  var listTopTup = <Depoidr>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    getTopUp();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void getTopUp() async {
    isLoading(true);
    final resp = await _repo.getTopUp(auth.token);
    if (resp.success) {
      listTopTup(resp.data.depoidrs);
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  Future onRefresh() async {
    getTopUp();
    update();
  }
}
