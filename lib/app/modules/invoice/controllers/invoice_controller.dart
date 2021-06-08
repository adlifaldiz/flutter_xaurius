import 'dart:async';
import 'dart:io';

import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/data/model/buy_xau/response_detail_invoice_model.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:get/get.dart';

class InvoiceController extends GetxController {
  ApiRepository _repo = ApiRepository();
  final auth = Get.find<AuthController>();
  var responseDetailInvoice = ResponseDetailInvoice().obs;
  var invoiceNumber;
  var isLoading = false.obs;
  var isTimeout = false.obs;
  var isNoConnection = false.obs;

  @override
  void onInit() {
    invoiceNumber = Get.arguments;
    getDetailInvoice();
    // successSnackbar('title', invoiceNumber.toString());
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getDetailInvoice() async {
    isLoading(true);
    final resp = await _repo.getInvoice(invoiceNumber.toString(), auth.token);
    if (resp.success) {
      responseDetailInvoice.value = resp;
      successSnackbar('Sukses', resp.message);
      update();
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }
}
