import 'package:flutter_xaurius/app/data/model/top_up/resp_detail_topup/resp_detail_invoice_top.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_xaurius/app/modules/top_up/controllers/top_up_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TopUpDetailController extends GetxController {
  ApiRepository _repo = ApiRepository();
  final auth = Get.find<AuthController>();
  final topUp = Get.find<TopUpController>();
  final dash = Get.find<DashboardController>();
  var responseDetailInvoices = ResponseDetailInvoiceTopUp().obs;
  var isLoading = false.obs;
  var isLoadingForm = false.obs;
  var formattedDate = ''.obs;
  var invoiceId;

  @override
  void onInit() {
    invoiceId = Get.arguments;
    getDetailInvoices();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void getDetailInvoices() async {
    isLoading(true);
    final resp = await _repo.getDetailInvoices(invoiceId.toString(), auth.token);
    if (resp.success) {
      responseDetailInvoices(resp);
      formattedDate.value = DateFormat('yyyy-MM-dd kk:mm:ss').format(resp.data.invoice.invoiceVa.vaExpiryDate);
    } else {
      Get.back();
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  Future madePayment() async {
    isLoadingForm(true);
    final resp = await _repo.postMadePayment(invoiceId.toString(), auth.token);
    if (resp.success) {
      successSnackbar('Status', resp.message);
      getDetailInvoices();
      topUp.onInit();
      auth.getProfileData();
      dash.onInit();
    } else {
      dialogConnection('Oops', resp.message, () {
        getDetailInvoices();
        topUp.onInit();
        auth.getProfileData();
        Get.back();
      });
    }
    isLoadingForm(false);
  }
}
