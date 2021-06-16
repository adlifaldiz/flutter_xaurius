import 'dart:async';

import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/data/model/buy_xau/resp_detail_invoice/resp_det_invoice.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_xaurius/app/modules/gold_price/controllers/gold_price_controller.dart';
import 'package:flutter_xaurius/app/modules/history/controllers/history_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InvoiceController extends GetxController {
  ApiRepository _repo = ApiRepository();
  final auth = Get.find<AuthController>();
  final dash = Get.find<DashboardController>();
  final buys = Get.find<HistoryController>();
  var responseDetailInvoice = ResponseDetailInvoice().obs;
  var invoiceNumber;
  var isLoading = false.obs;
  var isLoadingForm = false.obs;
  var fromBuy = false.obs;
  var formattedDate = ''.obs;

  @override
  void onInit() {
    invoiceNumber = Get.arguments['invoiceId'];
    fromBuy.value = Get.arguments['fromBuy'];
    getDetailInvoice();
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
      formattedDate.value = DateFormat('yyyy-MM-dd kk:mm:ss').format(resp.data.invoice.invoiceVa.vaExpiryDate);
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  Future madePayment() async {
    isLoadingForm(true);
    final resp = await _repo.postMadePayment(invoiceNumber.toString(), auth.token);
    if (resp.success) {
      successSnackbar('Status', resp.message);
      getDetailInvoice();
      buys.getBuys();
      auth.onInit();
      dash.onInit();
    } else {
      dialogConnection('Oops', resp.message, () {
        getDetailInvoice();
        Get.back();
      });
    }
    isLoadingForm(false);
  }
}
