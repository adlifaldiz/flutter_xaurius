import 'dart:async';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/data/model/buy_xau/response_buys_model.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class GoldPriceController extends GetxController {
  final auth = Get.find<AuthController>();
  final _repo = ApiRepository();

  var buysResponse = ResponseBuys().obs;
  var listBuys = <Buy>[].obs;

  var isLoading = false.obs;
  var buyPrice = '';
  var sellPrice = '';

  @override
  void onInit() {
    getBuys();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getBuys() async {
    isLoading(true);
    final resp = await _repo.getBuys(auth.token);
    if (resp.success) {
      buysResponse(resp);
      buyPrice = resp.data.currentGoldPrice.buy.toString();
      sellPrice = resp.data.currentGoldPrice.sell.toString();
      listBuys(resp.data.buys);
      update();
    } else {
      dialogConnection('Oops', resp.msg, () {
        Get.back();
      });
    }
    isLoading(false);
  }
}
