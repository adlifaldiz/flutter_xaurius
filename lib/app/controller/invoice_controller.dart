import 'dart:async';
import 'dart:io';

import 'package:flutter_xaurius/helper/dialog_utils.dart';
import 'package:flutter_xaurius/model/buys/response_detail_invoice_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:get/get.dart';

class InvoiceController extends GetxController {
  ApiProvider provider = ApiProvider();
  var responseDetailInvoice = ResponseDetailInvoice().obs;

  var isLoadingForm = false.obs;
  var isTimeoutForm = false.obs;
  var isNoConnectionForm = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future getDetailInvoice(invoiceId) async {
    isLoadingForm(true);
    try {
      var getInvoice = await provider.getDetailInvoice(invoiceId);
      if (getInvoice == null) {
        responseDetailInvoice.value.success = false;
        responseDetailInvoice.value.msg = 'Terjadi masalah';
      } else {
        responseDetailInvoice.value = getInvoice;
      }
    } on TimeoutException {
      isTimeoutForm(true);
      isLoadingForm(false);
      dialogConnection('Oops', 'Waktu habis', () {
        Get.back();
        isTimeoutForm(false);
      });
    } on SocketException {
      isNoConnectionForm(true);
      isLoadingForm(false);
      dialogConnection('Oops', 'Tidak ada koneksi internet', () {
        Get.back();
        isNoConnectionForm(false);
      });
    } finally {
      isLoadingForm(false);
      isTimeoutForm(false);
      isNoConnectionForm(false);
      if (responseDetailInvoice.value.success) {
        // successSnackbar('Sukses', responseCreateBuy.value.data.buy.id.toString());
      } else {
        failSnackbar('Fail', responseDetailInvoice.value.msg);
      }
    }
    update();
  }
}
